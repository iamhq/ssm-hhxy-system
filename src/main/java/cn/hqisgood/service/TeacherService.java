package cn.hqisgood.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.hqisgood.bean.Teacher;
import cn.hqisgood.bean.TeacherExample;
import cn.hqisgood.bean.TeacherExample.Criteria;
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

	//插入老师
	public Boolean insert(Teacher teacher) {
		
		System.out.println("insert"+teacher.getTeacherEmail());
		int i = teacherMapper.insert(teacher);
		if (i > 0) {
			return true;
		} else {
			return false;
		}
	}

	public List getAll() {
		// TODO Auto-generated method stub
		return teacherMapper.selectByExampleWithDept(null);
	}

	public boolean updateOne(Teacher teacher) {
		boolean result = false;
		TeacherExample example = new TeacherExample();
		Criteria  criteria = example.createCriteria();
		criteria.andTeacherIdEqualTo(teacher.getTeacherId());
		
		int i = teacherMapper.updateByExampleSelective(teacher, example);
		if( i > 0) {
			result = true;
		}
		return result;
	}

	public Teacher addOne(Teacher teacher) {
		teacherMapper.add(teacher);
		teacher = teacherMapper.selectByPrimaryKeyWithDept(teacher.getTeacherId());
		return teacher;
	}

	
	
	public int delTeacherById(Integer id) {
		int result = teacherMapper.deleteByPrimaryKey(id);
		return result;
	}

}
