package com.shop.updown;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;
import com.shop.action.BaseAction;
import com.shop.dict.Util;
import com.shop.exception.MyException;
import com.shop.model.user.SubAdmin;
import com.shop.test.IdGen;

public class UploadAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private File file;// 对应文件域的file，封装文件内容
	// private String fileContentType;// 封装文件类型
	private String fileFileName; // 封装文件名
	// private String savePath;// 保存路径
	// private String title;// 文件标题
	private String result;// 文件标题
	private String ResponseCode;

	public String getResponseCode() {
		return ResponseCode;
	}

	public void setResponseCode(String responseCode) {
		ResponseCode = responseCode;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	// public String getFileContentType() {
	// return fileContentType;
	// }
	//
	// public void setFileContentType(String fileContentType) {
	// this.fileContentType = fileContentType;
	// }
	//
	public String getFileFileName() {
		return fileFileName;
	}

	//
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		if (file != null) {
			InputStream is = new FileInputStream(getFile());

			
			result = "123456";// 成功标志
			Object obj=session.get("_USER");
			if(Util.isNullOrEmpty(session)){
				return "input";
			}

			FtpUtil ftpUtil = new FtpUtil("121.42.75.186", 21, "qxu1098400019",
					"zhtjun1991", "/htdocs/image");
			if (!ftpUtil.ftpLogin()) {
				result = "123";
				// throw new MyException("FTp登录失败");
			}
			IdGen id = IdGen.get();

			String FileName = Long.toString(id.nextId())
					+ getFileFileName().substring(
							getFileFileName().length() - 4,
							getFileFileName().length());

			if (!ftpUtil.uploadFile(is, "/", FileName)) {
				result = "123";
				// throw new MyException("FTp上传失败");
			} else {

				BufferedWriter writer = new BufferedWriter(new FileWriter(
						new File("D:\\imageDOWN\\Result.txt"), true));
				writer.newLine();
				writer.write(FileName);
				writer.flush();
				writer.close();
			}
			// 上传成功，插入数据库
			Map map = new HashMap();
			// HttpServletRequest request =
			// (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
			map.put("StoreUrl", "http://www.zhtjun.com/image/" + FileName);
			if(obj instanceof SubAdmin){
				map.put("SellerId",((SubAdmin)obj).getSellerid());
				try {
					this.getSqlMap().update("Admin.updateUrl",map);//插入图片url
				} catch (Exception e) {
					// TODO Auto-generated catch block
					throw new MyException(e.getMessage());
				}
			}else{
				return "input";
			}


			ftpUtil.ftpLogOut();
			return SUCCESS;
		}
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			java.io.InputStream is = request.getInputStream();
			InputStreamReader isr = new InputStreamReader(is, "UTF-8");
			BufferedReader reader = new BufferedReader(isr);
			// 表单数据
			Map dataMap = (Map) objectMapper.readValue(reader,
					java.util.Map.class);
			Map map = new HashMap();
			String Flag = (String) dataMap.get("Flag");// 前台标志
			String Flag1 = (String) dataMap.get("Flag1");// 前台标志
			if ("A".equals(Flag)) {
				map.put("SellerId", dataMap.get("SellerId"));//Admin中取
				map.put("SellerIdcard", dataMap.get("SellerIdcard"));
				map.put("SellerMobile", dataMap.get("SellerMobile"));
				map.put("SellerEmail", dataMap.get("SellerEmail"));
				map.put("SellerTruename", dataMap.get("SellerTruename"));
				try {
					this.getSqlMap().update("Admin.updateSeller", map);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					throw new MyException(e.getMessage());
				}
				result = "123456";// 成功标志
				ResponseCode = "AAAAA";
				return SUCCESS;			
			}
			if ("B".equals(Flag)&&!Util.isNullOrEmpty(Flag1)) {
				if (!Util.isNullOrEmpty(dataMap.get("StoreUrl"))) {
					map.put("SellerId", dataMap.get("SellerId"));
					map.put("StoreId", dataMap.get("StoreId"));
					if(!("B".equals(Flag1))){
						map.put("StoreName", dataMap.get("StoreName"));//检查唯一
					}
					map.put("StoreUrl", dataMap.get("StoreUrl"));
					map.put("StoreDescribe", dataMap.get("StoreDescribe"));
					try {
						this.getSqlMap().update("Admin.updateStore", map);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						throw new MyException(e.getMessage());
					}
					result = "123456";// 成功标志
					ResponseCode = "AAAAA";
					return SUCCESS;
				}
			}
		} catch (IOException e) {
			throw new Exception("1234562");
		}

		return INPUT;
	}
}
