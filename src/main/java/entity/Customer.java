/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "customer")
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int custID;
    private String fullName;
    private String address;
    private String phone;
    private String email;
    
//    @OneToMany(mappedBy = "customer",fetch=FetchType.LAZY)
//    List<VisaCard> visaCardList;
    
     @OneToMany(mappedBy = "customer",fetch=FetchType.EAGER)
     List<Booking> bookingList;
     
    public Customer() {
    }

    public Customer(String fullName, String address, String phone, String email) {
        this.fullName = fullName;
        this.address = address;
        this.phone = phone;
        this.email = email;
    }

    public int getCustID() {
        return custID;
    }

    public void setCustID(int custID) {
        this.custID = custID;
    }

    

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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

//    public List<VisaCard> getVisaCardList() {
//        return visaCardList;
//    }
//
//    public void setVisaCardList(List<VisaCard> visaCardList) {
//        this.visaCardList = visaCardList;
//    }

    public List<Booking> getBookingList() {
        return bookingList;
    }

    public void setBookingList(List<Booking> bookingList) {
        this.bookingList = bookingList;
    }

    
    
    
}
