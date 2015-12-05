package cn.onlysoft.web.utils;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import cn.onlysoft.web.exception.JdbcUtilsException;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtils {
	private static ComboPooledDataSource dataSource = new ComboPooledDataSource();
	private JdbcUtils() {
	}

	public static DataSource getDataSource() {
		return dataSource;
	}

	public static Connection getConnection() {
		try {
			return dataSource.getConnection();
		} catch (SQLException e) {
			throw new JdbcUtilsException(e);
		}
	}
}
