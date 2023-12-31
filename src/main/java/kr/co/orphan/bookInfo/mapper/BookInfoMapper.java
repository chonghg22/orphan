package kr.co.orphan.bookInfo.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface BookInfoMapper {

    List<Map<String,Object>> selectBookInfoList(Map<String,Object> param) throws Exception;

    Map<String,Object> selectBookInfoView(Map<String,Object> param) throws Exception;

    int selectBookInfoListTotCnt(Map<String,Object> param) throws Exception;

    int deleteBookInfo(Map<String,Object> param) throws Exception;

    int insertBookInfo(Map<String,Object> param) throws Exception;

    int updateBookInfo(Map<String,Object> param) throws Exception;



}
