/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author Lenovo
 */
public class Major {
    private int id ;
    private String nameMajor ;
    private String description ;
    private String imageUrl;

    public Major() {
    }

    public Major(int id, String nameMajor, String description) {
        this.id = id;
        this.nameMajor = nameMajor;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameMajor() {
        return nameMajor;
    }

    public void setNameMajor(String nameMajor) {
        this.nameMajor = nameMajor;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    

    @Override
    public String toString() {
        return "Major{" + "id=" + id + ", nameMajor=" + nameMajor + ", description=" + description + '}';
    }
   
    
}
