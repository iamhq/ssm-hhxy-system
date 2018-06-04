package cn.hqisgood.dao;

import cn.hqisgood.bean.Manager;
import cn.hqisgood.bean.ManagerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ManagerMapper {
    long countByExample(ManagerExample example);

    int deleteByExample(ManagerExample example);

    int deleteByPrimaryKey(Integer managerId);

    int insert(Manager record);

    int insertSelective(Manager record);

    List<Manager> selectByExample(ManagerExample example);

    Manager selectByPrimaryKey(Integer managerId);
    
    List<Manager> selectByExampleWithDept(ManagerExample example);

    Manager selectByPrimaryKeyWithDept(Integer managerId);

    int updateByExampleSelective(@Param("record") Manager record, @Param("example") ManagerExample example);

    int updateByExample(@Param("record") Manager record, @Param("example") ManagerExample example);

    int updateByPrimaryKeySelective(Manager record);

    int updateByPrimaryKey(Manager record);
}