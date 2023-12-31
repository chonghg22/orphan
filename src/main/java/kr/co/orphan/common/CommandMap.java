package kr.co.orphan.common;


import com.google.common.base.CaseFormat;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

public class CommandMap extends HashMap {

	private static final long serialVersionUID = 1l;

	public Object put(Object key, Object value){
		return super.put(CaseFormat.UPPER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL,(String) key),value);
	}

}
