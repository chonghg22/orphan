package kr.co.orphan.bookInfo.controller;

import kr.co.orphan.bookInfo.service.BookInfoService;
import kr.co.orphan.common.CommandMap;
import kr.co.orphan.common.CommonUtil;
import kr.co.orphan.user.service.MainService;
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
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
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

}
