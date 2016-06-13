package com.shop.test;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Iterator;
import java.util.List;
import java.util.Scanner;

import org.dom4j.Element;

import com.shop.dict.Util;

public class testurl {
	
	
	//param path 文件夹完整绝对路径
	   public static boolean delAllFile(String path) {
	       boolean flag = false;
	       File file = new File(path);
	       if (!file.exists()) {
	         return flag;
	       }
	       if (!file.isDirectory()) {
	         return flag;
	       }
	       String[] tempList = file.list();
	       File temp = null;
	       System.err.println("删除"+path+"目录下的所有文件");
	       for (int i = 0; i < tempList.length; i++) {
	          if (path.endsWith(File.separator)) {
	             temp = new File(path + tempList[i]);
	          } else {
	              temp = new File(path + File.separator + tempList[i]);
	          }
	          if (temp.isFile()) {
	        	if(temp.getName().startsWith("A")){
	        		temp.delete();
	        	}
	          }
	          if (temp.isDirectory()) {
	        	  if(temp.getName().startsWith("A")){
	             delAllFile(path + "/" + tempList[i]);//先删除文件夹里面的文件
	        	  }
//	             delFolder(path + "/" + tempList[i]);//再删除空文件夹
	             flag = true;
	          }
	          
	       }flag = true;
	       System.err.println("删除"+path+"目录下的所有文件成功！！！");
	       return flag;
	     }
	
	
	
	public static void main(String[] args) {
		//控制台输入
		System.out.println("请输入文件以什么字符开始。默认为A，输入x,则为Ax");
		Scanner sc = new Scanner(System.in);  
		String a1= sc.nextLine();
		if(!Util.isNullOrEmpty(a1)&&a1.length()>0){
			a1="\\A"+a1.substring(0,1);
		}else{
			a1="\\A";
		}
//		sc.close();
		Scanner scq = new Scanner(System.in);
		//本地路径
		String path="D:\\imageDOWN\\AA";
		System.out.println("是否删除所有文件Y/N");
		String bbb=scq.nextLine();
		if("y".equalsIgnoreCase(bbb)||"Y".equals(bbb)){
			//防止误删除，默认文件名以A开头。不是A开头额文件不会被删除
			if(!delAllFile(path)){
				System.err.println("删除文件出错！！！");
				return;
			}
		}
			
		Scanner url = new Scanner(System.in);
		System.out.println("请输入url链接");
		String url1= sc.nextLine();
		if(Util.isNullOrEmpty(url1)||url1.length()<=0){
			System.err.println("url输入错误");
			return;
		}

		System.err.println("开始下载！！！");
//		List list=TestSAX.read("");
		List list=CopyOftesthtml.read(url1);
		
		int i=0;
		  System.err.println("正在下载，共"+list.size()+"张图片");
		if(list.size()>0){
			for(Iterator it = list.iterator();it.hasNext();){
				String a =(String) it.next();
				if(a.indexOf(".60x60")!=-1){
					a= a.replaceAll(".60x60",".400x400");
				}
				if(a.indexOf(".jpg")!=-1){
					String localFilePath=path+a1+i+".jpg";
					downloadFile(a,localFilePath);
					i++;
					
				}else if(a.indexOf(".gif")!=-1){
					String localFilePath=path+a1+i+".gif";
					downloadFile(a,localFilePath);
					i++;
				}
			}
		}System.err.println("下载结束");
	}
	
	
	

	/**  
     * 下载远程文件并保存到本地  
     * @param remoteFilePath 远程文件路径   
     * @param localFilePath 本地文件路径  
     */
    public static void downloadFile(String remoteFilePath, String localFilePath)
    {
        URL urlfile = null;
        HttpURLConnection httpUrl = null;
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        File f = new File(localFilePath);
        try
        {
            urlfile = new URL(remoteFilePath);
            httpUrl = (HttpURLConnection)urlfile.openConnection();
            httpUrl.connect();
            bis = new BufferedInputStream(httpUrl.getInputStream());
            bos = new BufferedOutputStream(new FileOutputStream(f));
            int len = 4096;
            byte[] b = new byte[len];
            while ((len = bis.read(b)) != -1)
            {
                bos.write(b, 0, len);
            }
            bos.flush();
            bis.close();
            httpUrl.disconnect();
            System.out.println("下载"+localFilePath+"成功");
        }
        catch (Exception e)
        {
        	System.err.println("下载"+localFilePath+"失败");
            e.printStackTrace();
        }
        finally
        {
            try
            {
                bis.close();
                bos.close();
            }
            catch (IOException e)
            {
                e.printStackTrace();
            }
        }
    }
}
