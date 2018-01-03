/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Booking;
import entity.BookingDetail;
import entity.Customer;
import entity.PromotionDetail;
import entity.Room;
import entity.VisaCard;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import repository.BookingDetailRepository;
import repository.BookingRepository;
import repository.CategoryRoomRepository;
import repository.CustomerRepository;
import repository.PromotionDetailRepository;
import repository.RoomRepository;
import repository.VisaRepository;


@Controller
public class BookingController {
      @Autowired
      CategoryRoomRepository categoryRepo;
      @Autowired
      RoomRepository roomRepo;
      @Autowired
      VisaRepository visaRepo;
      @Autowired
      CustomerRepository customerRepo;
      @Autowired
      BookingRepository bookingRepo;
      @Autowired
      BookingDetailRepository bookingDetailRepo;
      @Autowired
      PromotionDetailRepository promotionDetailRepo;
      //check availibility room

       @RequestMapping(value="/AllRoom")             
    public String getAllRoom( Model model){       
        
        List<Room> listRoom = (List<Room>)roomRepo.findAll();
             for(Room room : listRoom){
          List<PromotionDetail> promotionDetailList = promotionDetailRepo.findProDetail(room.getRoomID());
          room.setPromotionDetailList(promotionDetailList);
      }
        model.addAttribute("RoomkList", listRoom); 
        return "listRoom";
    }
    //Room Detail
      @RequestMapping(value="/roomDetail")
    public String viewRoomDetail(@RequestParam(name = "roomID") int id,
                            
                            Model model){       
        
        Room roomDetail = (Room)roomRepo.findOne(1);
        model.addAttribute("roomDetail", roomDetail);
        return "roomDetail";
    }
    
    //Handler Book Button is clicked 
     @RequestMapping(value="/listroomselect",method = RequestMethod.GET)
    public String viewListRoomSelecterd(@RequestParam(name = "listRoomSelect") Integer[] myArray,
                                        @RequestParam(name= "inputdatecheckin") String inputdatecheckin,
                                        @RequestParam(name = "inputdatecheckout") String inputdatecheckout,
                            Model model){       
                           
                List<Room> listAllRoom = (List<Room>)roomRepo.findAll();
                
                for(Room room : listAllRoom){
          List<PromotionDetail> promotionDetailList = promotionDetailRepo.findProDetail(room.getRoomID());
          room.setPromotionDetailList(promotionDetailList);
      }
                
               
               model.addAttribute("listRoom", myArray);
               model.addAttribute("listAllRoom", listAllRoom);
               model.addAttribute("inputdatecheckin", inputdatecheckin);
               model.addAttribute("inputdatecheckout", inputdatecheckout);
               double totalAllPrice=0;
               for( int a : myArray){
                     List<PromotionDetail> promotionDetailList = promotionDetailRepo.findProDetail(a);
                     Room room = (Room)roomRepo.findByRoomID(a);
                     room.setPromotionDetailList(promotionDetailList);
                     totalAllPrice += room.getTotalPrice();
               }
               model.addAttribute("totalAllPrice", totalAllPrice);
             return "roomSelected";
    }
    //// Filter room available
    
    @RequestMapping(value = "/searchRoomAvailable" )
    public String searchRoom(@RequestParam(name="dateFrom") String dateFrom,
                             @RequestParam(name="dateTo") String dateTo,
                             
                             Model model){
      

          LocalDate df1 = LocalDate.parse(dateFrom);
          LocalDate df2 = LocalDate.parse(dateTo);
     List<Room> RoomkList = (List<Room>) roomRepo.findAll();
     //fix lazy for bookingDetial. Lay list bookingDetail set vao lai cho room.
      for(Room room : RoomkList){
          List<BookingDetail> bookingDetailList = bookingDetailRepo.findbookingRoom(room.getRoomID());
          room.setBookingDetailList(bookingDetailList);
      }
         //fix lazy for PromotionDetial.  Lay list promotionDetail set vao lai cho room.
      for(Room room : RoomkList){
          List<PromotionDetail> promotionDetailList = promotionDetailRepo.findProDetail(room.getRoomID());
          room.setPromotionDetailList(promotionDetailList);
      }
      
      
      List<Room> Roomavaliable = new ArrayList();
      for(Room r : RoomkList){
          if(r.checkAvaliable(df1, df2)){
              Roomavaliable.add(r);
           }
      }
        model.addAttribute("RoomkList", Roomavaliable);
         model.addAttribute("dateFrom", dateFrom);
        model.addAttribute("dateTo", dateTo);
        return "listRoom";
    }
    
   
    
//    Handler Submit in checkout button is clicked.
    @RequestMapping(value="/checkout", method = RequestMethod.GET)
    public String checkout(@RequestParam(name = "lastListRoom") Integer[] myArray,
                            @RequestParam(name= "fullname") String name,
                              @RequestParam(name= "email") String email,
                              @RequestParam(name= "phone") String phone,
                              @RequestParam(name= "address") String address,
                              @RequestParam(name= "namecard") String namecard,
                             @RequestParam(name= "serienumber") String serienumber,
                             @RequestParam(name= "totalprice") String totalprice,
                             @RequestParam(name= "inputdatecheckin") String inputdatecheckin,
                             @RequestParam(name = "inputdatecheckout") String inputdatecheckout,
                             @RequestParam(name= "ccv") int ccv,
                             @RequestParam(name= "expiredMonth") int expiredMonth,
                             @RequestParam(name= "expiredYear") int expiredYear,
                            Model model){
      
       
        VisaCard visa = visaRepo.findByNumofCard(serienumber);
       
        Customer customer = new Customer(name, address, phone, email);
      
        if((visa.getCCV()== ccv) && (visa.getExpiredMonth()==expiredMonth) && (visa.getExpiredYear()==expiredYear) && (visa.getAmount() > Integer.parseInt(totalprice)) ){            
            customerRepo.save(customer);
            LocalDate date = LocalDate.now();
            int tru = visa.getAmount() - Integer.parseInt(totalprice);
            visa.setAmount(tru);          
            visaRepo.save(visa);
            Double priceDouble = Double.parseDouble(totalprice);
            Booking booking = new Booking(date, priceDouble, customer);
            bookingRepo.save(booking);
            LocalDate df1 = LocalDate.parse(inputdatecheckin);
            LocalDate df2 = LocalDate.parse(inputdatecheckout);
            for(int roomID: myArray){
                Room room = (Room)roomRepo.findByRoomID(roomID);
                BookingDetail bookingDetail = new BookingDetail(df1, df2, booking, room);
                bookingDetailRepo.save(bookingDetail);
            }          
            return "redirect:/";
        }
        else {   
             model.addAttribute("listRoom", myArray);
        model.addAttribute("fullname", name);
        model.addAttribute("email", email);
        model.addAttribute("phone", phone);
        model.addAttribute("address", address);
        model.addAttribute("namecard", namecard);
        model.addAttribute("serienumber", serienumber);
             model.addAttribute("totalprice", totalprice);
            String mess = "Not enought money";
            model.addAttribute("mess", mess);   
            model.addAttribute("customer", customer);
            return "roomSelected";
        }
        
    }

}
