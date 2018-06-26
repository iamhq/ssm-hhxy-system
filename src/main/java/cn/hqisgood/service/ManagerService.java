package cn.hqisgood.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import cn.hqisgood.bean.Department;
import cn.hqisgood.bean.Manager;
import cn.hqisgood.bean.ManagerExample;
import cn.hqisgood.bean.Teacher;
import cn.hqisgood.bean.User;
import cn.hqisgood.bean.ManagerExample.Criteria;
import cn.hqisgood.dao.DepartmentMapper;
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
	
	public Manager addOne(Manager manager) {
		managerMapper.add(manager);
		manager = managerMapper.selectByPrimaryKeyWithDept(manager.getManagerId());
		return manager;
	}

	public boolean updateOne(Manager manager) {
		boolean result = false;
		int i = managerMapper.updateByPrimaryKey(manager);
		if( i > 0) {
			result = true;
		}
		return result;
	}

	public int delManagerById(Integer id) {
		int result = managerMapper.deleteByPrimaryKey(id);
		return result;
	}

	

	public int delBatch(String ids) {
		ManagerExample example = new ManagerExample();
		Criteria criteria = example.createCriteria();
		
		String[] split = ids.split("-");
 		List<Integer> idList = new ArrayList<Integer>();
 		for (String id : split) {
 			idList.add(Integer.parseInt(id));
 		}
 		//delete id where id in(1,2,3)
 		criteria.andManagerIdIn(idList);
 		managerMapper.deleteByExample(example);
		return 0;
	}
	
	public Manager login(User user) {
		Integer id = user.getUserId();
		System.out.println("id = " + id);
		String password = user.getPassword();
		Manager m = managerMapper.selectByPrimaryKey(id);
		if (m == null) {
			System.out.println("查无此人");
			return null;
		}
		if (m.getManagerPassword().equals(password)) {
			return m;
		}else {
			return null;
		}
	}

	public List selectManagers(Manager m) {
		List<Manager> list =  managerMapper.search(m);
		return list;
	}
}
