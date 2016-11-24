package cn.user.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.table.User;
import cn.user.dao.UserDao;
import cn.util.Pager;

@Controller
@RequestMapping(value = "/user")
public class UserAction {

	@Resource
	private UserDao userdao;

	@RequestMapping(value = { "/login" })   // 验证用户登录
	public String login(Model model, String username, String password)
			throws Exception {
		// TODO Auto-generated method stub

		boolean result = userdao.login(username, password);
		return result ? "/Success.jsp" : "/Fail.jsp";

	}

	@RequestMapping(value = { "/register" })   // 提交注册信息，注册用户
	public String register(User user, Model model) throws Exception {
		// TODO Auto-generated method stub

		userdao.register(user);

		return "/success.jsp";
	}
	
	@RequestMapping(value = { "/delete" })   // 修改后进行提交
	public String delete(int userid, Model model) throws Exception {
		// TODO Auto-generated method stub

		userdao.delete(userid);

		return "/user/querypaging.action";
	}
 
	@RequestMapping(value = { "/modify" })   // 发出修改申请，跳转到正式修改的界面
	public String modify(int userid, Model model) throws Exception {
		// TODO Auto-generated method stub

		User user = userdao.getUerById(userid);
		model.addAttribute("user", user);
		return "/staff/modify.jsp";

	}
	@RequestMapping(value = { "/modifysubmit" })   // 修改后进行提交,只能修改密码，手机号，职位
	public String modifysubmit(User user, Model model) throws Exception {
		// TODO Auto-generated method stub

		userdao.modify(user);

		return "/user/querypaging.action";
	}

	@RequestMapping(value = { "/query" })   // 查询员工，可以通过员工编号和姓名查询，二者选一，若同时为空则表示查询所有记录
	public String QueryStaff(String userno, String name, Model model) {
		List<User> users = userdao.querystaff(userno, name);
		model.addAttribute("users", users);
		return "/staff/query.jsp";
	}
	
	
	@RequestMapping(value = { "/querypaging" })   // 查询员工，可以通过员工编号和姓名查询，二者选一，若同时为空则表示查询所有记录
	public String QueryStaff(String userno, String name,Pager pager, Model model) {
		List<User> users = userdao.querystaff(userno, name,pager);
		model.addAttribute("users", users);
		
		model.addAttribute("userno",userno);
		model.addAttribute("name", name);
		
		return "/staff/query.jsp";
	}
	

}
