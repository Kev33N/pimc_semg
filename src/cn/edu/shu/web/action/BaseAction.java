package cn.edu.shu.web.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

/**
 * Action父类
 * 
 * @author Kev33N
 *
 */
public class BaseAction extends ActionSupport {

	private static final long serialVersionUID = 2736308223315548464L;

	// 属性驱动方式
	// 当前页，默认值为1
	private Integer pageCode = 1;

	public void setPageCode(Integer pageCode) {
		if (pageCode == null) {
			pageCode = 1;
		}
		this.pageCode = pageCode;
	}

	// 每页显示的数据的条数
	private Integer pageSize = 7;

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageCode() {
		return pageCode;
	}

	public Integer getPageSize() {
		return pageSize;
	}
	
	/**
	 * 调用值栈对象的set方法
	 */
	public void setVs(String key,Object obj) {
		ActionContext.getContext().getValueStack().set(key, obj);
		
	}
	
	/**
	 * 调用值栈对象的push方法
	 */
	public void pushVs(Object obj) {
		ActionContext.getContext().getValueStack().push(obj);
		
	}

}
