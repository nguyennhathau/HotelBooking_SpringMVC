/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Booking;
import entity.BookingDetail;
import entity.Customer;
import entity.ServicesDetail;
import entity.Servicess;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.bind.annotation.RequestParam;
import repository.BookingDetailRepository;
import repository.BookingRepository;
import repository.CustomerRepository;
import repository.ServicesDetailRepo;
import repository.ServicessRepository;


@Controller
public class SeoController {

    @Autowired
    CustomerRepository custRepo;
    @Autowired
    BookingRepository bookingRepo;

    @Autowired
    BookingDetailRepository bookingDetailRepo;
    @Autowired
    ServicessRepository serviceRepo;
    @Autowired
    ServicesDetailRepo servicesdtRepo;

    //danh sach khach hang
    @RequestMapping(value = "/managerCust")
    public String getCustomers(Model model,@RequestParam(name = "pages", defaultValue = "1")  int pages) {
        List<Customer> listCustomer = (List<Customer>) custRepo.findAll();
        
        
        //dem so trang booking
        int totalCust = listCustomer.size();
        int firstResult, maxResult;
        
        

        int totalPages;
        if (totalCust % 12 == 0) {
            totalPages = totalCust / 6;
        } else {
            totalPages = (totalCust / 6) + 1;
        }
        int count = 0;
        if (totalCust <= 6) {
            firstResult = 0;
            maxResult = totalCust;
        } else {
            firstResult = (pages - 1) * 6;
            maxResult = firstResult + 6;
        }
        List<Customer> listCustpt = new ArrayList<Customer>();
        for (int i = firstResult; i < totalCust && i < maxResult; i++) {
            count++;
            listCustpt.add(listCustomer.get(i));
        }
        
        //count = count + firstResult;
        model.addAttribute("pages", pages);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("listCustomer", listCustpt);
        return "manageCustomer";
    }

    // xoa khach hang
    @RequestMapping(value = "/deleteCust/{custID}", method = GET)
    public String delCust(@PathVariable("custID") int id, Customer Cust) {
        custRepo.delete(id);
        return "redirect:/managerCust";
    }

    // edit khach hang
    @RequestMapping(value = "/editCust/{custID}", method = GET)
    public String editCust(@PathVariable("custID") int id, Model model) {
        Customer cust = custRepo.findOne(id);
        model.addAttribute("cust", cust);
        model.addAttribute("title", "Edit Customer");
        return "editCust";
    }

    //luu khach hang
    @RequestMapping(value = "/savecust", method = POST)
    public String saveCust(Customer cust) {
        custRepo.save(cust);
        return "redirect:/managerCust";
    }

    //danh sach booking
    @RequestMapping(value = "/getBooking")
    public String getBooking(Model model,@RequestParam(name = "pages", defaultValue = "1")  int pages) {
        List<Booking> listBooking = (List<Booking>) bookingRepo.findAll();
        
        //dem so trang booking
        int totalBooking = listBooking.size();
        int firstResult, maxResult;             
        int totalPages;
        if (totalBooking % 12 == 0) {
            totalPages = totalBooking / 6;
        } else {
            totalPages = (totalBooking / 6) + 1;
        }
        int count = 0;
        if (totalBooking <= 6) {
            firstResult = 0;
            maxResult = totalBooking;
        } else {
            firstResult = (pages - 1) * 6;
            maxResult = firstResult + 6;
        }
        List<Booking> ptListBook = new ArrayList<Booking>();
        for (int i = firstResult; i < totalBooking && i < maxResult; i++) {
            count++;
            ptListBook.add(listBooking.get(i));
        }
        
        //count = count + firstResult;
        model.addAttribute("pages", pages);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("listBooking", ptListBook);
        return "manageBooking";
    }

    //xoa booking 
    @RequestMapping(value = "/deletebook/{bookingID}", method = GET)
    public String delBooking(@PathVariable("bookingID") int id, Booking booking) {
        bookingRepo.delete(id);
        return "redirect:/getBooking";
    }
    
    //danh sach booking detail
    @RequestMapping(value = "/viewDetailBook/{bookingID}", method = GET)
    public String viewBookingDetail(@PathVariable("bookingID") int bookingid, Model model) {
        List<BookingDetail> bdList = (List<BookingDetail>) bookingDetailRepo.findDetailBook(bookingid);
        model.addAttribute("bdList", bdList);
        model.addAttribute("bookingid", bookingid);
        return "viewBookingDetail";
    }

    //xoa booking detail ---chua dc
    @RequestMapping(value = "/deleteBookdt/{bookDetailID}", method = GET)
    public String delbookDetail(@PathVariable("bookDetailID") int id, Model model) {
        bookingDetailRepo.delete(id);
        model.addAttribute("message", "delete booking detail susscess");
        return "redirect:/getBooking";
    }
    
    //danh sach services detail cua phong
    @RequestMapping(value = "/viewServices/{bookDetailID}", method = GET)
    public String viewServicesDetailRoom(@PathVariable("bookDetailID") int bookDetailID, Model model) {
        List<ServicesDetail> servicedtList = (List<ServicesDetail>) servicesdtRepo.getServiceRoom(bookDetailID);
        model.addAttribute("servicedtList", servicedtList);
        model.addAttribute("bookDetailID", bookDetailID);
        return "viewServicesDetail";
    }

    //luu service detail
    @RequestMapping(value = "/saveServicdt", method = POST)
    public String saveAcc(ServicesDetail servicedt, Model model) {
        servicesdtRepo.save(servicedt);
        int bkdt = servicedt.getBookingDetail().getBookDetailID();
        List<Servicess> listService = (List<Servicess>) serviceRepo.findAll();
        model.addAttribute("listService", listService);
        return "redirect:/viewServices/"+bkdt;
    }

    //xoa service detail --chua dc
    @RequestMapping(value = "/deleteServicedt/${id}", method = GET)
    public String delServicedt(@PathVariable("id") int id, Model model) {
        servicesdtRepo.delete(id);
        model.addAttribute("message", "delete service detail susscess");
        return "redirect:/getBooking";
    }

//    edit service detail
    @RequestMapping(value = "/editServicedt/{serviceDetailID}", method = GET)
    public String editServicedt(@PathVariable("serviceDetailID") int id, Model model) {
        ServicesDetail servicesdt = servicesdtRepo.findOne(id);
        List<Servicess> listService = (List<Servicess>) serviceRepo.findAll();
        model.addAttribute("listService", listService);
        model.addAttribute("servicesdt", servicesdt);
        model.addAttribute("action", "edit");
        model.addAttribute("title", "Edit Service Booking");
        return "addServicedt";
    }
}
