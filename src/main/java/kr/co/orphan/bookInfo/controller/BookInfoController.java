package kr.co.orphan.bookInfo.controller;

import kr.co.orphan.bookInfo.service.BookInfoService;
import kr.co.orphan.common.CommandMap;
import kr.co.orphan.common.CommonUtil;
import kr.co.orphan.common.POIUtil;
import kr.co.orphan.user.service.MainService;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.ss.util.CellRangeAddressList;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping(value="/mngr/bookInfo")
public class BookInfoController {

	@Autowired
	BookInfoService bookInfoService;
	
	//도서정보 목록
	@RequestMapping(value="/bookInfoList")
    public String bookInfoList(@RequestParam Map<String, Object> param, ModelMap model) throws Exception{

		int limit = 10;
		if(param.get("limit") !=null){
			limit = Integer.parseInt(param.get("limit").toString());
		}
		int nowPage = 1;
		if(param.get("nowPage") != null && !"".equals(param.get("nowPage").toString())){
			nowPage = Integer.parseInt(param.get("nowPage").toString());
		}
		int offset = (nowPage-1) * limit;
		param.put("limit",limit);
		param.put("nowPage",nowPage);
		param.put("offset",offset);

		if(param.get("nowPage") == null) {
			param.put("nowPage", "1");
		}
		param.put("totalCnt", bookInfoService.selectBookInfoListTotCnt(param));
		List<Map<String,Object>> bookInfoList = bookInfoService.selectBookInfoList(param);
		model.addAttribute("bookInfoList", bookInfoList);
		model.addAttribute("resultMap", param);

    	return "mngr/bookInfo/bookInfo_list";
    }

	//도서정보 상세
	@RequestMapping(value="/bookInfoView")
	public String bookInfoView(@RequestParam Map<String, Object> param, ModelMap model) throws Exception{

		Map<String,Object> bookInfoView = bookInfoService.selectBookInfoView(param);
		model.addAttribute("bookInfoView", bookInfoView);
		model.addAttribute("resultMap", param);

		return "mngr/bookInfo/bookInfo_view";
	}


	@RequestMapping(value="/insertBookInfo")
	public String insertBookInfo(@RequestParam Map<String, Object> param, ModelMap model) throws Exception{

		return "mngr/bookInfo/bookInfo_input";
	}

	@ResponseBody
	@RequestMapping(value = "/insertBookInfoProc")
	public int insertBookInfoProc(@RequestParam Map<String,Object> paramMap)
			throws Exception {
		int result = 0;
		result = bookInfoService.insertBookInfo(paramMap);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/checkDeleteBookInfo")
	public int checkDeleteBookInfo(@RequestParam Map<String,Object> paramMap, @RequestParam(value="chkSeq") String[] arr, ModelMap model, HttpServletResponse response)
			throws Exception {
		int result = 0;
		for(int i=0; i<arr.length; i++) {
			paramMap.put("seq", arr[i]);
			result = bookInfoService.deleteBookInfo(paramMap);
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/updateBookInfo")
	public int updateBookInfo(@RequestParam Map<String,Object> paramMap)
			throws Exception {
		int result = bookInfoService.updateBookInfo(paramMap);
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteBookInfo")
	public int deleteBookInfo(@RequestParam Map<String,Object> paramMap)
			throws Exception {
		int result = bookInfoService.deleteBookInfo(paramMap);
		return result;
	}
	@RequestMapping(value = "/excelDown", method = RequestMethod.POST)
	public void excelDown(@RequestParam Map<String,Object> paramMap,HttpServletResponse response)
			throws Exception {
		try {
			paramMap.put("excelDown", "excel");
			List<Map<String, Object>> excelDataList = bookInfoService.selectBookInfoList(paramMap);

			response.setContentType("application/octet-stream;charset=UTF-8");
			response.reset();
			response.setHeader("Content-Type", "application/octet-stream; charset=UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename=bookInfoList.xlsx");
			response.setHeader("Content-Transfer-Encoding", "binary;");
			response.setHeader("Pragma", "no-cache;");
			response.setHeader("Expires", "-1;");
			OutputStream fileOut = null;

			XSSFWorkbook wb = new XSSFWorkbook();
			XSSFFont headerFont = wb.createFont();
			XSSFFont cellFont = wb.createFont();

			// Fonts are set into a style so create a new one to use.
			// title style
			XSSFCellStyle headerStyle = wb.createCellStyle();
			headerStyle = POIUtil.setHeaderStyleXSSF(headerFont, headerStyle);
			headerFont.setColor(new XSSFColor(new java.awt.Color(0, 0, 0)));
			// white cell
			XSSFCellStyle cellWhiteStyle = wb.createCellStyle();
			cellWhiteStyle = POIUtil.setWhiteCellStyleXSSF(cellFont, cellWhiteStyle);

			XSSFSheet sheet = wb.createSheet("bookInfoList");

			XSSFDataValidationHelper dvHelper = new XSSFDataValidationHelper(sheet);

			XSSFRow row = null;
			XSSFCell cell = null;
			int cellCnt = 0;

			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			row = sheet.createRow(0);
			cellCnt = 0;
			sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 2)); //열시작, 열종료, 행시작, 행종료 (자바배열과 같이 0부터 시작)
			POIUtil.setStyleCellXSSF(row, cell, cellWhiteStyle, cellCnt++, "다운로드 일시 : " + sdf.format(now).toString());

			row = sheet.createRow(1);
			cellCnt = 0;
			POIUtil.setStyleCellXSSF(row, cell, headerStyle, cellCnt++, "번호");
			POIUtil.setStyleCellXSSF(row, cell, headerStyle, cellCnt++, "도서명");
			POIUtil.setStyleCellXSSF(row, cell, headerStyle, cellCnt++, "저자명");
			POIUtil.setStyleCellXSSF(row, cell, headerStyle, cellCnt++, "출판사");
			POIUtil.setStyleCellXSSF(row, cell, headerStyle, cellCnt++, "발행년도");
			POIUtil.setStyleCellXSSF(row, cell, headerStyle, cellCnt++, "제어번호");
			POIUtil.setStyleCellXSSF(row, cell, headerStyle, cellCnt++, "대여횟수");
			POIUtil.setStyleCellXSSF(row, cell, headerStyle, cellCnt++, "등록일자");

			int rowIndex = 1;
			if (excelDataList != null) {
				for (int i = 0; i < excelDataList.size(); i++) {
					Map<String, Object> excelData = excelDataList.get(i);

					row = sheet.createRow((rowIndex++) + 1);

					POIUtil.setStyleCellXSSF(row, cell, cellWhiteStyle, 0, rowIndex);
					POIUtil.setStyleCellXSSF(row, cell, cellWhiteStyle, 1, (String) excelData.get("bookTitle"));
					POIUtil.setStyleCellXSSF(row, cell, cellWhiteStyle, 2, (String) excelData.get("bookAuthor"));
					POIUtil.setStyleCellXSSF(row, cell, cellWhiteStyle, 3, (String) excelData.get("bookPublisher"));
					POIUtil.setStyleCellXSSF(row, cell, cellWhiteStyle, 4, Integer.parseInt(excelData.get("publicationYear").toString()));
					POIUtil.setStyleCellXSSF(row, cell, cellWhiteStyle, 5, (String) excelData.get("controlNo"));
					POIUtil.setStyleCellXSSF(row, cell, cellWhiteStyle, 6, Integer.parseInt(excelData.getOrDefault("stockQuantity","0").toString()));
					POIUtil.setStyleCellXSSF(row, cell, cellWhiteStyle, 7, new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(excelData.get("createdDate")));
				}
			}
			fileOut = response.getOutputStream();
			wb.write(fileOut);
			if (fileOut != null)
				fileOut.close();
		}catch (Exception e){
			e.printStackTrace();
		}

	}


}
