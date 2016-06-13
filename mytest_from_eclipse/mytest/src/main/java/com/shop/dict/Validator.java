package com.shop.dict;

import java.util.regex.Pattern;

public class Validator {
	/**
	 * 邮箱
	 * @param email
	 * @return
	 */
	 public static boolean validateEmail(String email){
	        boolean rst= Pattern.matches("[0-9a-zA-Z]+@[0-9a-zA-Z]+\\.[0-9a-zA-Z]+", email);
	        return rst;
	    }
	 /**
	  * 11位数字
	  * @param obj
	  * @return
	  */
	 public static boolean validatePhone(String obj) {
		 boolean rst= Pattern.matches("[0-9]{11}", obj.trim());
		 return rst;
		 
	 }
	 /**
	  * 数字和字母
	  * @param obj
	  * @return
	  */
	 public static boolean validateNum(String obj) {
		 boolean rst= Pattern.matches("^\\S+", obj.trim());
//		 boolean rst= Pattern.matches("^[0-9a-zA-Z]+", obj.trim());
		 return rst;
		 
	 }
}
