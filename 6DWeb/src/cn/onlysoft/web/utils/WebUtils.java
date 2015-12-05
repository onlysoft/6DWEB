package cn.onlysoft.web.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import cn.onlysoft.web.exception.WebUtilException;

public class WebUtils {
	// 处理文件上传
		public static <T> T doUpload(HttpServletRequest request, Class<T> beanClass) {
			try {
				// 实例化bean
				T bean = beanClass.newInstance();
				// 封装id
				String uuid = UUID.randomUUID().toString();
				BeanUtils.setProperty(bean, "id", uuid);
				// 创建文件上传组件
				ServletFileUpload fileUpload = new ServletFileUpload(
						new DiskFileItemFactory());
				// 处理请求
				List<FileItem> fileItems = fileUpload.parseRequest(request);
				for (FileItem fileItem : fileItems) {
					// 判断
					if (fileItem.isFormField()) {
						// 普通字段
						String name = fileItem.getFieldName();
						String value = fileItem.getString("utf-8");
						BeanUtils.setProperty(bean, name, value);
					} else {
						// 文件上传
						// 获得文件名
						String filename = fileItem.getName();
						BeanUtils.setProperty(bean, "fileName", filename);
						// 获得扩展名
						String extName = filename.substring(filename
								.lastIndexOf("."));
						// 获得webpath
						String webPath = "/excels/" + filename;

						// 创建文件
						String path = request.getSession().getServletContext()
								.getRealPath(webPath);
						File file = new File(path);
						file.getParentFile().mkdirs();
						file.createNewFile();

						// 拷贝
						InputStream in = fileItem.getInputStream();
						OutputStream out = new FileOutputStream(file);
						Streams.copy(in, out, true);

						// 删除临时文件
						fileItem.delete();

						// 将文件的路径封装
						String name = fileItem.getFieldName();
						BeanUtils.setProperty(bean, name, webPath);
					}
				}
				return bean;

			} catch (Exception e) {
				throw new WebUtilException(e);
			}

		}
}
