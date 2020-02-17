package cn.edu.shu.dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import cn.edu.shu.domain.PageBean;


@SuppressWarnings("all")
public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T> {
	
	//定义成员属性
	private Class clazz;
	
	public BaseDaoImpl() {
		//this表示子类，c表示的就是PatientDaoImpl的class对象
		Class c = this.getClass();
		//获取BaseDaoImpl<Patient>
		Type type = c.getGenericSuperclass();
		//把type转换成子接口
		if(type instanceof ParameterizedType) {
			ParameterizedType ptype = (ParameterizedType) type;
			//获取到Patient
			Type[] types = ptype.getActualTypeArguments();
			this.clazz = (Class) types[0];
		}
	}

	/**
	 * 添加
	 */
	public void save(T t) {
		this.getHibernateTemplate().save(t);
	}

	/**
	 * 删除
	 */
	public void delete(T t) {
		this.getHibernateTemplate().delete(t);
	}

	/**
	 * 更新
	 */
	public void update(T t) {
		this.getHibernateTemplate().update(t);
	}

	/**
	 * 通过主键查询
	 */
	public T findById(Long id) {
		return (T) this.getHibernateTemplate().get(clazz, id);
	}

	@Override
	public List<T> findAll() {
		return (List<T>) this.getHibernateTemplate().find("from "+clazz.getSimpleName());
	}

	/**
	 * 分页查询
	 */
	public PageBean<T> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		//创建分页对象
		PageBean<T> page = new PageBean<T>();
		page.setPageCode(pageCode);
		page.setPageSize(pageSize);
		
		//设置查询聚合函数：SQL变成select count(*) from
		criteria.setProjection(Projections.rowCount());
		List<Number> list = (List<Number>) this.getHibernateTemplate().findByCriteria(criteria);
		if(list != null && list.size()>0) {
			int totalCount = list.get(0).intValue();
			//总记录数
			page.setTotalCount(totalCount);
		}
		//清除SQL
		criteria.setProjection(null);
		
		List<T> beanList = (List<T>) this.getHibernateTemplate().findByCriteria(criteria, (pageCode-1)*pageSize, pageSize);
		//每页显示的数据
		page.setBeanList(beanList);
		return page;
	}

}
