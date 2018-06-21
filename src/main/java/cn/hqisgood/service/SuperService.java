package cn.hqisgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.hqisgood.bean.Manager;
import cn.hqisgood.bean.SuperManager;
import cn.hqisgood.bean.User;
import cn.hqisgood.dao.SuperManagerMapper;

@Service
public class SuperService {
	@Autowired
	SuperManagerMapper managerMapper;
	
	public SuperManager login(User user) {
		Integer id = user.getUserId();
		String password = user.getPassword();
		SuperManager su = managerMapper.selectByPrimaryKey(id);
		if (su == null) {
			System.out.println("查无此人");
			return null;
		}
		if (su.getSuperPassword().equals(password)) {
			return su;
		}else {
			return null;
		}
	}
}
