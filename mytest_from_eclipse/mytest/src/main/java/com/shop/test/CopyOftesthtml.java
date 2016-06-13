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

import com.shop.dict.Util;

public class CopyOftesthtml {
	public static List read(String args) {
		// 从URL获取解析
		String url=args.trim();
		Document doc = null;
		try {

			doc = Jsoup.connect(url).get();

			Elements a=	doc.select(".price-length-5");
			if(a.size()<=0){
				a=	doc.select(".price-length-6");
			}
			if(a.size()<=0){
				System.err.println("a.size()<=0");
				return null;
			}
			double price=0.00;
			price=Double.parseDouble(a.get(0).text());
			for(int j=1;j<a.size();j++){
				double tem=Double.parseDouble(a.get(j).text().substring(0, a.get(j).text().indexOf(".")));
				if(tem>price){
					price=tem;
				}
			}
			price=Math.round(price);//价格
			price=Math.floor(price);
			Elements h1= doc.select("h1");
			String h =h1.get(0).text();
		String cc=	String.valueOf(price);
			System.out.println("商品名称："+h+" "+"商品标价: "+(price*2+30)+"  备注: "+cc.substring(0,1)+"AA"+cc.substring(1,cc.length())+"   实际价格   "+((price+7)*1.2));
			
			Elements a1= doc.select(".tab-content-container a img");
			Elements b1= doc.select("p[align=center] img");
			if(b1.size()<=2){
				b1= doc.select("p img");
			}
			List list=new ArrayList();
			for(Element ets : a1){
				String src =ets.attr("src");
				String src1 =ets.attr("data-lazy-src");
				if(!Util.isNullOrEmpty(src)){
					
					list.add(src);
					
				}
				if(!Util.isNullOrEmpty(src1)){
					if(a.indexOf(".60x60")==-1){
						list.add(src1);
					}
					
				}
			}
			for(Element ets1 : b1){
				String src =ets1.attr("src");
				list.add(src);
			}
			return list;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			System.err.println("获取url内容失败");
			e.printStackTrace();
		}
		return null;
	
	}
}