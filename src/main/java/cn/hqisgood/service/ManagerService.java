package cn.hqisgood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import cn.hqisgood.dao.ManagerMapper;

@Service
public class ManagerService {

	@Autowired
	ManagerMapper managerMapper;
	
	/**
	 * 查询所有管理员
	 * @return
	 */
	public List getAll() {
		return managerMapper.selectByExampleWithDept(null);
	}
	
}
