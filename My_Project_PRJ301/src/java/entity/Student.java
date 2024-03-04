/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;
import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class Student {
    private int id;
    private String name;
    private ArrayList<StudentGroup> groups = new ArrayList<>();

    public ArrayList<StudentGroup> getGroups() {
        return groups;
    }

    public void setGroups(ArrayList<StudentGroup> groups) {
        this.groups = groups;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
}
