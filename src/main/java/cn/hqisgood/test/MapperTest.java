package cn.hqisgood.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.hqisgood.bean.Manager;
import cn.hqisgood.bean.ManagerExample;
import cn.hqisgood.dao.ManagerMapper;

//import cn.hqisgood.bean.Manager;
//import cn.hqisgood.dao.ManagerMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {
	@Autowired
	ManagerMapper managerMapper;

	@Test
	public void select() {
		// ApplicationContext ioc = new
		// ClassPathXmlApplicationContext("applicationContext.xml");
		// ManagerMapper bean = ioc.getBean(ManagerMapper.class);
		System.out.println(managerMapper);
		ManagerExample example = new ManagerExample();
		example.setOrderByClause("manager_department_id asc");
		example.setDistinct(false);
		ManagerExample.Criteria criteria = example.createCriteria();
		criteria.andManagerIdBetween(1054801, 1054810);
		
		// Manager example = new Manager(1054801, "彭小宁", 1054801, "root");
		List<Manager> managers = managerMapper.selectByExampleWithDept(example);
		System.out.println("list:" + managers);

	}
}
