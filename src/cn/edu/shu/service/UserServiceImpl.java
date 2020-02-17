package cn.edu.shu.service;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.shu.dao.UserDao;
import cn.edu.shu.domain.PageBean;
import cn.edu.shu.domain.Patient;
import cn.edu.shu.domain.User;

@Transactional
public class UserServiceImpl implements UserService {

	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


	@Override
	public User login(User user) {
		return userDao.login(user);
	}


	@Override
	public User checkCode(String user_code) {
		return userDao.checkCode(user_code);
	}


	@Override
	public void save(User user) {
		userDao.save(user);
	}


	@Override
	public PageBean<User> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		return userDao.findByPage(pageCode, pageSize, criteria);
	}


	@Override
	public User findUserById(Long user_id) {
		return userDao.findById(user_id);
	}


	@Override
	public void deleteUser(User user) {
		userDao.delete(user);
	}


	@Override
	public void update(User existUser) {
		userDao.update(existUser);
	}

}
