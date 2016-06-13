package com.shop.token;

import java.io.ByteArrayInputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class ValidCodeAction extends ActionSupport {
   
    private static final long serialVersionUID = 5633780176793520460L;
       //图片流
    private ByteArrayInputStream imageStream;
    @Override
    public String execute() throws Exception {
       // TODO Auto-generated method stub
       try {
           HttpServletRequest request = ServletActionContext.getRequest();
            String securityCode = SecurityCode.getSecurityCode();
            imageStream = SecurityImage.getImageAsInputStream(securityCode);
            //放入session中
//            Map session=(Map)ActionContext.getContext().get(ActionContext.SESSION);
//            session.put("token_flage", securityCode);
            System.out.println("securityCode = " + securityCode);
            request.getSession().setAttribute("token_flage", securityCode);
       } catch (Exception e) {
           e.printStackTrace();
       }
       return SUCCESS;
    }
    public ByteArrayInputStream getImageStream() {
       return imageStream;
    }
    public void setImageStream(ByteArrayInputStream imageStream) {
       this.imageStream = imageStream;
    }
}