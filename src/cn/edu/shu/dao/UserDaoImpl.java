package cn.edu.shu.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import cn.edu.shu.domain.User;

public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	@Override
	public User login(User user) {
		DetachedCriteria criteria = DetachedCriteria.forClass(User.class);
		criteria.add(Restrictions.eq("user_code", user.getUser_code()));
		criteria.add(Restrictions.eq("user_password", user.getUser_password()));
//		criteria.add(Restrictions.eq("user_state", "1"));
		
		List<User> list = (List<User>) this.getHibernateTemplate().findByCriteria(criteria);
		
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		
		return null;
	}

	@Override
	public User checkCode(String user_code) {
		List<User> list = (List<User>) this.getHibernateTemplate().find("from User where user_code = ?", user_code);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

}
