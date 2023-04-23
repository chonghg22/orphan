package kr.co.infowash.user.controller;

import com.google.gson.JsonObject;
import kr.co.infowash.common.CommandMap;
import kr.co.infowash.common.CommonUtil;
import kr.co.infowash.user.service.MainService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller

public class MainController {

	@Autowired
	MainService mainService;
	@RequestMapping(value="/")
    public String mainList(Map<String, Object> map, ModelMap model, HttpServletResponse response, HttpServletRequest request) throws Exception{
		Map<String, Object> param = CommandMap.washMap(request);
		List<Map<String,Object>> selectLocalInfoWashCount = mainService.selectLocalInfoWashCount(param);
		model.addAttribute("selectLocalInfoWashCount", selectLocalInfoWashCount);
		model.addAttribute("infoList", CommonUtil.youtubeClient(9,"셀프세차"));

    	return "main/main";
    }

	@ResponseBody
	@RequestMapping(value = "/imgUploadSingle", method = RequestMethod.POST)
	public Map<String, Object> imgUploadSingle(MultipartHttpServletRequest req) {
		Map<String, Object> params = new HashMap<>();
		String sendDateyyyyMMdd = CommonUtil.getDatePattern("yyyyMMdd");
		try {
			if(req != null) {
				Map<String, Object> result = CommonUtil.fileUpload(req.getFileMap(),"C:/fileUpload/" + sendDateyyyyMMdd);
				//원본파일명
				String fileOrgName = result.get("fileOrgName").toString();
				//저장될 파일명
				String fileSaveName = result.get("fileSaveName").toString();
				//파일 저장 경로
				String filePath = result.get("filePath").toString();
				//파일 확장자
				String fileExt = result.get("fileExt").toString();
				//파일 사이즈
				String fileSize = result.get("fileSize").toString();
			}
		} catch (Exception e) {
			System.out.println("에러발생::"+e);
		}
		return params;
	}



	@ResponseBody
	@RequestMapping(value = "/hdExcelUpload")
	public void excelUpload(ModelMap model, MultipartHttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException, RuntimeException, NoSuchAlgorithmException {
		System.out.println("접근");
				
		mainService.insertBookInfoHdExcel(request, response);
	}

	@RequestMapping(value="/admin")
	public String admin(Map<String, Object> map, ModelMap model, HttpServletResponse response, HttpServletRequest request) throws Exception{

		Map<String, Object> param = CommandMap.washMap(request);


		return "main/admin";
	}
	
}
