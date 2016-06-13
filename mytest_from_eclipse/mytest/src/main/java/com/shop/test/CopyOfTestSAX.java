package com.shop.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.shop.dict.Util;


/**
 *
 * @author 
 */
public class CopyOfTestSAX {
	public static Map readEsb( String str) {
		FileInputStream is=null;
		 ObjectMapper objectMapper = new ObjectMapper();
		 Map dataMap=new HashMap();
	        try
	        {
	        	is=	new FileInputStream(new File("K:\\mywork\\1.txt"));
	            InputStreamReader isr = new InputStreamReader(is, "UTF-8");
	            BufferedReader reader = new BufferedReader(isr);
	            //表单数据
	             dataMap = (Map)objectMapper.readValue(reader, java.util.Map.class);
	        }
	        catch(IOException e)
	        {
	            e.printStackTrace();
	        }finally{
	        	if(null==is){
	        		
	        		try {
						is.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
	        	}
	        }
		return dataMap;
	}
	public static Map readSOP( String str) {
		FileInputStream is=null;
		ObjectMapper objectMapper = new ObjectMapper();
		Map dataMap=new HashMap();
		try
		{
			is=	new FileInputStream(new File("K:\\mywork\\1.txt"));
			InputStreamReader isr = new InputStreamReader(is, "UTF-8");
			BufferedReader reader = new BufferedReader(isr);
			//表单数据
			dataMap = (Map)objectMapper.readValue(reader, java.util.Map.class);
		}
		catch(IOException e)
		{
			e.printStackTrace();
		}finally{
			if(null==is){
				
				try {
					is.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return dataMap;
	}
	
	
    public static List read( String str) {
        try {
			SAXReader saxReader = new SAXReader();
			File inputFile = new File("K:\\mywork\\WUCountryInfoQuery.xml");
			Document document = saxReader.read(inputFile);
			List list11=document.selectNodes("/trans/snd/keys/item");
			List list = new ArrayList();
			// entrys节点下的name节点的value
			if(list11.size()>0){
				for(Iterator it = list11.iterator();it.hasNext();){
					Element e2 = (Element) it.next();
					list.add(e2.attributeValue("aliase"));
				}
			}
			return list;
 
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
        return null;
    }
    
public static void main(String[] args) {
	
	//拿到接口文档所以字段
	List intAll=read("");
	if(Util.isNullOrEmpty(intAll)||intAll.size()<1){
		System.err.println("接口文档字段获取失败");
		return;
	}
	//得到ESb的所有json数据，转为map
	Map mapEsb=readEsb("");
	if(Util.isNullOrEmpty(mapEsb)||mapEsb.size()<1){
		System.err.println("ESB字段获取失败");
		return;
	}
	//得到Sop的所有json数据，转为map
	Map mapSop=readSOP("");
	if(Util.isNullOrEmpty(mapSop)||mapSop.size()<1){
		System.err.println("Sop文件获取失败");
		return;
	}
	
	for(Iterator it = intAll.iterator();it.hasNext();){
		String key=(String) it.next();
	}
	
}
    
}