package entity;

import java.math.BigDecimal;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import org.springframework.format.annotation.NumberFormat;

@Entity
@Table(name = "visaCard")
public class VisaCard {
    @Id
//  @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int visaCardID;
    private int amount;   
    private String numofCard;
    private String nameOfOwner;
    private int CCV;
    private int expiredMonth;
    private int expiredYear;
    

    public VisaCard() {
    }

    public VisaCard(int visaCardID, int amount, String numofCard, String nameOfOwner, int CCV, int expiredMonth, int expiredYear) {
        this.visaCardID = visaCardID;
        this.amount = amount;
        this.numofCard = numofCard;
        this.nameOfOwner = nameOfOwner;
        this.CCV = CCV;
        this.expiredMonth = expiredMonth;
        this.expiredYear = expiredYear;
    }

    

    public int getCCV() {
        return CCV;
    }

    public void setCCV(int CCV) {
        this.CCV = CCV;
    }

    public int getExpiredMonth() {
        return expiredMonth;
    }

    public void setExpiredMonth(int expiredMonth) {
        this.expiredMonth = expiredMonth;
    }

    public int getExpiredYear() {
        return expiredYear;
    }

    public void setExpiredYear(int expiredYear) {
        this.expiredYear = expiredYear;
    }

   

    public int getVisaCardID() {
        return visaCardID;
    }

    public void setVisaCardID(int visaCardID) {
        this.visaCardID = visaCardID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getNumofCard() {
        return numofCard;
    }

    public void setNumofCard(String numofCard) {
        this.numofCard = numofCard;
    }


    public String getNameOfOwner() {
        return nameOfOwner;
    }

    public void setNameOfOwner(String nameOfOwner) {
        this.nameOfOwner = nameOfOwner;
    }  
}
