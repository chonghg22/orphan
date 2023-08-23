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
    public String noticeList(@RequestParam Map<String, Object> param, ModelMap model, HttpServletResponse response, HttpServletRequest request) throws Exception{

		int limit = 10;
		int nowPage = 1;
		if(param.get("nowPage") != null && !"".equals(param.get("nowPage").toString())){
			nowPage = Integer.parseInt(param.get("nowPage").toString());
		}
		int offset = (nowPage-1) * limit;
		param.put("limit",limit);
		param.put("nowPage",nowPage);
		param.put("offset",offset);
		param.put("totalCnt", bookInfoService.selectBookInfoListTotCnt(param));
		if(param.get("nowPage") == null) {
			param.put("nowPage", "1");
		}

		List<Map<String,Object>> bookInfoList = bookInfoService.selectBookInfoList(param);
		model.addAttribute("bookInfoList", bookInfoList);
		model.addAttribute("resultMap", param);

    	return "mngr/bookInfo/bookInfo_list";
    }
}
