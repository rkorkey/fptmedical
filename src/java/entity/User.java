/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Lenovo
 */
public class User {

    private int userId;
    private int majorId;
    private String role;
    private String address;
    private String avatar;
    private String name;
    private String phone;
    private String email;
    private String password;
    private String token;

    public User() {
    }

    public User(int userId, int majorId, String role, String address, String avatar, String name, String phone, String email, String password, String token) {
        this.userId = userId;
        this.majorId = majorId;
        this.role = role;
        this.address = address;
        this.avatar = avatar;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.token = token;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getMajorId() {
        return majorId;
    }

    public void setMajorId(int majorId) {
        this.majorId = majorId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", majorId=" + majorId + ", role=" + role + ", address=" + address + ", avatar=" + avatar + ", name=" + name + ", phone=" + phone + ", email=" + email + ", password=" + password + ", token=" + token + '}';
    }

  

}
