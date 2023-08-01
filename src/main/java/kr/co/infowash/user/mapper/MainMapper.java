package kr.co.infowash.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MainMapper {

    public List<Map<String,Object>> selectInfoWashList(Map<String,Object> param) throws Exception;

    public void insertWashInfo(Map<String, Object> param) throws Exception;

    public List<Map<String,Object>> selectGroupBySido(Map<String,Object> param) throws Exception;

    public List<Map<String,Object>> selectGroupBySiGunGu(Map<String,Object> param) throws Exception;

    int selectInfoWashTypeCount(Map<String,Object> param) throws Exception;

    int selectInfoWashCnt(Map<String,Object> param) throws Exception;

}
