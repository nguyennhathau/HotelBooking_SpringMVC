
package entity;

import java.text.NumberFormat;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "categoryRoom")
public class CategoryRoom {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int categoryID;
    private String type;
    private int size;
    private String description;
    private double price;
    private int numberOfPerson;

    public List<Room> getRoomList() {
        return roomList;
    }

    public void setRoomList(List<Room> roomList) {
        this.roomList = roomList;
    }
    
    
    @OneToMany(mappedBy = "categoryRoom",fetch = FetchType.EAGER)
    private List<Room> roomList;
    

    public CategoryRoom() {
    }

    public CategoryRoom(String type, int size, String description, double price, int numberOfPerson) {
        this.type = type;
        this.size = size;
        this.description = description;
        this.price = price;
        this.numberOfPerson = numberOfPerson;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

   

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getNumberOfPerson() {
        return numberOfPerson;
    }

    public void setNumberOfPerson(int numberOfPerson) {
        this.numberOfPerson = numberOfPerson;
    }
    public String getFormattedPrice(){
        NumberFormat currency = NumberFormat.getCurrencyInstance();
        String priceFormatted= currency.format(price);
        return priceFormatted;
    }
//
//    public List<Room> getRoomList() {
//        return roomList;
//    }
//
//    public void setRoomList(List<Room> roomList) {
//        this.roomList = roomList;
//    }

    
    
    
}
