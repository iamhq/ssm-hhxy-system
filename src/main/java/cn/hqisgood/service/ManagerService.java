package cn.hqisgood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import cn.hqisgood.bean.Department;
import cn.hqisgood.bean.Manager;
import cn.hqisgood.dao.DepartmentMapper;
import cn.hqisgood.dao.ManagerMapper;

@Service
public class ManagerService {

	@Autowired
	ManagerMapper managerMapper;
//	@Autowired
//	DepartmentMapper departmentMapper;
	
	/**
	 * 查询所有管理员
	 * @return
	 */
	public List getAll() {
		return managerMapper.selectByExampleWithDept(null);
	}
	
	public Manager addOne(Manager manager) {
//		Integer departmentId = manager.getManagerDepartmentId();
//		System.out.println(departmentId);
//		departmentMapper.selectByPrimaryKey(departmentId );
		managerMapper.add(manager);
		manager = managerMapper.selectByPrimaryKeyWithDept(manager.getManagerId());
		return manager;
	}
	
}
