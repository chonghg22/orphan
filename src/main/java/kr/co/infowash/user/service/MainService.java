package kr.co.infowash.user.service;

import kr.co.infowash.user.mapper.MainMapper;
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
public class MainService {

	@Autowired
	MainMapper mainMapper;

	public void insertBookInfoHdExcel(MultipartHttpServletRequest request, HttpServletResponse response) throws IOException, SQLException{
		MultipartFile mFile = null;
		Map<String, MultipartFile> fileMap = request.getFileMap();
		System.out.println("fileMap::"+fileMap);
		Iterator keyData = fileMap.keySet().iterator();


		while (keyData.hasNext()) {
			String key = ((String) keyData.next());
			mFile = fileMap.get(key);

			XSSFWorkbook wb = new XSSFWorkbook(mFile.getInputStream());

			int check = 0;
			// 첫번째 sheet 저작물 정보

			try {
				for (int i = 0; i < 1; i++) {
					for (Row row : wb.getSheetAt(i)) {
						if (check != 0) {

							Map<String, Object> param = new HashMap<>();

							Cell cell = null;
							//사업장명
							param.put("corpName",row.getCell(1).toString());
							//시도명
							param.put("sido",row.getCell(2).toString());
							//시군구명
							param.put("sigungu",row.getCell(3).toString());
							//세차유형
							param.put("washType",row.getCell(5).toString());
							//주소
							param.put("address",row.getCell(6).toString());
							//연락처
							param.put("telNo",row.getCell(14).toString());
							//위도
							param.put("latitude",row.getCell(16).toString());
							//경도
							param.put("longitude",row.getCell(17).toString());
							mainMapper.insertWashInfo(param);

						}

						check++;
					}

				}

			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
	}

	public List<Map<String,Object>> selectLocalInfoWashCount(Map<String,Object> param) throws Exception {
		return mainMapper.selectLocalInfoWashCount(param);

	}
}
