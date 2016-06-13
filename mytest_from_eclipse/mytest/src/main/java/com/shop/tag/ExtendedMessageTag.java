package com.shop.tag;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.jstl.core.Config;
import javax.servlet.jsp.jstl.fmt.LocalizationContext;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.struts2.ServletActionContext;
import org.apache.taglibs.standard.tag.common.core.NullAttributeException;
import org.apache.taglibs.standard.tag.el.core.ExpressionUtil;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.opensymphony.xwork2.ActionContext;


public class ExtendedMessageTag
  extends TagSupport
{
  private static final long serialVersionUID = -2195728584972873700L;
  private String key;
  private String namespace;
  
  public int doEndTag()
    throws JspException
  {
    return 6;
  }
  
  public int doStartTag()
    throws JspException
  {
    Object obj = null;
    String s = null;
//    boolean bool1 = TagUtil.getXHTMLFlag(this.pageContext);
    boolean bool1 = true;
    try
    {
//      boolean bool2 = TagUtil.isUsingELInTag(this.pageContext);
      boolean bool2 = true;
      if (bool2)
      {
        try
        {
          obj = ExpressionUtil.evalNotNull("message", "key", getKey(), Object.class, this, this.pageContext);
          if (getNameSpace() == null) {
        	  s = (String)ExpressionUtil.evalNotNull("message", "nameSpace", getNameSpace(), java.lang.String.class, this, pageContext);
          }
          s = (String)ExpressionUtil.evalNotNull("message", "nameSpace", getNameSpace(), String.class, this, this.pageContext);
        }
        catch (NullAttributeException nullattributeexception)
        {
          return 0;
        }
      }
      else
      {
        obj = getKey();
        if (obj == null) {
          return 0;
        }
        s = getNameSpace();
      }
      label97:
      if (obj.getClass().isArray())
      {
        Object[] aobj = (Object[])obj;
        for (int i = 0; i < aobj.length; i++)
        {
          this.pageContext.getOut().print(a(s, aobj[i]));
          if (bool1) {
            this.pageContext.getOut().print("<br/>");
          } else {
            this.pageContext.getOut().print("<BR>");
          }
        }
      }
      else
      {
        this.pageContext.getOut().print(a(s, obj));
      }
    }
    catch (IOException ioexception)
    {
      throw new JspException(ioexception.getMessage());
    }
    return 0;
  }
  
  private String a(String paramString, Object paramObject)
  {
    ServletContext servletContext = ServletActionContext.getServletContext();
//    ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(servletContext);
    WebApplicationContext ac = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
    ReloadableResourceBundleMessageSource obj = (ReloadableResourceBundleMessageSource) ac.getBean("messageSource"); 
   String a= obj.getMessage("Sex", null, Locale.CHINA);
//   LocalizationContext localLocalizationContext = this.getLocalizationContext(this.pageContext);
    ResourceBundle localResourceBundle = ResourceBundle.getBundle("config/i18n/constants_zh_CN",Locale.CHINA);
//    ResourceBundle localResourceBundle = localLocalizationContext.getResourceBundle();
    String str = paramObject.toString();
    if (paramString != null) {
      str = paramString + "." + str;
    }
    try
    {
//    	localResourceBundle.getString(str);//转码
      str = new String(localResourceBundle.getString(str).getBytes("ISO-8859-1"),"GBK");
    }
    catch (Exception localException)
    {
      if (paramString != null) {
        return escapeHTML(paramObject.toString());
      }
    }
    return escapeHTML(str);
  }
  
  private String escapeHTML(String srcStr)
  {
    if (srcStr == null) {
      return "";
    }
    StringBuffer sb = new StringBuffer();
    for (int i = 0; i < srcStr.length(); i++)
    {
      char c = srcStr.charAt(i);
      switch (c)
      {
      case '&': 
        sb.append("&amp;");
        break;
      case '<': 
        sb.append("&lt;");
        break;
      case '>': 
        sb.append("&gt;");
        break;
      case '"': 
        sb.append("&#034;");
        break;
      case '\'': 
        sb.append("&#039;");
        break;
      default: 
        sb.append(c);
      }
    }
    return sb.toString();
  }
  
  public String getKey()
  {
    return this.key;
  }
  
  public void setKey(String s)
  {
    this.key = s;
  }
  
  public String getNameSpace()
  {
    return this.namespace;
  }
  
  public void setNameSpace(String s)
  {
    this.namespace = s;
  }
  
  
  public static LocalizationContext getLocalizationContext(PageContext pagecontext)
  {
      LocalizationContext localizationcontext = null;
      Object obj = Config.find(pagecontext, "javax.servlet.jsp.jstl.fmt.localizationContext");
      if(obj == null)
          return null;
      if(obj instanceof LocalizationContext)
          localizationcontext = (LocalizationContext)obj;
      else
          return null;
      return localizationcontext;
  }
}
