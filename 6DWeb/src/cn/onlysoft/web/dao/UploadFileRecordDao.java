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

public class UploadFileRecordDao {
	public int addFileRecord(ExcelBean bean) {
		int num = 0;
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "insert into records (id,fileName,versionCode,descption,excelpath) values (?,?,?,?,?)";
			num = runner.update(sql, new Object[] { bean.getId(), bean.getFileName(), bean.getVersionCode(), bean.getDescption(), bean.getExcelpath() });
		} catch (SQLException e) {
			throw new UserDaoException(e);
		}
		return num;
	}

	public ExcelBean queryVersion() {
		ExcelBean bean = null;
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select * from records where versionCode=(select max(versionCode) from records) ";
			bean = (ExcelBean) runner.query(sql, new BeanHandler(ExcelBean.class));
		} catch (SQLException e) {
			throw new UserDaoException(e);
		}
		return bean;
	}

	public List<ExcelBean> queryAll() {
		List<ExcelBean> excelBeans = null;
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql = "select * from records";
			excelBeans = (List) runner.query(sql, new BeanListHandler(ExcelBean.class));
		} catch (SQLException e) {
			throw new UserDaoException(e);
		}
		return excelBeans;
	}

	public int delete(String id) {
		int num=0;
		try {
			QueryRunner runner = new QueryRunner(JdbcUtils.getDataSource());
			String sql="delete from records where id=?";
			num=runner.update(sql, new Object[]{id});
		} catch (SQLException e) {
			throw new UserDaoException(e);
		}
		return num;
	}

	
}
