/*				
 * Copyright (C) FPT University , Ltd. 2023	
 * 07/02/2023 FPT 
 */
package dal;


import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext<T> {

    protected Connection connection;
    protected PreparedStatement statement;

    /**
     * get an connection
     *
     * @return connection or null
     * @throws ClassNotFoundException
     */
    public Connection getConnection() throws ClassNotFoundException {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String url = "jdbc:sqlserver://localhost:1433;databaseName=phongkham";
            String user = "sa";
            String password = "123";
            connection = DriverManager.getConnection(url, user, password);
            return connection;
        } catch (SQLException e) {
            System.out.println("Error " + e.getMessage() + "at DBContext");
            e.printStackTrace();
            return null;
        }
    }

    /**
     * get data from database
     *
     * @param sql : SQL query
     * @param rowMapper : data when get successful
     * @param parameter : parameter we want to pass to the SQL query
     * @return List
//     */
//    public List<T> query(String sql, IGenericMapper<T> rowMapper, Parameter... parameter) {
//        List<T> list = new ArrayList<>();
//        ResultSet resultSet = null;
//        try {
//            connection = getConnection();
//            statement = connection.prepareStatement(sql);
//
//            // set parameter
//            setParameter(parameter);
//
//            resultSet = statement.executeQuery();
//            while (resultSet.next()) {
//                list.add(rowMapper.mapRow(resultSet));
//            }
//            return list;
//        } catch (SQLException e) {
//            System.out.println("PHAM KHAC VINH: Loi o ham query");
//
//            throw new RuntimeException(e);
//        } catch (ClassNotFoundException ex) {
//            System.out.println("PHAM KHAC VINH: Loi o ham query");
//
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        } finally {
//            try {
//                if (connection != null) {
//                    connection.close();
//                }
//                if (statement != null) {
//                    statement.close();
//                }
//                if (resultSet != null) {
//                    resultSet.close();
//                }
//            } catch (SQLException e) {
//                System.out.println("PHAM KHAC VINH: Loi o ham query");
//                throw new RuntimeException(e);
//            }
//        }
//        return null;
//    }
//
//    /**
//     * Update an record in database (delete or update)
//     *
//     * @param sql : SQL query
//     * @param parameter : parameter we want to pass to the SQL query
//     */
//    public void update(String sql, Parameter... parameter) {
//        ResultSet resultSet = null;
//        try {
//            connection = getConnection();
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        try {
//            connection.setAutoCommit(false);
//            statement = connection.prepareStatement(sql);
//            setParameter(parameter);
//            statement.executeUpdate();
//            connection.commit();
//        } catch (SQLException e) {
//            try {
//                connection.rollback();
//            } catch (SQLException ex) {
//                throw new RuntimeException(ex);
//            }
//            throw new RuntimeException(e);
//        } finally {
//            try {
//                if (connection != null) {
//                    connection.close();
//                }
//                if (statement != null) {
//                    statement.close();
//                }
//                if (resultSet != null) {
//                    resultSet.close();
//                }
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }
//        }
//
//    }
//
//    /**
//     * insert to database
//     *
//     * @param sql : SQL query
//     * @param parameter : parameter we want to pass to the SQL query
//     * @return id of record after insert
//     */
//    public int insert(String sql, Parameter... parameter) {
//        ResultSet resultSet = null;
//        try {
//            connection = getConnection();
//        } catch (ClassNotFoundException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        int id = 0;
//        try {
//            connection.setAutoCommit(false);
//            statement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
//            setParameter(parameter);
//
//            statement.executeUpdate();
//            resultSet = statement.getGeneratedKeys();
//            if (resultSet.next()) {
//                id = resultSet.getInt(1);
//            }
//            connection.commit();
//        } catch (SQLException e) {
//            try {
//                System.out.println("PHAM KHAC VINH (LOI INSERT): " + e.getMessage());
//                e.printStackTrace();
//                connection.rollback();
//            } catch (SQLException ex) {
//                throw new RuntimeException(ex);
//            }
//        } finally {
//            try {
//                if (connection != null) {
//                    connection.close();
//                }
//                if (statement != null) {
//                    statement.close();
//                }
//                if (resultSet != null) {
//                    resultSet.close();
//                }
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }
//
//        }
//        return id;
//    }
//
////    public int insert2(String tableName, HashMap<String, String> values) {
////        Set<String> keys = values.keySet();
////        Parameter params[] = new Parameter[keys.size()];
////        String sql = "insert into [" + tableName + "](";
////        String paramQuery = "";
////        int count=0;
////        for (String key : keys) {
////            sql += "[" + key + "],";
////            paramQuery += "?,";
////            params[count++] = new Parameter;
////        }
////        paramQuery = paramQuery.substring(0, paramQuery.length() - 2);
////        sql = sql.substring(0, sql.length() - 2) + ") values ("+paramQuery+")";
////        return insert(sql, params);
////    }
//    /**
//     * find Total record of table
//     * @param sql
//     * @return total record or 0
//     */
//    public int findTotalRecord(String sql) {
//        ResultSet resultSet = null;
//        try {
//            connection = getConnection();
//            statement = connection.prepareStatement(sql);
//            resultSet = statement.executeQuery();
//            if (resultSet.next()) {
//                int total = resultSet.getInt(1);
//                return total;
//            }
//        } catch (ClassNotFoundException ex) {
//            ex.printStackTrace();
//        } catch (SQLException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//
//        }finally {
//            try {
//                if (connection != null) {
//                    connection.close();
//                }
//                if (statement != null) {
//                    statement.close();
//                }
//                if (resultSet != null) {
//                    resultSet.close();
//                }
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }
//        }
//        return 0;
//    }
//       public int findTotalRecordByKeyWord(String sql,Parameter... parameters) {
//        ResultSet resultSet = null;
//        try {
//            connection = getConnection();
//            statement = connection.prepareStatement(sql);
//            setParameter(parameters);
//            resultSet = statement.executeQuery();
//            if (resultSet.next()) {
//                int total = resultSet.getInt(1);
//                return total;
//            }
//        } catch (ClassNotFoundException ex) {
//            ex.printStackTrace();
//        } catch (SQLException ex) {
//            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
//
//        }finally {
//            try {
//                if (connection != null) {
//                    connection.close();
//                }
//                if (statement != null) {
//                    statement.close();
//                }
//                if (resultSet != null) {
//                    resultSet.close();
//                }
//            } catch (SQLException e) {
//                throw new RuntimeException(e);
//            }
//        }
//        return 0;
//    }
//
//
//    /**
//     * mapping parameter to their types
//     *
//     * @param parameter : parameter we want to pass to the SQL query
//     */
//     private void setParameter(Parameter... parameter) {
//        try {
//            for (int i = 0; i < parameter.length; i++) {
//                Parameter object = parameter[i];
//                int index = i + 1;
//                if (object.getValue() instanceof Integer) {
//                    statement.setInt(index, (int) object.getValue());
//                } else if (object.getValue() instanceof String) {
//                    statement.setString(index, (String) object.getValue());
//                } else if (object.getValue() instanceof Date) {
//                    statement.setDate(index, (Date) object.getValue());
//                } else if (object.getValue() == null) {
//                    statement.setNull(index, object.getType());
//                } else if (object.getValue() instanceof Timestamp) {
//                    statement.setTimestamp(index, (Timestamp) object.getValue());
//                } else if (object.getValue() instanceof Boolean) {
//                    statement.setBoolean(index, (Boolean) object.getValue());
//                }else if (object.getValue() instanceof BigDecimal) {
//                    statement.setBigDecimal(index, (BigDecimal) object.getValue());
//                }else if (object.getValue() instanceof Float) {
//                    statement.setFloat(index, (float) object.getValue());
//                }
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }

    public static void main(String[] args) {
        DBContext test = new DBContext();
        try {
            test.connection = test.getConnection();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(test.connection);
    }
}
