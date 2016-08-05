package com.yc.easy.trade.test.demo;

import java.io.File;

import jxl.Workbook;
import jxl.biff.FontRecord;
import jxl.format.CellFormat;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class TestExcel {

	public static void main(String[] args) throws Exception  {
		writeExcel();
	}
	
	public static void writeExcel() throws Exception{
		CellFormat cf = null;
		// 1、创建WritableWorkbook对象  
        File file = new File("G://杨慧平.xls"); 
        WritableWorkbook oWritableBK = Workbook.createWorkbook(file);  
  
        // 2、创建WritableSheet对象  
        WritableSheet oWritableSheet = oWritableBK.createSheet("测试sheet", 0);  
  
        // 3、添加单元格  
        Label label1 = new Label(0, 0, "test1");  
        oWritableSheet.addCell(label1); 
  
        Label label30 = new Label(3, 1, "我是合并后的单元格！");  
        oWritableSheet.addCell(label30);  
  
        //4、 合并单元格  
        oWritableSheet.mergeCells(3,1, 9, 1);// 参数说明，前两个参数为待合并的起始单元格位置，后两个参数用来指定结束单元格位置（列和行）  
        
        //5.加粗
        Label label31 = new Label(0,2,"我是加粗的");
        WritableFont bold = new WritableFont(WritableFont.ARIAL, 
        WritableFont.DEFAULT_POINT_SIZE,WritableFont.BOLD); 
        cf = new WritableCellFormat(bold); 
        label31.setCellFormat(cf);
        oWritableSheet.addCell(label31);
        
        //6.加下划线
        Label label32 = new Label(1,2,"我是加下划线的");
        WritableFont underline = new WritableFont(WritableFont.ARIAL,WritableFont.DEFAULT_POINT_SIZE, 
        	WritableFont.NO_BOLD, 
        	false, 
        	UnderlineStyle.SINGLE); 
        cf = new WritableCellFormat(underline); 
        label32.setCellFormat(cf);
        oWritableSheet.addCell(label32);
        
        //7.背景色
        WritableCellFormat newFormat = new WritableCellFormat();
        newFormat.setBackground(Colour.GREEN);
//        newFormat.setBorder(Border.ALL, BorderLineStyle.DOUBLE);
        Label label41 = new Label(0,3,"颜色及背景色",newFormat);
        oWritableSheet.addCell(label41);
        
        //8.字体颜色
        WritableFont font = new WritableFont(WritableFont.TIMES,12);//字体样式
        font.setColour(Colour.BLUE);
        WritableCellFormat fontFormat = new WritableCellFormat(font);
        Label label51 = new Label(0,4,"字体颜色",fontFormat);
        oWritableSheet.addCell(label51);
        
        oWritableBK.write();  
        oWritableBK.close(); 
	    
	    
	}

}
