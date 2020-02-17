package cn.edu.shu.web.interceptor;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

import cn.edu.shu.domain.User;

/**
 * 判断是否登录
 * @author Kev33N
 *
 */
public class UserInterceptor extends MethodFilterInterceptor {

	private static final long serialVersionUID = 5259282914530205883L;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");

		if (user == null) {
			return "login";
		}

		return invocation.invoke();
	}

}
