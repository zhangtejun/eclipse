package com.shop.jdbc;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface SqlExecutor
extends ConnectionProvider
{

public abstract Object query(String s, Object aobj[], ResultSetHandler resultsethandler)
    throws SQLException;

public abstract Object query(String s, Object aobj[], ResultSetHandler resultsethandler, int i, int j)
    throws SQLException;

public abstract Object queryObject(String s, Object aobj[], String s1)
    throws SQLException;

public abstract List queryObjectList(String s, Object aobj[], String s1)
    throws SQLException;

public abstract List queryObjectList(String s, Object aobj[], String s1, int i, int j)
    throws SQLException;

public abstract Object[] queryArray(String s, Object aobj[])
    throws SQLException;

public abstract List queryArrayList(String s, Object aobj[])
    throws SQLException;

public abstract List queryArrayList(String s, Object aobj[], int i, int j)
    throws SQLException;

public abstract Map queryMap(String s, Object aobj[])
    throws SQLException;

public abstract List queryMapList(String s, Object aobj[])
    throws SQLException;

public abstract List queryMapList(String s, Object aobj[], int i, int j)
    throws SQLException;

public abstract Object queryBean(String s, Object aobj[], Class class1)
    throws SQLException;

public abstract List queryBeanList(String s, Object aobj[], Class class1)
    throws SQLException;

public abstract List queryBeanList(String s, Object aobj[], Class class1, int i, int j)
    throws SQLException;

public abstract int update(String s, Object aobj[])
    throws SQLException;

public abstract int[] batch(String s, Object aobj[][])
    throws SQLException;
}