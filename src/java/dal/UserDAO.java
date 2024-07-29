/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Enums.UserRoleEnum;
import dto.DoctorCardDto;
import dto.DoctorDetailDto;
import entity.Certificate;
import entity.Feedback;
import entity.Major;
import entity.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class UserDAO extends DBContext {

    public List<User> findAll() {

        List<User> list = new ArrayList<>();
        String sql = "SELECT [userId]\n"
                + "      ,[majorId]\n"
                + "      ,[role]\n"
                + "      ,[address]\n"
                + "      ,[avatar]\n"
                + "      ,[name]\n"
                + "      ,[phone]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[token]\n"
                + "  FROM [dbo].[User]";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int userId = resultSet.getInt("userId");
                int majorId = resultSet.getInt("majorId");
                String role = resultSet.getString("role");
                String address = resultSet.getString("address");
                String avatar = resultSet.getString("avatar");
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String token = resultSet.getString("token");
                User user = new User(userId, majorId, role, address, avatar, name, phone, email, password, token);
                list.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
//                if (resultSet != null) {
//                    resultSet.close();
//                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        List<User> list = userDAO.findAll();
        if (list.isEmpty()) {
            System.out.println("List is Empty");
        } else {

            for (User user : userDAO.findAll()) {
                System.out.println(user);
            }
        }
    }

    public void createUser(User userRegister) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ( "
                + "           [name]\n"
                + "           ,[phone]\n"
                + "           ,[email]\n"
                + "           ,[password]\n"
                + "           ,[token])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?)";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            //Dua vao user va lay ra de sql
            statement.setString(1, userRegister.getName());
            statement.setString(2, userRegister.getPhone());
            statement.setString(3, userRegister.getEmail());
            statement.setString(4, userRegister.getPassword());
            statement.setString(5, userRegister.getToken());
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
//                if (resultSet != null) {
//                    resultSet.close();
//                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }

    public User findbyEmail(User userRegister) {
        List<User> list = new ArrayList<>();
        String sql = "SELECT [userId]\n"
                + "      ,[majorId]\n"
                + "      ,[role]\n"
                + "      ,[address]\n"
                + "      ,[avatar]\n"
                + "      ,[name]\n"
                + "      ,[phone]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[token]\n"
                + "  FROM [dbo].[User] where [email] = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            //Dua vao user va lay ra de sql
            statement.setString(1, userRegister.getEmail());
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int userId = resultSet.getInt("userId");
                int majorId = resultSet.getInt("majorId");
                String role = resultSet.getString("role");
                String address = resultSet.getString("address");
                String avatar = resultSet.getString("avatar");
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String token = resultSet.getString("token");
                User userFound = new User(userId, majorId, role, address, avatar, name, phone, email, password, token);
                list.add(userFound);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
//                if (resultSet != null) {
//                    resultSet.close();
//                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list.isEmpty() ? null : list.get(0);
    }

    public boolean setNewPassword(User userRegister) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [password] = ?\n"
                + "      \n"
                + " WHERE email = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            //Dua vao user va lay ra de sql
            statement.setString(1, userRegister.getPassword());
            statement.setString(2, userRegister.getEmail());

            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
//                if (resultSet != null) {
//                    resultSet.close();
//                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return false;
    }

    public User findByUsernamePassword(User user) {

        String sql = "SELECT [userId]\n"
                + "      ,[majorId]\n"
                + "      ,[role]\n"
                + "      ,[address]\n"
                + "      ,[avatar]\n"
                + "      ,[name]\n"
                + "      ,[phone]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[token]\n"
                + "  FROM [dbo].[User]"
                + "where email = ? and password = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            //Dua vao user va lay ra de sql
            statement.setString(1, user.getEmail());
            statement.setString(2, user.getPassword());

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int userId = resultSet.getInt("userId");
                int majorId = resultSet.getInt("majorId");
                String role = resultSet.getString("role");
                String address = resultSet.getString("address");
                String avatar = resultSet.getString("avatar");
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String token = resultSet.getString("token");
                User userFound = new User(userId, majorId, role, address, avatar, name, phone, email, password, token);
                return userFound;

            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
//                if (resultSet != null) {
//                    resultSet.close();
//                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return null;
    }

    public void updateProfile(User user) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET "
                + "      [avatar] = ?"
                + "      ,[name] = ?"
                + "      ,[phone] = ?"
                + "      ,[address] = ?"
                + " WHERE email = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            //Dua vao user va lay ra de sql
            statement.setString(1, user.getAvatar());

            statement.setString(2, user.getName());
            statement.setString(3, user.getPhone());
            statement.setString(4, user.getAddress());
            statement.setString(5, user.getEmail());
            statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
//                if (resultSet != null) {
//                    resultSet.close();
//                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

    }

    public User getUserById(int userId) {
        String sql = "SELECT [userId]\n"
                + "      ,[majorId]\n"
                + "      ,[role]\n"
                + "      ,[address]\n"
                + "      ,[avatar]\n"
                + "      ,[name]\n"
                + "      ,[phone]\n"
                + "      ,[email]\n"
                + "      ,[password]\n"
                + "      ,[token]\n"
                + "  FROM [dbo].[User]"
                + "where userId = ? ";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, userId);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int majorId = resultSet.getInt("majorId");
                String role = resultSet.getString("role");
                String address = resultSet.getString("address");
                String avatar = resultSet.getString("avatar");
                String name = resultSet.getString("name");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String token = resultSet.getString("token");
                User userFound = new User(userId, majorId, role, address, avatar, name, phone, email, password, token);
                return userFound;

            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
//                if (resultSet != null) {
//                    resultSet.close();
//                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return null;
    }

    public List<DoctorCardDto> findDoctorsBasicInformation(int offset, int fetch, String query) {
        List<DoctorCardDto> list = new ArrayList<>();
        String role = UserRoleEnum.UserRole.Professor.toString();
        String sql = "SELECT [userId]\n"
                + "      ,[User].[name] as userName\n"
                + "      ,[Major].[name] as majorName\n"
                + "      ,[avatar]\n"
                + "      ,[Major].[majorId]\n"
                + "  FROM [dbo].[User] "
                + " LEFT JOIN [Major] on [User].majorId = [Major].majorId "
                + "where [role] = ? and ( [Major].name like ? or [User].name like ?) ORDER BY [Major].[name] OFFSET ? rows FETCH next ? rows only ";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, role);
            statement.setString(2, "%" + query + "%");
            statement.setString(3, "%" + query + "%");
            statement.setInt(4, offset);
            statement.setInt(5, fetch);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int userId = resultSet.getInt("userId");
                String avatar = resultSet.getString("avatar");
                String doctorName = resultSet.getString("userName");
                String majorName = resultSet.getString("majorName");
                int majorId = resultSet.getInt("majorId");
                DoctorCardDto doctorCardDto = new DoctorCardDto(doctorName, majorName, userId, avatar, majorId);
                list.add(doctorCardDto);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    public List<DoctorCardDto> findDoctorsByMajor(int majorId) {
        List<DoctorCardDto> list = new ArrayList<>();
        String role = UserRoleEnum.UserRole.Professor.toString();
        String sql = "SELECT [userId]\n"
                + "      ,[User].[name] as userName\n"
                + "      ,[Major].[name] as majorName\n"
                + "      ,[avatar]\n"
                + "  FROM [dbo].[User] "
                + " LEFT JOIN [Major] on [User].majorId = [Major].majorId "
                + "where [role] = ? and [User].majorId = ? ";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, role);
            statement.setInt(2, majorId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int userId = resultSet.getInt("userId");
                String avatar = resultSet.getString("avatar");
                String doctorName = resultSet.getString("userName");
                String majorName = resultSet.getString("majorName");
                DoctorCardDto doctorCardDto = new DoctorCardDto(doctorName, majorName, userId, avatar, majorId);
                list.add(doctorCardDto);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    public List<DoctorCardDto> findTop4Doctors() {
        List<DoctorCardDto> list = new ArrayList<>();
        String role = UserRoleEnum.UserRole.Professor.toString();
        String sql = "SELECT TOP 4 [userId]\n"
                + "      ,[User].[name] as userName\n"
                + "      ,[Major].[name] as majorName\n"
                + "      ,[Major].[majorId] as majorId\n"
                + "      ,[avatar]\n"
                + "  FROM [dbo].[User] "
                + " LEFT JOIN [Major] on [User].majorId = [Major].majorId "
                + "where [role] = ?";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, role);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int userId = resultSet.getInt("userId");
                String avatar = resultSet.getString("avatar");
                String doctorName = resultSet.getString("userName");
                String majorName = resultSet.getString("majorName");
                int majorId = resultSet.getInt("majorId");
                DoctorCardDto doctorCardDto = new DoctorCardDto(doctorName, majorName, userId, avatar, 0);
                doctorCardDto.setMajorId(majorId);
                list.add(doctorCardDto);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    public List<DoctorCardDto> findDoctors() {
        List<DoctorCardDto> list = new ArrayList<>();
        String role = UserRoleEnum.UserRole.Professor.toString();
        String sql = "SELECT [userId]\n"
                + "      ,[User].[name] as userName\n"
                + "      ,[Major].[name] as majorName\n"
                + "      ,[Major].[majorId]\n"
                + "      ,[avatar]\n"
                + "      ,[address]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "  FROM [dbo].[User] "
                + " LEFT JOIN [Major] on [User].majorId = [Major].majorId "
                + "where [role] = ? ";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, role);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int userId = resultSet.getInt("userId");
                int majorId = resultSet.getInt("majorId");
                String avatar = resultSet.getString("avatar");
                String doctorName = resultSet.getString("userName");
                String majorName = resultSet.getString("majorName");
                String address = resultSet.getNString("address");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                DoctorCardDto doctorCardDto = new DoctorCardDto(doctorName, majorName, userId, avatar, majorId);
                doctorCardDto.setAddress(address);
                doctorCardDto.setPhone(phone);
                doctorCardDto.setEmail(email);
                list.add(doctorCardDto);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    public List<User> findAdmins() {
        List<User> list = new ArrayList<>();
        String role = UserRoleEnum.UserRole.Admin.toString();
        String sql = "SELECT [userId]\n"
                + "      ,[User].[name] as userName\n"
                + "      ,[avatar]\n"
                + "      ,[address]\n"
                + "      ,[email]\n"
                + "      ,[phone]\n"
                + "  FROM [dbo].[User] "
                + "where [role] = ? ";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, role);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int userId = resultSet.getInt("userId");
                User user = new User();
                user.setUserId(userId);
                list.add(user);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return list;
    }

    public int countDoctors(String query) {
        String role = UserRoleEnum.UserRole.Professor.toString();
        String sql = "SELECT COUNT([User].userId) as result "
                + "  FROM [dbo].[User] "
                + " LEFT JOIN [Major] on [User].majorId = [Major].majorId "
                + "where [role] = ? and ( [Major].name like ? or [User].name like ?) ";
        int result = 0;
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setString(1, role);
            statement.setString(2, "%" + query + "%");
            statement.setString(3, "%" + query + "%");
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                result = resultSet.getInt("result");
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return result;
    }

    public DoctorDetailDto getDoctorById(int id) {
        String sql = "SELECT doctor.[userId] as doctorId\n"
                + "      ,doctor.[majorId] as doctorMajor\n"
                + "      ,doctor.[avatar] as doctorAvatar\n"
                + "      ,doctor.[name] as doctorName\n"
                + "      ,m.[name] majorName\n"
                + "      ,c.[experience] experience\n"
                + "      ,c.[university] university\n"
                + "      ,c.[certificate] certificate\n"
                + "      ,c.[address] address\n"
                + "      ,c.[certificationId]\n"
                + "      ,certificateMajor.[name] certificateMajorName\n"
                + "  FROM [dbo].[User] doctor"
                + " LEFT JOIN [Certificate] c ON c.[userId] = doctor.[userId] "
                + " LEFT JOIN [Major] m ON doctor.[majorId] = m.[majorId] "
                + " LEFT JOIN [Major] certificateMajor ON c.[majorId] = certificateMajor.[majorId] "
                + "where doctor.[userId] = ? ";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int doctorId = resultSet.getInt("doctorId");
                int majorId = resultSet.getInt("doctorMajor");
                String majorName = resultSet.getString("majorName");
                String avatar = resultSet.getString("doctorAvatar");
                String doctorName = resultSet.getString("doctorName");
                DoctorDetailDto doctorDetailDto = new DoctorDetailDto();
                doctorDetailDto.setAvatar(avatar);
                doctorDetailDto.setDoctorId(doctorId);
                doctorDetailDto.setDoctorName(doctorName);
                doctorDetailDto.setMajor(majorName);
                doctorDetailDto.setMajorId(majorId);
                List<Certificate> certificates = new ArrayList<Certificate>();
                int certificateId = resultSet.getInt("certificationId");
                if(certificateId == 0){
                    doctorDetailDto.setCertificates(certificates);
                    return doctorDetailDto;
                }
                Certificate certificate = new Certificate();
                Major cerficateMajor = new Major();
                cerficateMajor.setNameMajor(resultSet.getString("certificateMajorName"));
                certificate.setAddress(resultSet.getString("address"));
                certificate.setCertificate(resultSet.getString("certificate"));
                certificate.setExperience(resultSet.getInt("experience"));
                certificate.setUniversity(resultSet.getString("university"));
                certificate.setMajor(cerficateMajor);
                certificates.add(certificate);
                while (resultSet.next()) {
                    certificate = new Certificate();
                    cerficateMajor = new Major();
                    cerficateMajor.setNameMajor(resultSet.getString("certificateMajorName"));
                    certificate.setAddress(resultSet.getString("address"));
                    certificate.setCertificate(resultSet.getString("certificate"));
                    certificate.setExperience(resultSet.getInt("experience"));
                    certificate.setUniversity(resultSet.getString("university"));
                    certificate.setMajor(cerficateMajor);
                    certificates.add(certificate);
                }
                doctorDetailDto.setCertificates(certificates);
                return doctorDetailDto;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
//                if (resultSet != null) {
//                    resultSet.close();
//                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return null;
    }

    public int createDdoctor(User userRegister) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ( "
                + "           [name]\n"
                + "           ,[phone]\n"
                + "           ,[email]\n"
                + "           ,[password]\n"
                + "           ,[role]\n"
                + "           ,[address]\n"
                + "           ,[avatar]\n"
                + "           ,[majorId])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?)";
        try {
            connection = getConnection();
            statement = connection.prepareStatement(sql);
            //Dua vao user va lay ra de sql
            statement.setString(1, userRegister.getName());
            statement.setString(2, userRegister.getPhone());
            statement.setString(3, userRegister.getEmail());
            statement.setString(4, userRegister.getPassword());
            statement.setString(5, UserRoleEnum.UserRole.Professor.toString());
            statement.setString(6, userRegister.getAddress());
            statement.setString(7, userRegister.getAvatar());
            statement.setInt(8, userRegister.getMajorId());
            return statement.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (statement != null) {
                    statement.close();
                }
//                if (resultSet != null) {
//                    resultSet.close();
//                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return 0;
    }

}
