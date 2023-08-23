package kr.co.orphan.common;


import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

public class CommandMap {

	public static Map<String, Object> washMap(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<>();

		Enumeration<String> en = request.getParameterNames();
		while ( en.hasMoreElements() ){
			String key    = en.nextElement();
			String value  = request.getParameter(key);
			param.put(key , value);
		}

		return param;
	}

}
