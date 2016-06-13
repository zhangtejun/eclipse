package com.shop.jdbc;

import java.util.HashMap;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientOperations;

public class MultiJdbcAccess
{

    public MultiJdbcAccess()
    {
        sqlMapRegister = new HashMap(3);
        sqlExecutorRegister = new HashMap(3);
//        transactionTemplateRegister = new HashMap(3);
    }

//    public TransactionTemplate getTransactionTemplate(String jdbcId)
//    {
//        return (TransactionTemplate)transactionTemplateRegister.get(jdbcId);
//    }
//
//    public TransactionTemplate getTransactionTemplate()
//    {
//        return getTransactionTemplate("default");
//    }

    public SqlMapClientOperations getSqlMap()
    {
        return getSqlMap("default");
    }

    public SqlMapClientOperations getSqlMap(String jdbcId)
    {
        return (SqlMapClientOperations)sqlMapRegister.get(jdbcId);
    }

    public SqlExecutor getSqlExecutor()
    {
        return getSqlExecutor("default");
    }

    public SqlExecutor getSqlExecutor(String jdbcId)
    {
        return (SqlExecutor)sqlExecutorRegister.get(jdbcId);
    }

    public void setSqlExecutorRegister(Map sqlExecutorRegister)
    {
        this.sqlExecutorRegister = sqlExecutorRegister;
    }

    public void setSqlMapRegister(Map sqlMapRegister)
    {
        this.sqlMapRegister = sqlMapRegister;
    }

    public void setTransactionTemplateRegister(Map transactionTemplateRegister)
    {
        this.transactionTemplateRegister = transactionTemplateRegister;
    }

    public static final String DB_DEFAULT = "default";
    public static final String DB_MBANK = "mbank";
    private Map sqlMapRegister;
    private Map sqlExecutorRegister;
    private Map transactionTemplateRegister;
}