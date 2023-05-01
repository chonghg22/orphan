package kr.co.infowash.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MainMapper {
    public void insertWashInfo(Map<String, Object> param) throws Exception;

    public List<Map<String,Object>> selectGroupBySido(Map<String,Object> param) throws Exception;

    public List<Map<String,Object>> selectGroupBySiGunGu(Map<String,Object> param) throws Exception;

    public int selectInfoWashTypeCount(Map<String,Object> param) throws Exception;

}
