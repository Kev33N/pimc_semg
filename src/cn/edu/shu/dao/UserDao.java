package cn.edu.shu.dao;

import cn.edu.shu.domain.User;

public interface UserDao extends BaseDao<User> {
	
	User login(User user);

	User checkCode(String user_code);

}
