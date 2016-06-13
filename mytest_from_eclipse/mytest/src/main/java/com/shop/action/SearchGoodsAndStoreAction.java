package com.shop.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.shop.dict.Util;


public class SearchGoodsAndStoreAction extends BaseAction{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String Store() throws Exception {
		Map<String,Object> map=new HashMap<String,Object>();
		HttpServletRequest request = ServletActionContext.getRequest();
		String Search=request.getParameter("Search");
		map.put("LikeStoreName","%"+Search+"%");
		if(!Util.isNullOrEmpty(Search)){
			List list=	this.getSqlMap().queryForList("Goods.qryStore", map);
			if(list!=null&&list.size()>0){
				request.setAttribute("List", list);
			}
		}
		return "successstore";
	}
	public String Goods() throws Exception {
		Map<String,Object> map=new HashMap<String,Object>();
		HttpServletRequest request = ServletActionContext.getRequest();
		String Search=request.getParameter("Search");
		map.put("LikeGoodsName","%"+Search+"%");
		if(!Util.isNullOrEmpty(Search)){
			List list=	this.getSqlMap().queryForList("Goods.qrygoods", map);
			if(list!=null&&list.size()>0){
				request.setAttribute("List", list);
			}
		}
		return "successgoods";
	}
}
