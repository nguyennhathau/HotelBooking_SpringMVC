/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="servicesPromotion")
public class ServicesPromotion implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int serviceProID;
    private int pricePro;
    private String serviceProName;
    private String description;
    
    @OneToMany(mappedBy="servicesPro", fetch=FetchType.EAGER)
    List<Servicess> servicessList;

    
    public ServicesPromotion(){}

    public ServicesPromotion(int pricePro, String serviceProName, String description) {
        this.pricePro = pricePro;
        this.serviceProName = serviceProName;
        this.description = description;
    }

    public int getServiceProID() {
        return serviceProID;
    }

    public void setServiceProID(int serviceProID) {
        this.serviceProID = serviceProID;
    }

    public int getPricePro() {
        return pricePro;
    }

    public void setPricePro(int pricePro) {
        this.pricePro = pricePro;
    }

    
    

    public String getServiceProName() {
        return serviceProName;
    }

    public void setServiceProName(String serviceProName) {
        this.serviceProName = serviceProName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Servicess> getServicessList() {
        return servicessList;
    }

    public void setServicessList(List<Servicess> servicessList) {
        this.servicessList = servicessList;
    }

    

    
    
    
    
    
    
    
}
