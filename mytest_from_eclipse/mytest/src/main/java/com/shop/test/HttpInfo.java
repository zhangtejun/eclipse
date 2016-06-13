package com.shop.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 获取Ip 地址
 * @author zhangtj
 * @date   2016年5月4日
 */
public class HttpInfo {
/**
 * IP
 * @param paramHttpServletRequest
 */
	public HttpInfo(HttpServletRequest paramHttpServletRequest) {
	       String remoteAddrHeaderName = "X-Forwarded-For";
	        String s = paramHttpServletRequest.getHeader(remoteAddrHeaderName);
			if(s != null)
				remoteAddr = s;
	        else
	        	remoteAddr = paramHttpServletRequest.getRemoteAddr();
		String q=	paramHttpServletRequest.getRequestURI();
	}
/**
 * Ip
 * @param paramHttpServletRequest
 * @param paramHttpServletResponse
 */
	public HttpInfo(HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse) {
       String remoteAddrHeaderName = "X-Forwarded-For";
        String s = paramHttpServletRequest.getHeader(remoteAddrHeaderName);
		if(s != null)
			remoteAddr = s;
        else
        	remoteAddr = paramHttpServletRequest.getRemoteAddr();
	}
	private String remoteAddr;
	public String getRemoteAddr() {
		return remoteAddr;
	}

	public void setRemoteAddr(String remoteAddr) {
		this.remoteAddr = remoteAddr;
	}
	
	
//	public static String getUserIp(HttpServletRequest request) {
//	    String ip = request.getHeader("X-Forwarded-For");
//	    if (StringUtils.isNotBlank(ip) && !"unknown".equalsIgnoreCase(ip)) {
//	        // 多次反向代理后会有多个IP值，第一个不为 unknow 的才为真实IP
//	        String[] ips = StringUtils.split(ip, ",");
//	        for (String i : ips) {
//	            i = StringUtils.trim(i);
//	            if (StringUtils.isNotBlank(i) && !"unknown".equalsIgnoreCase(i)) {
//	                ip = i;
//	                break;
//	            }
//	        }
//	    }
//	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//	        ip = request.getHeader("Proxy-Client-IP");
//	    }
//	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//	        ip = request.getHeader("WL-Proxy-Client-IP");
//	    }
//	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//	        ip = request.getHeader("HTTP_CLIENT_IP");
//	    }
//	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
//	    }
//	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
//	        ip = request.getRemoteAddr();
//	    }
//	    return ip;
//	}
}
