package com.shop.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionContext;

public class CartInfoAction extends BaseAction{
	private static final long serialVersionUID = 1L;
	private List result;
	private String ResponseCode;
	public String getResponseCode() {
		return ResponseCode;
	}
	public void setResponseCode(String responseCode) {
		ResponseCode = responseCode;
	}
	public List getResult() {
		return result;
	}
	public void setResult(List result) {
		this.result = result;
	}

	@SuppressWarnings({ "unused", "rawtypes", "unchecked" })
	@Override
	public String execute() throws Exception {
		ActionContext context=ActionContext.getContext(); 
//		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletRequest request = (HttpServletRequest)context.get(ServletActionContext.HTTP_REQUEST);
		Map session1=(Map)ActionContext.getContext().get(ActionContext.SESSION);
		
		//发送动态密码
		
		
		 ObjectMapper objectMapper = new ObjectMapper();
	        try
	        {
	            java.io.InputStream is = request.getInputStream();
	            InputStreamReader isr = new InputStreamReader(is, "UTF-8");
	            BufferedReader reader = new BufferedReader(isr);
	            //表单数据
	            Map dataMap = (Map)objectMapper.readValue(reader, java.util.Map.class);
//	            dataMap.get("aa");
//	            localservletcontext.setDataMap(dataMap);
	          //将数据存储在map里，再转换成json类型数据，也可以自己手动构造json类型数据
	                      Map<String,Object> map = new HashMap<String,Object>();
	                      String MemberId=(String) dataMap.get("MemberId");
	                        map.put("MemberId", MemberId);
	                        result=   this.getSqlMap().queryForList("Shop.selectAjaxCart", map);
//	                        result= new ArrayList();
//	                      request.setAttribute("result", result);
	        }
	        catch(IOException e)
	        {
	            throw new Exception("1234562");
	        }
	        ResponseCode="AAAAA";
		return SUCCESS;
	}
}
