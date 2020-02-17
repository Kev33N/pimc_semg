package cn.edu.shu.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;
import cn.edu.shu.dao.ActionDao;
import cn.edu.shu.domain.Action;
import cn.edu.shu.domain.PageBean;

@Transactional
public class ActionServiceImpl implements ActionService {
	
	private ActionDao actionDao;

	public void setActionDao(ActionDao actionDao) {
		this.actionDao = actionDao;
	}

	@Override
	public PageBean<Action> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		return actionDao.findByPage(pageCode, pageSize, criteria);
	}

	@Override
	public Action findById(Long action_id) {
		return actionDao.findById(action_id);
	}

	@Override
	public void update(Action action) {
		actionDao.update(action);
	}

	@Override
	public List<Action> findAll() {
		return actionDao.findAll();
	}

	@Override
	public void saveAction(Action action) {
		actionDao.save(action);
	}

	@Override
	public void deleteAction(Action action) {
		actionDao.delete(action);
	}
	

}
