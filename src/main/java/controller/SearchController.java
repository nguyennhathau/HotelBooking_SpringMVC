/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Booking;
import entity.BookingDetail;
import entity.Customer;
import entity.Room;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.bind.annotation.RequestParam;
import repository.BookingDetailRepository;
import repository.BookingRepository;
import repository.CustomerRepository;
import repository.RoomRepository;

@Controller
public class SearchController {

    @Autowired
    RoomRepository roomRepo;
    @Autowired
    BookingDetailRepository bdRepo;
    @Autowired
    BookingRepository bookingRepo;
    

    //search room empty
    @RequestMapping(value = "/searchroomempty", method = POST)
    public String findRoomempty(@RequestParam("fromdate") LocalDate fromdate,
            @RequestParam("todate") LocalDate todate, Model model) {
        List<Room> listRoom = (List<Room>) roomRepo.findAll();

        //fix loi lazy thu cong
        for (Room room : listRoom) {
            List<BookingDetail> bdList = bdRepo.findbookingRoom(room.getRoomID());
            room.setBookingDetailList(bdList);
        }
        List<Room> roomAvailabel = new ArrayList<Room>();
        for (Room r : listRoom) {
            if (r.checkAvaliable(fromdate, todate)) {
                roomAvailabel.add(r);
            }
        }
        model.addAttribute("roomAvailabel", roomAvailabel);
        model.addAttribute("action", "searchRoom");
        model.addAttribute("title", "Search Room");
        return "SearchRoom";
    }
    //findRoom by idRoom
    @RequestMapping(value = "/searchRoomByID" )
    public String searchBook(@RequestParam(name="idRoom") int id, Model model){
        List<Room> roomListSearch = (List<Room>) roomRepo.searchRoom(id);
        model.addAttribute("roomListSearch", roomListSearch);
        model.addAttribute("action", "searchRoomByID");
        model.addAttribute("title", "Search Room By ID");
        return "SearchRoom";
    }
    


    //search booking findRoom
    @RequestMapping(value = "/searchBooking", method = POST)
    public String searchBooking(@RequestParam("fromdate") LocalDate fromdateString,
            @RequestParam("todate") LocalDate todateString, Model model) {
        List<Booking> listBooking = (List<Booking>) bookingRepo.findAll();
        List<Booking> bookingValid = new ArrayList<Booking>();
        for (Booking r : listBooking) {
            if (r.checkBookingBydate(fromdateString, todateString)) {
                bookingValid.add(r);
            }
        }
        if (bookingValid.size() > 0) {
            int sum = bookingValid.size();
            model.addAttribute("message", "finded " + sum + " booking in this date.");
            model.addAttribute("listBooking", bookingValid);
            model.addAttribute("action", "searchBooking");
            model.addAttribute("title", "Search Booking");
            return "SearchRoom";
        } else {
            model.addAttribute("action", "searchBooking");
            model.addAttribute("title", "Search Booking");
            model.addAttribute("message", "don't find booking in this date.");
            return "SearchRoom";
        }

    }

    //search room theo cust
    @RequestMapping(value = "/findbyname", method = POST)
    public String findroomByName(@RequestParam("name") String name, Model model) {
        List<BookingDetail> bdList = (List<BookingDetail>) bdRepo.findAll();
        List<BookingDetail> List_bd = new ArrayList<BookingDetail>();
        for (BookingDetail bd : bdList) {
            if (bd.findRoomByCust(name)) {
                List_bd.add(bd);
            }
        }
        int totalRoomBook = List_bd.size();
        if (totalRoomBook > 0) {
            model.addAttribute("message", "finded " + totalRoomBook + " booking by "+ name);
            model.addAttribute("List_bd", List_bd);
        }else{
            model.addAttribute("message", "don't find booking by."+ name);
        }

        model.addAttribute("action", "roomByName");
        model.addAttribute("title", "Find Room By Customer: "+ name);
        return "SearchRoom";
    }
}
