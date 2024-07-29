/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.ResultSet;
import java.sql.SQLException;


/**
 *
 * @author My Computer
 */
public class ConfigDAO extends DBContext{
    public double getConfigValue(String configName){
        String sql = "SELECT * FROM Config WHERE [config_name] = ?" ;
        double result = 0;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, configName);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next())
            result = resultSet.getDouble("config_value");
        }catch(Exception exception){
            System.out.println(exception.getMessage());
        }
        return result;
    }
}
