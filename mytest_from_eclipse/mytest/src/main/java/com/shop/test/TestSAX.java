package com.shop.test;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;


/**
 *
 * @author 
 */
public class TestSAX {

    public static List read( String str) {
        try {
			SAXReader saxReader = new SAXReader();
			File inputFile = new File("K:\\Users\\zhangtj\\Desktop\\111\\test.xml");
			Document document = saxReader.read(inputFile);
			Element root = document.getRootElement();
			List list = new ArrayList();
			Element e = (Element) root.selectSingleNode("/entrys/name");
			List e1 = (List) root.selectNodes("/entrys/name");
			// entrys节点下的name节点的value
			if(e1.size()>0){
				for(Iterator it = e1.iterator();it.hasNext();){
					Element e2 = (Element) it.next();
					list.add(e2.getText());
				}
			}
			
//			Element e2 = (Element) e1.get(0);
//			String name = e2.getText();
//			System.out.println(name);
			return list;
 
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
        return null;
    }
    
public static void main(String[] args) {
	read("");
}
    
}