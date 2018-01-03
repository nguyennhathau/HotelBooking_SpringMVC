/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.time.LocalDate;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="servicesDetail")
public class ServicesDetail {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int serviceDetailID;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private LocalDate dateStart;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private LocalDate dateEnd;
    
    @ManyToOne
     @JoinColumn(name = "bookDetailID",referencedColumnName = "bookDetailID")
    private BookingDetail bookingDetail;
    
    
   @ManyToOne
   @JoinColumn( name = "servicesID", referencedColumnName = "servicesID")
   private Servicess servicess;

    
    public ServicesDetail() {
    }

    public ServicesDetail(LocalDate dateStart, LocalDate dateEnd, BookingDetail bookingDetail, Servicess servicess) {
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.bookingDetail = bookingDetail;
        this.servicess = servicess;
    }

    public int getServiceDetailID() {
        return serviceDetailID;
    }

    public void setServiceDetailID(int serviceDetailID) {
        this.serviceDetailID = serviceDetailID;
    }

    public LocalDate getDateStart() {
        return dateStart;
    }

    public void setDateStart(LocalDate dateStart) {
        this.dateStart = dateStart;
    }

    public LocalDate getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(LocalDate dateEnd) {
        this.dateEnd = dateEnd;
    }

    public BookingDetail getBookingDetail() {
        return bookingDetail;
    }

    public void setBookingDetail(BookingDetail bookingDetail) {
        this.bookingDetail = bookingDetail;
    }

    public Servicess getServicess() {
        return servicess;
    }

    public void setServicess(Servicess servicess) {
        this.servicess = servicess;
    }
    
   

   
    
}
