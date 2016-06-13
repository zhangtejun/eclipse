package myPackage;

import org.springframework.orm.ibatis.SqlMapClientOperations;

import com.opensymphony.xwork2.ActionSupport;
import com.shop.jdbc.MultiJdbcAccess;

public class login extends ActionSupport{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

@Override
public String execute() throws Exception {
	// TODO Auto-generated method stub
	System.err.println("11111111111");
	
	MultiJdbcAccess aa=new MultiJdbcAccess();
	SqlMapClientOperations ss=aa.getSqlMap();
	Object s =ss.getClass();
	
	return super.execute();
}
}
