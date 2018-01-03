/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.time.LocalDate;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "booking")
public class Booking {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bookingID;
    private LocalDate dateBooking;
    private Double totalPrice;
    @ManyToOne
    @JoinColumn(name = "custID", referencedColumnName = "custID")
    private Customer customer;

    @OneToMany(mappedBy = "booking", fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
    private List<BookingDetail> bookingDetail;

    public Booking() {
    }

    public Booking(LocalDate dateBooking, Double totalPrice, Customer customer) {
        this.dateBooking = dateBooking;
        this.totalPrice = totalPrice;
        this.customer = customer;
    }

    

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public LocalDate getDateBooking() {
        return dateBooking;
    }

    public void setDateBooking(LocalDate dateBooking) {
        this.dateBooking = dateBooking;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public List<BookingDetail> getBookingDetail() {
        return bookingDetail;
    }

    public void setBookingDetail(List<BookingDetail> bookingDetail) {
        this.bookingDetail = bookingDetail;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    //search booking theo ngay
    public boolean checkBookingBydate(LocalDate dateFrom, LocalDate dateTo) {
        boolean availiable = false;
        if ((dateBooking.isAfter(dateFrom) || dateBooking.isEqual(dateFrom)) && (dateBooking.isBefore(dateTo)|| dateBooking.isEqual(dateTo) ) ) {
            availiable = true;
        }
        return availiable;
    }

}
