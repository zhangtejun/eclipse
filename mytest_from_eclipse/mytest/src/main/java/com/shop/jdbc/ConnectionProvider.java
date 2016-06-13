package com.shop.jdbc;

import java.sql.Connection;
import java.sql.SQLException;

public interface ConnectionProvider {
    public abstract Connection getConnection()
            throws SQLException;

        public abstract void closeConnection(Connection connection)
            throws SQLException;
}
