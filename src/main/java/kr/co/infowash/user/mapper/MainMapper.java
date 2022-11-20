package kr.co.infowash.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface MainMapper {
    public void insertWashInfo(Map<String, Object> param) throws Exception;

    public List<Map<String,Object>> selectLocalInfoWashCount(Map<String,Object> param) throws Exception;
}
