package cn.admin.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.admin.dao.AdminDao;
import cn.table.Admin;

@Controller
@RequestMapping(value = "/admin")
public class AdminAction {

	@Resource
	private AdminDao admindao;
    
	@RequestMapping(value = { "/login" })
	public String login(Model model,String username,String password) throws Exception {
		// TODO Auto-generated method stub

		String user=admindao.login(username, password);
		if(user!=null)model.addAttribute("user",user);
		return user!=null? "/index.jsp":"/login.jsp";
		
	}
	
	@RequestMapping(value = { "/register" })
	public String register(Admin admin,Model model) throws Exception {
		// TODO Auto-generated method stub


		admindao.register(admin);
		
		return "/success.jsp";
	}
	
	@RequestMapping(value = { "/delete" })
	public String delete(int adminid,Model model) throws Exception {
		// TODO Auto-generated method stub


		admindao.delete(adminid);
		
		
		return "/admin/query.action";
	}
	
	@RequestMapping(value = { "/query" })
	public String query(Model model) throws Exception {
		// TODO Auto-generated method stub


		List<Admin> admins=admindao.query();
		model.addAttribute("admins",admins);
		
		return "/admin/query.jsp";
	}

}
