package cn.hqisgood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hqisgood.bean.Department;
import cn.hqisgood.dao.DepartmentMapper;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;

	public List<Department> getDepts() {
		List<Department> list = departmentMapper.selectByExample(null);
		return list;
	}

	public Department getDept(Integer id) {
		Department dept = departmentMapper.selectByPrimaryKey(id);
		return dept;
	}

}
