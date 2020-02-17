package cn.edu.shu.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.edu.shu.domain.Action;
import cn.edu.shu.domain.PageBean;

public interface ActionService {
	
	PageBean<Action> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

	Action findById(Long long1);

	void update(Action action);

	List<Action> findAll();

	void saveAction(Action action);

	void deleteAction(Action action);

}
