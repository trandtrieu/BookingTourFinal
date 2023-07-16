package model;

import java.util.Date;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author DELL
 */
public class RequestCreateTour {

    private int requestId;
    private String nameGroup;
    private String name, phone, email, tourName;
    private String dateStart;
    private String dateEnd;
    private String price;
    private String quantityAd, quantityChild;
    private String note;
    private int user_id;
    private Boolean status;

    public RequestCreateTour() {
    }

    public RequestCreateTour(int requestId, String nameGroup, String name, String phone, String email, String tourName, String dateStart, String dateEnd, String price, String quantityAd, String quantityChild, String note, int user_id, Boolean status) {
        this.requestId = requestId;
        this.nameGroup = nameGroup;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.tourName = tourName;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.price = price;
        this.quantityAd = quantityAd;
        this.quantityChild = quantityChild;
        this.note = note;
        this.user_id = user_id;
        this.status = status;
    }

    public RequestCreateTour(String nameGroup, String name, String phone, String email, String tourName, String dateStart, String dateEnd, String price, String quantityAd, String quantityChild, String note, int user_id, Boolean status) {
        this.nameGroup = nameGroup;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.tourName = tourName;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.price = price;
        this.quantityAd = quantityAd;
        this.quantityChild = quantityChild;
        this.note = note;
        this.user_id = user_id;
        this.status = status;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public String getNameGroup() {
        return nameGroup;
    }

    public void setNameGroup(String nameGroup) {
        this.nameGroup = nameGroup;
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

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(String dateEnd) {
        this.dateEnd = dateEnd;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getQuantityAd() {
        return quantityAd;
    }

    public void setQuantityAd(String quantityAd) {
        this.quantityAd = quantityAd;
    }

    public String getQuantityChild() {
        return quantityChild;
    }

    public void setQuantityChild(String quantityChild) {
        this.quantityChild = quantityChild;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

}
