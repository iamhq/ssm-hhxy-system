package cn.hqisgood.dao;

import cn.hqisgood.bean.SuperManager;
import cn.hqisgood.bean.SuperManagerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SuperManagerMapper {
    long countByExample(SuperManagerExample example);

    int deleteByExample(SuperManagerExample example);

    int deleteByPrimaryKey(Integer superId);

    int insert(SuperManager record);

    int insertSelective(SuperManager record);

    List<SuperManager> selectByExample(SuperManagerExample example);

    SuperManager selectByPrimaryKey(Integer superId);

    int updateByExampleSelective(@Param("record") SuperManager record, @Param("example") SuperManagerExample example);

    int updateByExample(@Param("record") SuperManager record, @Param("example") SuperManagerExample example);

    int updateByPrimaryKeySelective(SuperManager record);

    int updateByPrimaryKey(SuperManager record);
}