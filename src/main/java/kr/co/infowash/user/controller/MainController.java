package kr.co.infowash.user.controller;

import kr.co.infowash.common.CommandMap;
import kr.co.infowash.user.service.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;


@Controller
public class MainController {

	@Autowired
	MainService mainService;
//
//	@Autowired
//	MainService mainService;
//
//	@Autowired
//	MemberService memberService;
	
	@RequestMapping(value="/")
    public String mainList(Map<String, Object> map, ModelMap model, HttpServletResponse response, HttpServletRequest request) throws Exception{
		Map<String, Object> param = CommandMap.washMap(request);
		System.out.println(param.get("hello"));
		List<Map<String,Object>> selectLocalInfoWashCount = mainService.selectLocalInfoWashCount(param);
		model.addAttribute("selectLocalInfoWashCount", selectLocalInfoWashCount);

    	return "main/main";
    }

	@ResponseBody
	@RequestMapping(value = "/hdExcelUpload")
	public void excelUpload(ModelMap model, MultipartHttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException, RuntimeException, NoSuchAlgorithmException {
		System.out.println("접근");
				
		mainService.insertBookInfoHdExcel(request, response);
	}
	
//	@RequestMapping(value="/login.do")
//    public String loginView(CommandMap commandMap) throws Exception{
//
//    	return "user/main/login";
//    }
//
//	@RequestMapping(value="/contact.do")
//    public String contactView(CommandMap commandMap) throws Exception{
//
//    	return "user/main/contact";
//    }
//
//	@RequestMapping(value="/login_proc.do")
//    public String loginProc(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
//    	//추가 개발사항
//		//1.비밀번호 n번 이상 틀릴경우 로그인 못하게 막기
//		//2.추후  로그테이블 만들어서 로그인 이력 남기기
//		CommandMap commandMap = CommonUtil.getParameterEMap(request);
//		//MemberVO 객체 생성
//		MemberVO memberVO = new MemberVO();
//		//아이디를 입력하지 않고 로그인 버튼을 누를경우 alert창 호출
//		if("".equals(commandMap.get("member_id").toString())) {
//			HashMap<String, String> message = new HashMap<String, String>();
//			message.put("title","오류");
//			message.put("msg","아이디가 입력되지 않았습니다.");
//			message.put("scriptName","history.back();");
//			model.addAttribute("message", message);
//			return "comm/message/message";
//		}
//		//비밀번호를 입력하지 않고 로그인 버튼을 누를경우 alert창 호출
//		if("".equals(commandMap.get("member_pw").toString())) {
////			CommonUtil.NotificationMessage(model, "오류", "비밀번호가 입력되지 않았습니다.", "history.back();");
//			HashMap<String, String> message = new HashMap<String, String>();
//			message.put("title","오류");
//			message.put("msg","비밀번호가 입력되지 않았습니다.");
//			message.put("scriptName","history.back();");
//			model.addAttribute("message", message);
//			return "comm/message/message";
//		}
//		//이용자가 입력한 Id,Pw를 memberVO 변수에 넣음
//		memberVO.setMemberId(commandMap.get("member_id").toString());
//		//이용자가 입력한 비밀번호를 memberVO 변수에 넣을때 암호화 해서 넣음
//		memberVO.setMemberPw(CommonUtil.hexSha256(commandMap.get("member_pw").toString()));
//		MemberVO result = memberService.selectUserLoginView(memberVO);
//		if(result == null) {
//			HashMap<String, String> message = new HashMap<String, String>();
//			message.put("title","오류");
//			message.put("msg","로그인 정보를 확인 해 주세요.");
//			message.put("scriptName","history.back();");
//			model.addAttribute("message", message);
//			return "comm/message/message";
//		}
//		//로그인에 성공 할 경우 session에 로그인 한 유저의 정보를 저장
//		if(result != null) {
//			session.setAttribute("memberSession", memberVO);
//			session.setAttribute("memberSeq", result.getMemberSeq());
//			session.setAttribute("memberId", result.getMemberId());
//			session.setAttribute("memberNickName", result.getMemberNickname());
//		}
//		return "redirect:/index.do";
//    }
//
//	@RequestMapping(value="/logout_proc.do")
//    public String logoutProc(ModelMap model, HttpServletRequest request, HttpServletResponse response, HttpSession session, CommandMap commandMap) throws Exception {
//		RequestContextHolder.getRequestAttributes().removeAttribute("memberSession", RequestAttributes.SCOPE_SESSION);
//		session.invalidate();
//		return "redirect:/index.do";
//    }
	
	
}
