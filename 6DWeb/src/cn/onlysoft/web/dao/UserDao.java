package cn.onlysoft.web.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.sun.org.apache.bcel.internal.generic.NEW;

import cn.onlysoft.web.entity.ExcelBean;
import cn.onlysoft.web.entity.User;
import cn.onlysoft.web.exception.UserDaoException;
import cn.onlysoft.web.utils.JdbcUtils;
import cn.onlysoft.web.utils.Md5Utils;

public class UserDao {
	public User find(String name) {
		User user = null;
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select * from users where name=?";
			user = (User) runner.query(sql, new BeanHandler(User.class), new Object[] { name });
		} catch (SQLException e) {
			throw new UserDaoException(e);
		}
		return user;
	}

	public int add(User user) {
		int num = 0;
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "insert into users (id,name,password,isactive) values (?,?,?,?)";
			num = runner.update(sql, new Object[] { user.getId(), user.getName(), user.getPassword(),user.isIsactive()});
		} catch (SQLException e) {
			throw new UserDaoException(e);
		}
		return num;
	}
	
	public List<User> queryAll()
	{
		List<User> userList=null;
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select * from users";
			userList = (List) runner.query(sql, new BeanListHandler(User.class));
		} catch (SQLException e) {
			throw new UserDaoException(e);
		}
		return userList;
	}
	public int updateStatus(String id, boolean active)
	{
		int num=0;
		try {
			QueryRunner runner=new QueryRunner(JdbcUtils.getDataSource());
			String sql="update users set isactive=? where id=?";
			num=runner.update(sql, new Object[]{active,id});
		} catch (SQLException e) {
			throw new UserDaoException(e);
		}
		return num;
	}

	public int updatePasswordToDefault(String id) {
		int num=0;
		try {
			QueryRunner runner=new QueryRunner(JdbcUtils.getDataSource());
			String sql="update users set password=? where id=?";
			num=runner.update(sql, new Object[]{Md5Utils.encrypt("123456"),id});
		} catch (SQLException e) {
			throw new UserDaoException(e);
		}
		return num;
	}
}
