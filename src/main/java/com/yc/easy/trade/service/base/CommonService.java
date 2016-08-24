package com.yc.easy.trade.service.base;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;

import jxl.SheetSettings;
import jxl.Workbook;
import jxl.write.Alignment;
import jxl.write.Border;
import jxl.write.BorderLineStyle;
import jxl.write.Label;
import jxl.write.VerticalAlignment;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

@SuppressWarnings({"deprecation" })
@Service("commonService")
public class CommonService{
	/**
	 * 
	  * @Title exportExcel
	  * @Description 导出excel
	  * @author yanghuiping
	  * @param @param request
	  * @param @param response
	  * @param @param fileName
	  * @param @param map
	  * @param @param objectList
	  * @param @return    设定文件
	  * @return String    返回类型
	  * @throws
	  * @date 2016年8月24日 下午5:00:52
	 */
	public String exportExcel(HttpServletRequest request,HttpServletResponse response, String fileName, Map<String,Object> map, List<HashMap<String,Object>> objectList) {
		String result = "系统提示：Excel文件导出成功！";
		WritableWorkbook workbook = null;
		try {
			// 定义输出流，以便打开保存对话框______________________begin
			OutputStream outputStream = response.getOutputStream();// 取得输出流
			response.reset();// 清空输出流
			final String userAgent = request.getHeader("USER-AGENT");
			String finalFileName = null;
			if (StringUtils.contains(userAgent, "MSIE")) {// IE浏览器
				finalFileName = URLEncoder.encode(fileName, "UTF8");
			} else if (StringUtils.contains(userAgent, "Mozilla")) {// google,火狐浏览器
				if(StringUtils.contains(userAgent, "Firefox")){
					fileName = fileName.replace(" ", "");
				}
				finalFileName = new String(fileName.getBytes(), "ISO8859-1");
			} else {
				finalFileName = URLEncoder.encode(fileName, "UTF8");// 其他浏览器
			}
			response.setHeader("Content-disposition",
					"attachment; filename=" + finalFileName);// 设定输出文件头
			response.setContentType("application/msexcel");// 定义输出类型
			// 定义输出流，以便打开保存对话框_______________________end

			/** **********创建工作簿************ */
			workbook = Workbook.createWorkbook(outputStream);

			/** **********创建工作表************ */
			WritableSheet writableSheet = workbook.createSheet("sheet1", 0);

			/** **********设置纵横打印（默认为纵打）、打印纸***************** */
			SheetSettings sheetSettings = writableSheet.getSettings();
			sheetSettings.setProtected(false);

			/** ************设置单元格字体************** */
			WritableFont NormalFont = new WritableFont(WritableFont.ARIAL, 10);
			WritableFont BoldFont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD);

			/** ************以下设置三种单元格样式，灵活备用************ */
			// 用于标题居中
			WritableCellFormat wcf_center = new WritableCellFormat(BoldFont);
			wcf_center.setBorder(Border.ALL, BorderLineStyle.THIN); // 线条
			wcf_center.setVerticalAlignment(VerticalAlignment.CENTRE); // 文字垂直对齐
			wcf_center.setAlignment(Alignment.CENTRE); // 文字水平对齐
			wcf_center.setWrap(false); // 文字是否换行

			// 用于正文居左
			WritableCellFormat wcf_left = new WritableCellFormat(NormalFont);
			wcf_left.setBorder(Border.NONE, BorderLineStyle.THIN); // 线条
			wcf_left.setVerticalAlignment(VerticalAlignment.CENTRE); // 文字垂直对齐
			wcf_left.setAlignment(Alignment.LEFT); // 文字水平对齐
			wcf_left.setWrap(false); // 文字是否换行

			/** ***************以下是EXCEL开头大标题，暂时省略********************* */
			// sheet.mergeCells(0, 0, colWidth, 0);
			// sheet.addCell(new Label(0, 0, "XX报表", wcf_center));
			/** ***************以下是EXCEL第一行列标题********************* */
			Iterator<String> it = map.keySet().iterator();
			int i = 0;
			while (it.hasNext()) {
				Object object = it.next();
				writableSheet.addCell(new Label(i, 0, map.get(object).toString(), wcf_center));
				i++;
			}

			/** ***************以下是EXCEL正文数据********************* */

			int i1 = 1;
			for (Map<String,Object> map1 : objectList) {
				Iterator<String> itr = map.keySet().iterator();
				int j = 0;
				while (itr.hasNext()) {
					Object object = itr.next();
					Object obj = map1.get(object.toString());
					if (obj instanceof Date) {
						SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						writableSheet.addCell(new Label(j, i1, formatter.format(obj), wcf_center));
					} else {
						String strObj = obj == null ? "" : obj.toString();
						writableSheet.addCell(new Label(j, i1, strObj, wcf_center));
					}
					j++;
				}
				i1++;
			}
			workbook.write();
		} catch (Exception e) {
			result = "系统提示：Excel文件导出失败，原因：" + e.toString();
		} finally {
			try {
				/** *********关闭文件************* */
				workbook.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			} catch (WriteException e1) {
				e1.printStackTrace();
			}
		}
		return result;
	}
}
