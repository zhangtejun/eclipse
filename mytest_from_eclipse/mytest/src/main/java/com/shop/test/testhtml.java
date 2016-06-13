package com.shop.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class testhtml {
	public static void main(String[] args) {
System.out.println((getMap().toString()).replace("=", ","));

		// 从URL获取解析
		Document doc = null;
		Document doc1 = null;
		File input = new File("K:\\Users\\zhangtj\\Desktop\\123\\1-17\\fojava.html");// 目标页面
		int i=0;
		try {

			// doc = (Document)
			doc = Jsoup.connect("http://www.cnblogs.com/yjf512/archive/2011/06/03/2071914.html").get();

			doc1 = Jsoup.parse(input, "UTF-8");
//			Elements es = doc.getElementsByClass("single-post-inner");
			Element es = doc.getElementById("cnblogs_post_body");
			doc1.select("#zht").html("jquery");
			// doc1.appendElement(tagName)
			doc1.select("#zht1").html(es.html());
			// System.err.println(aa.text());
			// 输出本地
			PrintWriter pw = null;
			try {
				pw = new PrintWriter(
						new OutputStreamWriter(
								new FileOutputStream(
										"K:\\Users\\zhangtj\\Desktop\\123\\1-17\\fojava1.html"),
								"UTF-8"));
				pw.print(doc1.html());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				pw.close();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

	/**
	 * 目录下，所有文件件名
	 * 
	 * @param path
	 * @return
	 */
	public static List GetFilesName(String path, boolean flag) {
		File file = new File(path);
		if (!file.exists()) {
			return null;
		}
		if (!file.isDirectory()) {
			return null;
		}
		String[] tempList = file.list();
		List list = new ArrayList();
		List list1 = new ArrayList();
		File temp = null;
		// System.err.println("删除"+path+"目录下的所有文件");
		for (int i = 0; i < tempList.length; i++) {
			if (path.endsWith(File.separator)) {
				temp = new File(path + tempList[i]);
			} else {
				temp = new File(path + File.separator + tempList[i]);
			}
			if (temp.isFile()) {
				if (flag) {
					list.add(temp.getName());
//					System.err.println(list);
				} else {
					list1.add(temp.toString());
//					System.err.println(list1);
				}
			}

		}
		// System.err.println("删除"+path+"目录下的所有文件成功！！！");
		if (flag) {
			return list;
		} else {
			return list1;
		}
	}
	public static Map<String, Object> getMap() {
		/**
		 * K:\\Users\\zhangtj\\Desktop\\123\\1-17\\123 htm文件在此目录
		 */
		 List list=GetFilesName("K:\\Users\\zhangtj\\Desktop\\123\\1-17\\123",true);//文件名
		// 集合
		List list1 = GetFilesName(
				"K:\\Users\\zhangtj\\Desktop\\123\\1-17\\123", false);// 文件路径集合
		if(!(list.size()==list1.size())){
			System.err.println("文件名，和路径不匹配");
			return null;
		}
		// 从URL获取解析
		Document doc = null;
		Map<String,Object> map=new HashMap();
		Map<String,Object> map1=new HashMap();
		Document doc1 = null;
//		File input = new File("K:\\Users\\zhangtj\\Desktop\\123\\1-17\\fojava.html");// 目标页面
		int i=0;
		try {
			for(Iterator it =list.iterator();it.hasNext();){
				map.put(i+"",it.next());
				i++;
			}
			//重置i {key:"fojava.html",value:"文本转html"}
			
			i=0;
			for(Iterator it1 =list1.iterator();it1.hasNext();){
				if(list1.size()-1>=i){
					File input = new File((String) it1.next());// 目标页面
					doc1 = Jsoup.parse(input, "UTF-8");
				}
				map1.put("{key:\""+(String) map.get(""+i)+"\"","value:\""+doc1.select("#zht").html()+"\"}");
				i++;
			}
			//重置i
			i=0;
		}catch(IOException e){
			e.printStackTrace();
		}
		return map1;
}

	public static String getResult(Map map) {
		
		return "";
		}
	}
