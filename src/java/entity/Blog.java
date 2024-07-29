/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;



public class Blog {
    private int id;
    private int userId;
    private String title;
    private String content;
    private String date;
    private String author;
    
    public Blog(){}

    public Blog(int id, int userId, String title, String content, String date, String author) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.content = content;
        this.date = date;
        this.author = author;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }



    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public String getTitle() {
        return title;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setTitle(String title) {
        this.title = title;
    }
    
    
            
}
