package cn.edu.shu.web.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import cn.edu.shu.domain.User;

public class UserAdminInterceptor extends MethodFilterInterceptor {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("existUser");
		
		if(user == null || user.getUser_state().equals("0") || user.getUser_admin().equals("0")) {
			return "NonAdmin";
		}
		
		return invocation.invoke();
	}

}
