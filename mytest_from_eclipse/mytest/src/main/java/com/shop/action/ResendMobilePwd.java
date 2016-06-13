package com.shop.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionContext;

public class ResendMobilePwd extends BaseAction{
	private static final long serialVersionUID = 1L;

	@SuppressWarnings({ "unused", "rawtypes" })
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
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
	            dataMap.get("aa");
//	            localservletcontext.setDataMap(dataMap);
	        }
	        catch(IOException e)
	        {
	            throw new Exception("1234562");
	        }
        
		return null;
	}
}
