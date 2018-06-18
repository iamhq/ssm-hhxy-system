package cn.hqisgood.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hqisgood.bean.SuperManager;
import cn.hqisgood.bean.Teacher;
import cn.hqisgood.bean.User;
import cn.hqisgood.dao.TeacherMapper;

@Service
public class TeacherService {
	@Autowired
	TeacherMapper teacherMapper;
	
	public Teacher login() {
		return null;
		
	}

	public Teacher login(User user) {
		Integer id = user.getUserId();
		System.out.println("id = " + id);
		String password = user.getPassword();
		Teacher t = teacherMapper.selectByPrimaryKey(id);
		if (t == null) {
			System.out.println("查无此人");
			return null;
		}
		if (t.getTeacherPassword().equals(password)) {
			return t;
		}else {
			return null;
		}
	}
}
