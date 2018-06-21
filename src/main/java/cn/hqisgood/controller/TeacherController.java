package cn.hqisgood.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.hqisgood.bean.Manager;
import cn.hqisgood.bean.Msg;
import cn.hqisgood.bean.Teacher;
import cn.hqisgood.service.TeacherService;

@Controller
public class TeacherController {
	@Autowired
	TeacherService teacherService;
	
	@RequestMapping("/teachers")
	@ResponseBody
	public Msg getTeachers(@RequestParam(value="pn", defaultValue="1")Integer pn) {
		PageHelper.startPage(pn, 5);
		List teachers = teacherService.getAll();
		PageInfo pageInfo = new PageInfo(teachers, 3);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping(value="/updateTeacher/{id}", method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateTeacher(Teacher teacher) {
		boolean result = teacherService.updateOne(teacher);
		if (result) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	//addTeacher
	
	@RequestMapping(value="/addTeacher")
	@ResponseBody
	public Msg addTeacher(@RequestBody Teacher teacher) {
		teacher = teacherService.addOne(teacher);
		return Msg.success().add("newManager", teacher);
	}
	
	
}
