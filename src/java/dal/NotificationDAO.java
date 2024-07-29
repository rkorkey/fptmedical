/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import dto.NotificationDTO;
import entity.Notification;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author My Computer
 */
public class NotificationDAO extends DBContext {

    public List<Notification> getListNotificationByUser(int userId) {
        List<Notification> notifications = new ArrayList<>();
        try {
            String sql = "SELECT * FROM [Notifications] n where n.[User_ID] = ? order by n.[Readed] , n.[Created_At] desc";
            connection = getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userId);
            ResultSet result = stm.executeQuery();
            Notification notification;
            while (result.next()) {
                notification = new Notification();
                notification.setId(result.getInt("Notification_ID"));
                notification.setIsReaded(result.getBoolean("Readed"));
                notification.setLink(result.getString("Attached_Link"));
                notification.setContent(result.getNString("Notification_Content"));
                notification.setCreatedAt(result.getTimestamp("Created_At"));
                notifications.add(notification);
            }
        } catch (Exception ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return notifications;
    }

    public int insertNotification(NotificationDTO notificationDTO) {
        try {
            String sql = "INSERT INTO [dbo].[Notifications]\n"
                    + "           ([Readed]\n"
                    + "           ,[User_ID]\n"
                    + "           ,[Notification_Content]\n"
                    + "           ,[Attached_Link]\n"
                    + "           ,[Created_At]) VALUES (? , ? , ? , ? , ?)";
            connection = getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, notificationDTO.isIsReaded());
            stm.setInt(2, notificationDTO.getToUserId());
            stm.setString(3, notificationDTO.getContent());
            stm.setString(4, notificationDTO.getLink());
            stm.setTimestamp(5, new java.sql.Timestamp(new Date().getTime()));
            return stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int updateIsReaded(int notificationId, boolean isReaded) {
        try {
            String sql = "UPDATE [dbo].[Notifications]\n"
                    + "   SET [Readed] = ? WHERE [Notification_ID] = ?";
            connection = getConnection();
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setBoolean(1, isReaded);
            stm.setInt(2, notificationId);
            return stm.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
