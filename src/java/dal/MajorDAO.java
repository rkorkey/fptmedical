/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import entity.Major;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author My Computer
 */
public class MajorDAO extends DBContext{
    public List<Major> getAll(){
        List<Major> result = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Major]";
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            Major major;
            while (resultSet.next()) {
                int id = resultSet.getInt("majorId");
                String name = resultSet.getString("name");
                major = new Major();
                major.setId(id);
                major.setImageUrl(resultSet.getString("imageUrl"));
                major.setDescription(resultSet.getString("description"));
                major.setNameMajor(name);
                result.add(major);
            }
        } catch (Exception ex) {
            Logger.getLogger(MajorDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return result;
    }
}
