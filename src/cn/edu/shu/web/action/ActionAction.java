package cn.edu.shu.web.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ModelDriven;

import cn.edu.shu.domain.Action;
import cn.edu.shu.domain.PageBean;
import cn.edu.shu.domain.Patient;
import cn.edu.shu.service.ActionService;
import cn.edu.shu.utils.FastJsonUtil;

public class ActionAction extends BaseAction implements ModelDriven<Action> {

	private static final long serialVersionUID = 1L;
	
	private Action action = new Action();
	
	private ActionService actionService;

	public void setActionService(ActionService actionService) {
		this.actionService = actionService;
	}

	@Override
	public Action getModel() {
		return action;
	}
	
	/**
	 * 按条件分页查询action
	 * @return
	 */
	public String findByPage() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Action.class);
		//获取动作名称
		String action_name = action.getAction_name();
		if(action_name != null && !action_name.trim().isEmpty()) {
			criteria.add(Restrictions.like("action_name", "%"+action_name+"%"));
		}
		//调用业务层
		PageBean<Action> pageAction = actionService.findByPage(this.getPageCode(), this.getPageSize(), criteria);
		//压栈
		this.setVs("page", pageAction);
		return "page";
	}
	
	/**
	 * 跳转到初始详情页面
	 * @return
	 */
	public String initDetail() {
		action = actionService.findById(action.getAction_id());
		return "initDetail";
	}
	
	/**
	 * 跳转到初始修改页面
	 * @return
	 */
	public String initEditUI() {
		action = actionService.findById(action.getAction_id());
		return "initEdit";
	}
	
	public String update() {
		actionService.update(action);
		return "update";
	}
	
	/**
	 * 初始化新增评估动作
	 * @return
	 */
	public String initAddNewActionUI() {
		return "addNewActionUI";
	}
	
	/**
	 * 新增action
	 * @return
	 */
	public String saveAction() {
		actionService.saveAction(action);
		return "saveActionOk";
	}
	
	public String delete() {
		actionService.deleteAction(action);
		return "delete";
	}
	
	/**
	 * 查询所有action
	 */
	public String findAll() {
		List<Action> list = actionService.findAll();
		
		String jsonString = FastJsonUtil.toJSONString(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		FastJsonUtil.write_json(response, jsonString);
		return NONE;
	}

}
