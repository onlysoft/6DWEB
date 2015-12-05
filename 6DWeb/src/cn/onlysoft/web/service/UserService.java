package cn.onlysoft.web.service;


import java.util.ArrayList;
import java.util.List;

import cn.onlysoft.web.dao.UserDao;
import cn.onlysoft.web.entity.User;
import cn.onlysoft.web.utils.Md5Utils;

public class UserService {
	private String error;
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	UserDao userDao=new UserDao();
	public User login(String name,String password)
	{
		User user=null;
		user = userDao.find(name);
		if(!password.equals(user.getPassword()))
		{
			return null;
		}
		return user;
	}
	public boolean register(User user)
	{
		User u = userDao.find(user.getName());
		if(u!=null)
		{
			this.error="用户名已存在！";
			return false;
		}
		user.setPassword(Md5Utils.encrypt(user.getPassword()));
		int count = userDao.add(user);
		if(count>0)
		{
			return true;
		}else {
			this.error="注册失败";
			return false;
		}
	}
	public List<User> getAllUser()
	{
		List<User> userList=null;
		userList=userDao.queryAll();
		return userList;
	}
	public boolean activeUser(String id, boolean active)
	{
		boolean b=false;
		int num = userDao.updateStatus(id,active);
		if(num>0)
		{
			b=true;
		}
		return b;
	}
	public boolean passwordReset(String id)
	{
		boolean b=false;
		int num = userDao.updatePasswordToDefault(id);
		if(num>0)
		{
			b=true;
		}
		return b;
	}
}
