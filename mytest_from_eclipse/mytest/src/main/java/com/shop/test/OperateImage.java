package com.shop.test;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 图片剪切
 * @author zhangtj
 * @date   2016年5月16日
 */
public class OperateImage extends ActionSupport{
	private File file;// 对应文件域的file，封装文件内容
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	// ===源图片路径名称如:c:\1.jpg
	private String srcpath;
	// ===剪切图片存放路径名称.如:c:\2.jpg
	private String subpath="K:\\Users\\zhangtj\\Desktop\\111\\AA.jpg";
	// ===剪切点x坐标
	private int x1;
	private int y1;
	private int x2;
	private int y2;
	// ===剪切点宽度
	private int width;
	public int getX1() {
		return x1;
	}
	public void setX1(int x1) {
		this.x1 = x1;
	}
	public int getY1() {
		return y1;
	}
	public void setY1(int y1) {
		this.y1 = y1;
	}
	public int getX2() {
		return x2;
	}
	public void setX2(int x2) {
		this.x2 = x2;
	}
	public int getY2() {
		return y2;
	}
	public void setY2(int y2) {
		this.y2 = y2;
	}
	private int height;
	public OperateImage() {
	}
	/** 对图片裁剪，并把裁剪完的新图片保存 */
	@Override
	public String execute() throws Exception {
		FileInputStream is = null;
		ImageInputStream iis = null;
		try {
			// 读取图片文件
//			is = new FileInputStream(srcpath);
			if (file != null) {
				 is = new FileInputStream(getFile());
			}else{
				return INPUT;
			}
			/*
			 * 返回包含所有当前已注册 ImageReader 的 Iterator，这些 ImageReader 声称能够解码指定格式。
			 * 参数：formatName - 包含非正式格式名称 . （例如 "jpeg" 或 "tiff"）等 。
			 */
			Iterator<ImageReader> it = ImageIO.getImageReadersByFormatName("jpg");
			ImageReader reader = it.next();
			// 获取图片流
			iis = ImageIO.createImageInputStream(is);
			/*
			 * <p>iis:读取源.true:只向前搜索 </p>.将它标记为 ‘只向前搜索’。
			 * 此设置意味着包含在输入源中的图像将只按顺序读取，可能允许 reader 避免缓存包含与以前已经读取的图像关联的数据的那些输入部分。
			 */
			reader.setInput(iis, true);
			
			

			/*
			 * <p>描述如何对流进行解码的类<p>.用于指定如何在输入时从 Java Image I/O
			 * 框架的上下文中的流转换一幅图像或一组图像。用于特定图像格式的插件 将从其 ImageReader 实现的
			 * getDefaultReadParam 方法中返回 ImageReadParam 的实例。
			 */
			ImageReadParam param = reader.getDefaultReadParam();
			/*
			 * 图片裁剪区域。Rectangle 指定了坐标空间中的一个区域，通过 Rectangle 对象
			 * 的左上顶点的坐标（x，y）、宽度和高度可以定义这个区域。
			 */
			if(x1<0){
				x1=0;
			}
			if(y1<0){
				y1=0;
			}
			Rectangle rect = new Rectangle(Math.round(x1*640/200),Math.round(y1*960/200), Math.round((x2-x1)*640/200)>Math.round((y2-y1)*960/200)?Math.round((y2-y1)*960/200):Math.round((x2-x1)*640/200),Math.round((x2-x1)*640/200)>Math.round((y2-y1)*960/200)?Math.round((y2-y1)*960/200):Math.round((x2-x1)*640/200) );
			// 提供一个 BufferedImage，将其用作解码像素数据的目标。
			System.err.println(rect.toString());
			param.setSourceRegion(rect);
			/*
			 * 使用所提供的 ImageReadParam 读取通过索引 imageIndex 指定的对象，并将 它作为一个完整的
			 * BufferedImage 返回。
			 */
			BufferedImage bi = reader.read(0, param);
			// 保存新图片
			ImageIO.write(bi, "jpg", new File(subpath));
		} finally {
			if (is != null)
				is.close();
			if (iis != null)
				iis.close();
		}
		return SUCCESS;

	}
}