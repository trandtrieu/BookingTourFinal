/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Lenovo
 */
public class Comment {
    private int idCmt;
    private String name;
    private String cmt;

    public Comment() {
    }

    public Comment(int idCmt, String name, String cmt) {
        this.idCmt = idCmt;
        this.name = name;
        this.cmt = cmt;
    }

    public int getIdCmt() {
        return idCmt;
    }

    public void setIdCmt(int idCmt) {
        this.idCmt = idCmt;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCmt() {
        return cmt;
    }

    public void setCmt(String cmt) {
        this.cmt = cmt;
    }

    @Override
    public String toString() {
        return "Comment{" + "idCmt=" + idCmt + ", name=" + name + ", cmt=" + cmt + '}';
    }
    
    
}
