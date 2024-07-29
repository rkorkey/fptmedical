/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import entity.TimeConfig;
import java.sql.ResultSet;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author My Computer
 */
public class TimeConfigDAO extends DBContext {

    public List<TimeConfig> getTimeConfigOrderByStartTimeAsc() {
        List<TimeConfig> result = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [TimeConfig] ORDER BY [start_hour]";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            TimeConfig timeConfig;
            while(resultSet.next()){
                Time startHour = resultSet.getTime("start_hour");
                Time endHour = resultSet.getTime("end_hour");
                timeConfig = new TimeConfig();
                timeConfig.setStartHour(startHour.toLocalTime());
                timeConfig.setEndHour(endHour.toLocalTime());
                result.add(timeConfig);
            }
        } catch (Exception exception) {
            System.out.println(exception.getMessage());
        }
        return result;
    }
}
