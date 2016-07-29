package com.yc.easy.trade.test.demo;

import java.io.File;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class TestExcel {

	public static void main(String[] args) throws Exception  {
		writeExcel();
	}
	
	public static void writeExcel() throws Exception{
		// 1、创建WritableWorkbook对象  
        File file = new File("G://write.xls"); 
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
        oWritableBK.write();  
        oWritableBK.close(); 
	    
	    
	}

}
