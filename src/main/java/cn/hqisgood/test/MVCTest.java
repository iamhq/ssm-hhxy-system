package cn.hqisgood.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;

import cn.hqisgood.bean.Manager;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml", "file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCTest {
	@Autowired
	WebApplicationContext context;
	MockMvc mockMvc;
	
	@Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
		System.out.println("init");
	}
	
	@Test
	public void testPage() throws Exception {
		MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/managers").param("pn", "1")).andReturn();
	
		MockHttpServletRequest request =  mvcResult.getRequest();
		PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
		System.out.println("当前页: " + pi.getPageNum());
		System.out.println("当前总记录: " + pi.getTotal());
		System.out.println("当前总页码: " + pi.getPages());
		System.out.println("连续页码: " );
		int[] nums = pi.getNavigatepageNums();
		for(int i : nums) {
			System.out.print(" " + i );
		}
		List<Manager> managers = pi.getList();
		System.out.println("\nlist: ");
		for(Manager m : managers) {
			System.out.println(m);
		}
		
	}
}
