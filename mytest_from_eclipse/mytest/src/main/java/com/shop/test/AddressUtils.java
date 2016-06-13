package com.shop.test;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.shop.dict.Util;

public class AddressUtils {

	/**
	 * @param content
	 *            请求的参数 格式为：name=xxx&pwd=xxx
	 * @param encoding
	 *            服务器端请求编码。如GBK,UTF-8等
	 * @return
	 */
	public static String getAddresses(String content, String encodingString) {
		// 这里调用pconline的接口
		String urlStr = "http://whois.pconline.com.cn/ipJson.jsp?"+content;
		// 从http://whois.pconline.com.cn取得IP所在的省市区信息
		String returnStr = getResult(urlStr,encodingString);
		if (returnStr != null) {
			// 处理返回的省市区信息
			int startIndex = returnStr.indexOf("\"pro");
			int endIndex = returnStr.indexOf(",\"regionNames");
//			int endIndex = returnStr.indexOf(",\"addr");
			if (startIndex > 0 && endIndex > 0 && endIndex > startIndex) {
				returnStr = returnStr.substring(startIndex, endIndex);
				returnStr = returnStr.replaceAll("\"", "").replace("pro:", "")
						.replace("city:", "").replace("region:", "");
			}
		} else {
			return "";
		}
		return returnStr;
	}

	/**
	 * @param urlStr
	 *            请求的地址
	 * @param encoding
	 *            服务器端请求编码。如GBK,UTF-8等
	 * @return
	 */
	private static String getResult(String urlStr,String encoding) {
		URL url = null;
		HttpURLConnection connection = null;
		try {
			url = new URL(urlStr);
			connection = (HttpURLConnection) url.openConnection();// 新建连接实例
			connection.setConnectTimeout(2000);// 设置连接超时时间，单位毫秒
			connection.setReadTimeout(2000);// 设置读取数据超时时间，单位毫秒

			// connection.setDoOutput(true);// 是否打开输出流 true|false
			// connection.setDoInput(true);// 是否打开输入流true|false
			// connection.setRequestMethod("POST");// 提交方法POST|GET
			// connection.setUseCaches(false);// 是否缓存true|false
			// connection.connect();// 打开连接端口
			//
			// DataOutputStream out = new DataOutputStream(
			// connection.getOutputStream());// 打开输出流往对端服务器写数据
			// out.writeBytes(content);// 写数据,也就是提交你的表单 name=xxx&pwd=xxx
			// out.flush();// 刷新
			// out.close();// 关闭输出流
			BufferedReader reader = new BufferedReader(new InputStreamReader(
					connection.getInputStream(), encoding));// 往对端写完数据对端服务器返回数据
			// ,以BufferedReader流来读取
			StringBuffer buffer = new StringBuffer();
			String line = "";
			while ((line = reader.readLine()) != null) {
				buffer.append(line);
			}
			reader.close();
			return buffer.toString();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				connection.disconnect();// 关闭连接
			}
		}
		return null;
	}
/**
 * 如：上海市黄浦区 电信
 * @param args
 */
	public static String getAddress(String ip) {
		String str=getAddresses("ip=" + ip,  "gbk");
		if(Util.isNullOrEmpty(str)){
			return str;
		}
		String address =str.substring(str.indexOf("addr:")+5);
		return address;
	}	
}