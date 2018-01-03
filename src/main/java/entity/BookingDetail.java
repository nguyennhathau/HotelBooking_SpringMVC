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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "bookingDetail")
public class BookingDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int bookDetailID;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private LocalDate dateFrom;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private LocalDate dateTo;

    @ManyToOne
    @JoinColumn(name = "bookingID", referencedColumnName = "bookingID")
    private Booking booking;

    @OneToMany(mappedBy = "bookingDetail", fetch = FetchType.LAZY)
    List<ServicesDetail> servicesDetailList;

    @ManyToOne
    @JoinColumn(name = "roomID", referencedColumnName = "roomID")
    private Room room;

    public BookingDetail() {
    }

    public BookingDetail(LocalDate dateFrom, LocalDate dateTo, Booking booking, Room room) {
        this.dateFrom = dateFrom;
        this.dateTo = dateTo;
        this.booking = booking;
        this.room = room;
    }

    public int getBookDetailID() {
        return bookDetailID;
    }

    public void setBookDetailID(int bookDetailID) {
        this.bookDetailID = bookDetailID;
    }

    public LocalDate getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(LocalDate dateFrom) {
        this.dateFrom = dateFrom;
    }

    public LocalDate getDateTo() {
        return dateTo;
    }

    public void setDateTo(LocalDate dateTo) {
        this.dateTo = dateTo;
    }

    public Booking getBooking() {
        return booking;
    }

    public void setBooking(Booking booking) {
        this.booking = booking;
    }

    public List<ServicesDetail> getServicesDetailList() {
        return servicesDetailList;
    }

    public void setServicesDetailList(List<ServicesDetail> servicesDetailList) {
        this.servicesDetailList = servicesDetailList;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    //find room follow cust
    public boolean findRoomByCust(String name) {
        boolean flat = false;
        if (booking.getCustomer().getFullName().equals(name)) {
            flat = true;

        }
        return flat;
    }

}
