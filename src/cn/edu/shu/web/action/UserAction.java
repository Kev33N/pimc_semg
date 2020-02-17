package cn.edu.shu.web.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ModelDriven;

import cn.edu.shu.domain.PageBean;
import cn.edu.shu.domain.Patient;
import cn.edu.shu.domain.User;
import cn.edu.shu.service.UserService;

public class UserAction extends BaseAction implements ModelDriven<User> {
	
	private static final long serialVersionUID = 1L;
	
	private User user = new User();

	@Override
	public User getModel() {
		return user;
	}
	
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	/**
	 * 初始化登陆页面
	 * @return
	 */
	public String initLoginUI() {
		return LOGIN;
	}
	
	/**
	 * 登陆功能
	 * @return
	 */
	public String login() {
		User existUser = userService.login(user);
		if(existUser==null) {
			this.setVs("errorMsg", "用户名或密码错误");
			return "loginError";
		}else {
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
			return "loginOK";
		}
	}
	
	/**
	 * 进入个人中心
	 * @return
	 */
	public String center() {
		return "center";
	}
	
	/**
	 * 初始化修改资料
	 * @return
	 */
	public String alterInfoUI() {
		return "alterInfoUI";
	}
	
	/**
	 * 修改资料
	 * @return
	 */
	public String alterInfo() {
		User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		existUser.setUser_name(user.getUser_name());
		existUser.setUser_phone(user.getUser_phone());
		existUser.setUser_email(user.getUser_email());
		userService.update(existUser);
		return "alterInfoOK";
	}
	
	/**
	 *初始化修改密码
	 * @return
	 */
	public String alterCodeUI() {
		return "alterCodeUI";
	}
	
	/**
	 *修改密码
	 * @return
	 */
	public String alterCode() {
		String oldPassword = ServletActionContext.getRequest().getParameter("user_oldPassword");
		User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(oldPassword==null || !oldPassword.equals(existUser.getUser_password())) {
			this.setVs("oldPasswordError", "oldPasswordError");
			return "oldPasswordError";
		}else {
			existUser.setUser_password(user.getUser_password());
			userService.update(existUser);
			ServletActionContext.getRequest().getSession().removeAttribute("existUser");
			return LOGIN;
		}
	}
	
	/**
	 * 退出功能
	 * @return
	 */
	public String exit() {
		ServletActionContext.getRequest().getSession().removeAttribute("existUser");
		return LOGIN;
	}
	
	/**
	 * 初始化注册页面
	 * @return
	 */
	public String initRegisterUI() {
		return "register";
	}
	
	/**
	 * 通过登录名判断是否存在该登录名
	 * @return
	 */
	public String checkCode() {
		//调用业务层，查询
		User u = userService.checkCode(user.getUser_code());
		//获取response对象
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		try {
			//获取输出流
			PrintWriter writer = response.getWriter();
			//进行判断
			if(u != null) {
				//登录名查询到用户，不能注册
				writer.print("no");
			}else {
				//不存在登录名，可以注册
				writer.print("yes");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return NONE;
	}
	
	/**
	 * 注册新账户
	 * @return
	 */
	public String regist() {
		user.setUser_state("0");
		user.setUser_admin("0");
		userService.save(user);
		return LOGIN;
	}
	
	/**
	 * 按条件分页查询user
	 * @return
	 */
	public String findByPage() {
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		//获取到用户的姓名
		String user_name = user.getUser_name();
		if(user_name != null && !user_name.trim().isEmpty()) {
			criteria.add(Restrictions.like("user_name", "%"+user_name+"%"));
		}
		//调用业务层
		PageBean<User> page = userService.findByPage(this.getPageCode(),this.getPageSize(),criteria);
		//压栈
		this.setVs("page", page);
		return "page";
	}
	
	/**
	 * 冻结账户
	 * @return
	 */
	public String freezeAccount() {
		user = userService.findUserById(user.getUser_id());
		user.setUser_state("0");
		userService.save(user);
		return "freeze";
	}
	
	/**
	 * 激活帐户
	 * @return
	 */
	public String activateAccount() {
		user = userService.findUserById(user.getUser_id());
		user.setUser_state("1");
		userService.save(user);
		return "activate";
	}
	
	public String deleteUser() {
		user = userService.findUserById(user.getUser_id());
		userService.deleteUser(user);
		return "deleteOk";
	}

}
