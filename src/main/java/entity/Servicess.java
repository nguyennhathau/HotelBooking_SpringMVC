
package entity;

import java.io.Serializable;
import java.text.NumberFormat;
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
import static org.springframework.data.jpa.domain.AbstractPersistable_.id;

@Entity
@Table(name="servicess")
public class Servicess implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int servicesID;
    private String servicesName;
    private String description;
    private int price;
    
    @OneToMany(mappedBy = "servicess",fetch = FetchType.LAZY)
    List<ServicesDetail> servicesDetailList;
    
    @ManyToOne
    @JoinColumn(name = "serviceProID",referencedColumnName = "serviceProID")
    private ServicesPromotion servicesPro;
  
    
    public Servicess() {
    }

    public Servicess(String servicesName, String description, int price, ServicesPromotion servicesPro) {
        this.servicesName = servicesName;
        this.description = description;
        this.price = price;
        this.servicesPro = servicesPro;
    }

    public int getServicesID() {
        return servicesID;
    }

    public void setServicesID(int servicesID) {
        this.servicesID = servicesID;
    }

    public String getServicesName() {
        return servicesName;
    }

    public void setServicesName(String servicesName) {
        this.servicesName = servicesName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public List<ServicesDetail> getServicesDetailList() {
        return servicesDetailList;
    }

    public void setServicesDetailList(List<ServicesDetail> servicesDetailList) {
        this.servicesDetailList = servicesDetailList;
    }

    public ServicesPromotion getServicesPro() {
        return servicesPro;
    }

    public void setServicesPro(ServicesPromotion servicesPro) {
        this.servicesPro = servicesPro;
    }
    public String getFormattedPrice(){
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        String priceFormatted= currency.format(price);
        return priceFormatted;
    }
    
    
    
}
