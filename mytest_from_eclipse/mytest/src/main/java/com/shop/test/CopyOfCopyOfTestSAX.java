package com.shop.test;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.json.JSONObject;

import com.shop.dict.Util;

public class CopyOfCopyOfTestSAX {
	@SuppressWarnings({ "rawtypes", "unused" })
	public static void main(String[] args) {
		List listesb =testhtml.GetFilesName("K:\\mywork\\esb\\", false);
		List listsop =testhtml.GetFilesName("K:\\mywork\\sop\\", false);
		
		String [] aEsb=null;
		String [] asop=null;
		int i=0;
		for(;i<listesb.size();i++){
			aEsb=(listesb.get(i)).toString().split("_");
			asop=(listsop.get(i)).toString().split("_");
			
			
			
			if(!(aEsb[1].equals(asop[1]))){
				
				continue;
			}
			
			String lu="";
			
			// esb的json数据对象
			String esb = readToString((String) listesb.get(i));
//			String esb = readToString("K:\\mywork\\ESB.txt");
			if (Util.isNullOrEmpty(esb)) {
				System.err.println("ESB字段获取失败");
				return;
			}
			JSONObject jesb = new JSONObject(esb);
			// sop的json数据对象
			String sop = readToString((String) listsop.get(i));
//			String sop = readToString("K:\\mywork\\SOP.txt");
			if (Util.isNullOrEmpty(esb)) {
				System.err.println("SOP字段获取失败");
				return;
			}
			JSONObject jsop = new JSONObject(sop);

			String str=aEsb[1];
			
			// 拿到接口文档所以字段
			List intAll = read(str);
			if (Util.isNullOrEmpty(intAll) || intAll.size() < 1) {
				System.err.println("接口文档字段获取失败");
				return;
			}

			// Map打印输出
			Map mapa = new HashMap();
			Map mapb = new HashMap();
			Map mapc = new HashMap();
			Map mapd = new HashMap();
			Map mape = new HashMap();
			Map mapf = new HashMap();
			Map mapg = new HashMap();
			String aa = "Sop Esb 字段都不存在: ";
			String bb = "Sop Esb 值均为空: ";
			String cc = "ESB 字段存在，Sop 字段不存在: ";
			String dd = "Sop 字段存在，Esb 字段不存在: ";
			String ee = "Esb值为空,sop不为空: ";
			String ff = "Esb值不为空,sop为空: ";
			
			String keys ="";
			// 进行比较
			for (Iterator it = intAll.iterator(); it.hasNext();) {
				String key = (String) it.next();
				keys+=(key+": ");
				if (jsop.isNull(key) && jesb.isNull(key)) {// 老版/新版字段不存在
					mapa.put(key +"_ESB", "不存在");
					mapa.put(key +"_SOP", "不存在");
				} else if (jsop.isNull(key)) {// 老版为空
					mapc.put(key +"_ESB", jesb.getString(key));
					mapc.put(key +"_SOP", "不存在");
				} else if (jesb.isNull(key)) {// 新版为空
					mapd.put(key +"_ESB", "不存在");
					mapd.put(key +"_SOP",  jsop.getString(key));
				} else {// 都存在
					if (Util.isNullOrEmpty(jsop.getString(key))) {// sop值为空
						if (Util.isNullOrEmpty(jesb.getString(key))) {// esb值为空
							mapb.put(key +"_ESB", jesb.getString(key));
							mapb.put(key +"_SOP", jsop.getString(key));
						} else {// esb值不为空
							mapf.put(key +"_ESB", jesb.getString(key));
							mapf.put(key +"_SOP", jsop.getString(key));
						}
					} else {
						if (Util.isNullOrEmpty(jesb.getString(key))) {// esb值为空
							mape.put(key +"_ESB", jesb.getString(key));
							mape.put(key +"_SOP", jsop.getString(key));
						} else {
							mapg.put(key, "_ESb" + jesb.getString(key) + "  _SOP"
									+ jsop.getString(key) + "值不等");
						}
					}
				}
			}

			// END 比较 写入 文件

			writeToTxtByFileWriter("K:\\mywork\\2.txt","接口文档字段："+keys);
			writeToTxtByFileWriter("K:\\mywork\\2.txt","ESB："+jesb.toString());
			writeToTxtByFileWriter("K:\\mywork\\2.txt","SOP："+jsop.toString());
			writeToTxtByFileWriter("K:\\mywork\\2.txt","\r\n");
//			writeToTxtByFileWriter("K:\\mywork\\2.txt",aa+mapa.toString());
//			writeToTxtByFileWriter("K:\\mywork\\2.txt",bb+mapb.toString());
//			writeToTxtByFileWriter("K:\\mywork\\2.txt",cc+mapc.toString());
//			writeToTxtByFileWriter("K:\\mywork\\2.txt",dd+mapd.toString());
//			writeToTxtByFileWriter("K:\\mywork\\2.txt",ee+mape.toString());
//			writeToTxtByFileWriter("K:\\mywork\\2.txt",ff+mapf.toString());
//			writeToTxtByFileWriter("K:\\mywork\\2.txt","值不等:"+mapg.toString());
			
		}
		
		
	}

	public static void writeToTxtByFileWriter(String fileName, String content) {
		File file=new File(fileName);
		BufferedWriter bw = null;
		try {
			FileWriter fw = new FileWriter(file, true);
			bw = new BufferedWriter(fw);
			bw.write(content);
			bw.write("\r\n");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public static String readToString(String filename) {
		File file = new File(filename);
		Long filelength = file.length(); // 获取文件长度
		byte[] filecontent = new byte[filelength.intValue()];
		try {
			FileInputStream in = new FileInputStream(file);
			in.read(filecontent);
			in.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return new String(filecontent);// 返回文件内容,默认编码
	}

	public static List read(String str) {
		try {
			SAXReader saxReader = new SAXReader();
			File inputFile = new File("K:\\mywork\\xml\\"+str+".xml");
			Document document = saxReader.read(inputFile);
			List list11 = document.selectNodes("/trans/snd/keys/item");
			List list = new ArrayList();
			// entrys节点下的name节点的value
			if (list11.size() > 0) {
				for (Iterator it = list11.iterator(); it.hasNext();) {
					Element e2 = (Element) it.next();
					list.add(e2.attributeValue("name"));
				}
			}
			List listF = document.selectNodes("/trans/snd/keys/indexs/keys/item");
			if(listF.size()>0){
				for (Iterator it = listF.iterator(); it.hasNext();) {
					Element e2 = (Element) it.next();
					list.add(e2.attributeValue("name"));
				}	
			}
			return list;

		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return null;
	}
}
