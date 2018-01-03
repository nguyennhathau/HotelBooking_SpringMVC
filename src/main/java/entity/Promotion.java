package entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.springframework.format.annotation.DateTimeFormat;
@Entity
@Table(name="promotion")
public class Promotion implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int proID;
    private String proName;
     private String desctiption;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private LocalDate startDate;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private LocalDate endDate;
    private double discountPrice;
        
    @OneToMany(mappedBy = "promotion",fetch = FetchType.LAZY)
    List<PromotionDetail> promotionDetailList;
   // @OneToMany(mappedBy = "promotion",fetch = FetchType.EAGER, cascade = {CascadeType.ALL}) 
    //List<Room> roomProList;
    
//    @OneToOne(mappedBy = "promotion",fetch = FetchType.EAGER)
//    private CategoryRoom CategoryRoom;

    public Promotion() {
    }

    public Promotion(String proName, String desctiption, LocalDate startDate, LocalDate endDate, double discountPrice) {
        this.proName = proName;
        this.desctiption = desctiption;
        this.startDate = startDate;
        this.endDate = endDate;
        this.discountPrice = discountPrice;
    }

    public List<PromotionDetail> getPromotionDetailList() {
        return promotionDetailList;
    }

    public void setPromotionDetailList(List<PromotionDetail> promotionDetailList) {
        this.promotionDetailList = promotionDetailList;
    }

    public int getProID() {
        return proID;
    }

    public void setProID(int proID) {
        this.proID = proID;
    }

    
    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public String getDesctiption() {
        return desctiption;
    }

    public void setDesctiption(String desctiption) {
        this.desctiption = desctiption;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public double getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(double discountPrice) {
        this.discountPrice = discountPrice;
    }

    

    
    

    
    

   
    
    
}
