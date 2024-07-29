/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bo;

import dal.UserDAO;
import entity.User;
import java.util.List;

/**
 *
 * @author Lenovo
 */
public class UserLogic {

//    public User findByUsernamePassword(String email, String password) {

//    }

    public void createUser(String name, String phone, String email, String password, String token) {
        User userRegister = new User();
        UserDAO userDAO = new UserDAO();
        userRegister.setName(name);
        userRegister.setPhone(phone);
        userRegister.setEmail(email);
        userRegister.setPassword(password);
        userRegister.setToken(token);
        //check exist email
        if (userDAO.findbyEmail(userRegister) != null) {
            throw new IllegalArgumentException("Email Existed.!");
        } else {
            userDAO.createUser(userRegister);

        }
    }

//    public boolean setNewPassword(String email, String password) {
//        User user = new User();
//        UserDAO userDAO = new UserDAO();
//        user.setEmail(email);
//        user.setPassword(password);
//         boolean isSuccessSetNewPassword = userDAO.setNewPassword(user);
//         return isSuccessSetNewPassword;
//    }
    public void setNewPassword(String email, String password) {
        User userRegister = new User();
        UserDAO userDAO = new UserDAO();
        userRegister.setEmail(email);
        userRegister.setPassword(password);
          if (userDAO.findbyEmail(userRegister) == null) {
            throw new IllegalArgumentException("Email Is Not Availble.!");
        } else {
            userDAO.setNewPassword(userRegister);

        }
        
    }

//    public List<User> findByUsernamePassword(String email, String password) {
// User user = new User();
//        UserDAO userDAO = new UserDAO();
//        //Dua email nhan duoc o giao dien ve user
//        user.setEmail(email);
//        user.setPassword(password);
//        List<User> listUserFound = userDAO.findByUsernamePassword(user);
//        return listUserFound;
//    }

    public User findByUsernamePassword(String email, String password) {
User user = new User();
        UserDAO userDAO = new UserDAO();
        //Dua email nhan duoc o giao dien ve user
        user.setEmail(email);
        user.setPassword(password);
        user = userDAO.findByUsernamePassword(user);
        return user;
    }

//    public void updateProfile(String name, String email, String phone, String address) {
//      User user = new User();
//      UserDAO userDAO = new UserDAO();
//      
//      user.setName(name);
//      user.setEmail(email);
//      user.setPhone(phone);
//      user.setAddress(address);
//      userDAO.updateProfile(user);
//    }

//    public User updateProfile(String name, String email, String phone, String address) {
//              User user = new User();
//      UserDAO userDAO = new UserDAO();
//      
//      user.setName(name);
//      user.setEmail(email);
//      user.setPhone(phone);
//      user.setAddress(address);
//      userDAO.updateProfile(user);
//      
//    }

    public User updateProfile(User user) {
UserDAO userDAO = new UserDAO();   
userDAO.updateProfile(user);
return user;
    }
    

}
