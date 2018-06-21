package cn.hqisgood.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
import cn.hqisgood.service.ManagerService;

@Controller
public class ManagerController {
	@Autowired
	ManagerService managerService;
	/**
	 * 查询管理员分页查询
	 * @return
	 */
	
//	@RequestMapping(value="/managers")
	public String getManager(@RequestParam(value="pn", defaultValue="1")Integer pn, Model model) {
		PageHelper.startPage(pn, 5);
		List managers = managerService.getAll();
		PageInfo pageInfo = new PageInfo(managers, 3);
		model.addAttribute("pageInfo", pageInfo);

		return "list_m";
	}
	
	@RequestMapping(value="/managers")
	@ResponseBody
	public Msg getManagerWithJson(@RequestParam(value="pn", defaultValue="1")Integer pn) {
		PageHelper.startPage(pn, 5);
		List managers = managerService.getAll();
		PageInfo pageInfo = new PageInfo(managers, 3);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping(value="/searchM")
	@ResponseBody
	public Msg selectManagers(Manager m) {
		List managers = managerService.selectManagers(m);
//		PageHelper.startPage(1, 5);
//		List managers = managerService.getAll();
//		PageInfo pageInfo = new PageInfo(managers, 3);
//		return Msg.success().add("pageInfo", pageInfo);
		return Msg.success().add("ms", managers);
	}
	
	
	@RequestMapping(value="/addManager")
	@ResponseBody
	public Msg addManager(@RequestBody Manager manager) {
		manager = managerService.addOne(manager);
		return Msg.success().add("newManager", manager);
	}
	
	
	
	@RequestMapping(value="/updateManager/{id}", method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateManager(Manager manager) {
		boolean result = managerService.updateOne(manager);
		if (result) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	/**
	 * 1-1-1 批量删除
	 * 1     删除一条记录
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="/delManagerById/{ids}", method=RequestMethod.DELETE)
	@ResponseBody
	public Msg delManagerById(@PathVariable("ids")String ids) {
		int result = 0;
		if (ids.contains("-")) {
			result = managerService.delBatch(ids);
		}else {
			result = managerService.delManagerById(Integer.parseInt(ids));
		}
		if (result > 0) {
			return Msg.success();
		}
		return Msg.fail();
		
	}
}
