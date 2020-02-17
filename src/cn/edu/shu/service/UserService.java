package cn.edu.shu.service;

import org.hibernate.criterion.DetachedCriteria;

import cn.edu.shu.domain.PageBean;
import cn.edu.shu.domain.User;

public interface UserService {

	User login(User user);

	User checkCode(String user_code);

	void save(User user);

	PageBean<User> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

	User findUserById(Long user_id);

	void deleteUser(User user);

	void update(User existUser);

}
