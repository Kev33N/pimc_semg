package cn.edu.shu.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.edu.shu.domain.PageBean;


/**
 * 以后所有DAO的接口都需要继承BaseDao接口
 * 自定义泛型接口
 * @author Kev33N
 *
 */
public interface BaseDao<T> {
	
	public void save(T t);
	
	public void delete(T t);
	
	public void update(T t);
	
	public T findById(Long id);
	
	public List<T> findAll();
	
	public PageBean<T> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

}
