package com.shop.jdbc;
import java.sql.ResultSet;
import java.sql.SQLException;

public interface ResultSetHandler
{

    public abstract Object handle(ResultSet resultset, int i)
        throws SQLException;

    public static final int NO_MAX_ROWS = -1;
}