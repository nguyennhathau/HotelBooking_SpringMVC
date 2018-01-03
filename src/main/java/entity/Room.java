/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.time.LocalDate;
import java.util.ArrayList;
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
@Table(name = "room")
public class Room {
   
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int roomID;
//    private String status;

    @OneToMany(mappedBy = "room", fetch = FetchType.LAZY)
    List<BookingDetail> bookingDetailList;

    @OneToMany(mappedBy = "room", fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
    List<Pictures> picturesList;

    @ManyToOne
    @JoinColumn(name = "categoryID", referencedColumnName = "categoryID")
    private CategoryRoom categoryRoom;

    @OneToMany(mappedBy = "room", fetch = FetchType.LAZY)
    List<PromotionDetail> promotionDetailList;

    public Room() {
    }

    public Room( CategoryRoom categoryRoom) {
//        this.status = status;
        this.categoryRoom = categoryRoom;

    }

    public List<PromotionDetail> getPromotionDetailList() {
        return promotionDetailList;
    }

    public void setPromotionDetailList(List<PromotionDetail> promotionDetailList) {
        this.promotionDetailList = promotionDetailList;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }
    public List<BookingDetail> getBookingDetailList() {
        return bookingDetailList;
    }

    public void setBookingDetailList(List<BookingDetail> bookingDetailList) {
        this.bookingDetailList = bookingDetailList;
    }

    public List<Pictures> getPicturesList() {
        return picturesList;
    }

    public void setPicturesList(List<Pictures> picturesList) {
        this.picturesList = picturesList;
    }

    public CategoryRoom getCategoryRoom() {
        return categoryRoom;
    }

    public void setCategoryRoom(CategoryRoom categoryRoom) {
        this.categoryRoom = categoryRoom;
    }

    //check room available
    public boolean checkAvaliable(LocalDate dateFrom, LocalDate dateTo){
        boolean avaliable = true;
        for(BookingDetail bookingDetail : bookingDetailList){
            if(   ((bookingDetail.getDateFrom().isAfter(dateFrom) || bookingDetail.getDateFrom().isEqual(dateFrom)) && (bookingDetail.getDateFrom().isBefore(dateTo) ||  bookingDetail.getDateFrom().isEqual(dateTo)))
                    || 
                  ((bookingDetail.getDateTo().isAfter(dateFrom) ||   bookingDetail.getDateTo().isEqual(dateFrom)) && (bookingDetail.getDateTo().isBefore(dateTo) || bookingDetail.getDateTo().isEqual(dateTo)))    
                    ){
                avaliable = false;
            }
        }
        return  avaliable;
    }
    
    public Double getTotalPrice(){
        double total=0;
        double totaldiscount= 0;
        for(PromotionDetail prD: promotionDetailList){
            totaldiscount += prD.getPromotion().getDiscountPrice();
        }
        total = categoryRoom.getPrice() - categoryRoom.getPrice()*totaldiscount;
        return total;
    }
    
    public double getTotalDiscountPrice(){
        double totaldiscount = 0;
         for(PromotionDetail prD: promotionDetailList){
            totaldiscount += prD.getPromotion().getDiscountPrice();
        }
        return totaldiscount*100;
    }

    
}
