package com.shop.test;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HttpClientInfo
  implements ClientInfo
{
  private HttpServletRequest jdField_new;
  private HttpServletResponse jdField_int;
  private HashMap jdField_try;
  private String jdField_if;
  private String jdField_for;
  private Locale jdField_byte;
  private String a;
  private String jdField_goto;
  private String jdField_do;
  private String jdField_else = "WEB";
  private static final String jdField_char = "accept-language";
  private static final String jdField_case = "user-agent";
  public static final String RemoteAddrAttributeName = "com.csii.pe.http.remote_addr";
  
  public HttpClientInfo(HttpServletRequest paramHttpServletRequest)
  {
    this.jdField_new = paramHttpServletRequest;
    this.jdField_int = null;
    a();
    String str = (String)paramHttpServletRequest.getAttribute("com.csii.pe.http.remote_addr");
    if (str != null) {
      this.jdField_if = str;
    } else {
      this.jdField_if = paramHttpServletRequest.getRemoteAddr();
    }
    this.jdField_for = this.jdField_if;
    this.jdField_byte = paramHttpServletRequest.getLocale();
    this.a = paramHttpServletRequest.getCharacterEncoding();
    this.jdField_goto = paramHttpServletRequest.getProtocol();
  }
  
  public HttpClientInfo(HttpServletRequest paramHttpServletRequest, HttpServletResponse paramHttpServletResponse)
  {
    this.jdField_new = paramHttpServletRequest;
    this.jdField_int = paramHttpServletResponse;
    a();
    String str = (String)paramHttpServletRequest.getAttribute("com.csii.pe.http.remote_addr");
    if (str != null) {
      this.jdField_if = str;
    } else {
      this.jdField_if = paramHttpServletRequest.getRemoteAddr();
    }
    this.jdField_for = this.jdField_if;
    this.jdField_byte = paramHttpServletRequest.getLocale();
    this.a = paramHttpServletRequest.getCharacterEncoding();
    this.jdField_goto = paramHttpServletRequest.getProtocol();
  }
  
  public String toString()
  {
    return getClass().getName() + " remoteHost:" + this.jdField_for + " locale:" + this.jdField_byte;
  }
  
  public String getRemoteAddr()
  {
    return this.jdField_if;
  }
  
  public String getRemoteHost()
  {
    return this.jdField_for;
  }
  
  public Locale getLocale()
  {
    return this.jdField_byte;
  }
  
  public String getCharacterEncoding()
  {
    return this.a;
  }
  
  public String getProtocol()
  {
    return this.jdField_goto;
  }
  
  public String getLanguages()
  {
    return (String)this.jdField_try.get("accept-language");
  }
  
  public String getClientType()
  {
    return (String)this.jdField_try.get("user-agent");
  }
  
  public Map getAttributes()
  {
    return this.jdField_try;
  }
  
  public Cookie[] getCookies()
  {
    return this.jdField_new.getCookies();
  }
  
  public void setHeader(String paramString1, String paramString2)
  {
    if (this.jdField_int != null) {
      this.jdField_int.setHeader(paramString1, paramString2);
    } else {
//      throw new PeRuntimeException("pls_use_ExtendedContextResolver_to_set_response_variable");
    }
  }
  
  public void addCookie(Cookie paramCookie)
  {
    if (this.jdField_int != null) {
      this.jdField_int.addCookie(paramCookie);
    } else {
//      throw new PeRuntimeException("pls_use_ExtendedContextResolver_to_set_response_variable");
    }
  }
  
  private void a()
  {
    this.jdField_try = new HashMap(9);
    Enumeration localEnumeration = this.jdField_new.getHeaderNames();
    while (localEnumeration.hasMoreElements())
    {
      String str = (String)localEnumeration.nextElement();
      Object localObject = this.jdField_new.getHeader(str);
      if (localObject == null) {
        localObject = this.jdField_new.getHeaders(str);
      }
      this.jdField_try.put(str, localObject);
    }
  }
  
  public String getChannelId()
  {
    if (this.jdField_do == null) {
      this.jdField_do = ("HTTP" + '.' + this.jdField_else);
    }
    return this.jdField_do;
  }
  
  public void setSubChannelId(String paramString)
  {
    this.jdField_else = paramString;
  }
  
  public String getSubChannelId()
  {
    return this.jdField_else;
  }
}
