package kr.co.orphan.bookInfo.service;

import kr.co.orphan.bookInfo.mapper.BookInfoMapper;
import kr.co.orphan.user.mapper.MainMapper;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service
public class BookInfoService {

	@Autowired
	BookInfoMapper bookInfoMapper;

	public List<Map<String,Object>> selectBookInfoList(Map<String,Object> param) throws Exception {
		return bookInfoMapper.selectBookInfoList(param);
	}

	public Map<String,Object> selectBookInfoView(Map<String,Object> param) throws Exception {
		return bookInfoMapper.selectBookInfoView(param);
	}

	public int selectBookInfoListTotCnt(Map<String,Object> param) throws Exception {
		return bookInfoMapper.selectBookInfoListTotCnt(param);
	}

	public int deleteBookInfo(Map<String,Object> param) throws Exception {
		return bookInfoMapper.deleteBookInfo(param);
	}

	public int insertBookInfo(Map<String,Object> param) throws Exception {
		return bookInfoMapper.insertBookInfo(param);
	}

	public int updateBookInfo(Map<String,Object> param) throws Exception {
		return bookInfoMapper.updateBookInfo(param);
	}

}
