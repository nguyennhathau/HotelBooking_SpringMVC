/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Promotion;
import entity.ServicesPromotion;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.bind.annotation.RequestParam;
import repository.PromotionRepository;
import repository.ServicesPromotionRepository;

/**
 *
 * @author PC
 */
@Controller

public class PromotionController {
    @Autowired
    PromotionRepository promotionRepo;
    
     @Autowired
    ServicesPromotionRepository servicesPromotionRepo;
     
    //-------------------promotion room
     
     @RequestMapping(value="/managerPromotion")
     public String showPromotion(){
         return "promotionManage";
     }
     
    @RequestMapping(value="/getAllPromotion")
    public String getAllPromotion(Model model){
        List<Promotion> listRoomPro = (List<Promotion>)promotionRepo.findAll();
        model.addAttribute("listRoomPro", listRoomPro);
        return "listPro";
    }
    
    //new promotion
    @RequestMapping(value = "/newPromotion", method = GET )
    public String newPromotion(Model model){
        model.addAttribute("promotion", new Promotion()); 
        model.addAttribute("action", "add");
        model.addAttribute("title", "Add Promotion");
        return "addPromotion";
    }
    
    
    @RequestMapping(value = "/savePro", method = POST )
    public String savePro(Promotion promotion){
        promotionRepo.save(promotion);
        return "redirect:/getAllRoomPromotion"; 
    }
    
    // xoa promotion
    @RequestMapping(value = "/deletepro/{proID}", method = GET)
    public String deletePromotion(@PathVariable("proID") int id, Model model) {
        promotionRepo.delete(id);
        model.addAttribute("message", "delete success");     
        return "redirect:/getAllRoomPromotion";
    }
    
    //edit promotion
    @RequestMapping(value = "/editpro/{proID}", method = GET )
    public String editPromotion(@PathVariable("proID") int id, Model model){
        Promotion promotion = promotionRepo.findOne(id);
        model.addAttribute("promotion", promotion); 
        model.addAttribute("action", "edit");
        model.addAttribute("title", "Edit Promotion");
        return "addPromotion";
    }
    
    //----------------service promotion
    @RequestMapping(value="/getAllServicesPro")
    public String getAllServicesPro(Model model){
        List<ServicesPromotion> listServicesPro = (List<ServicesPromotion>)servicesPromotionRepo.findAll();
        model.addAttribute("listServicesPro", listServicesPro);
        return "listServicesPro";
    }
    @RequestMapping(value = "/deleteServicesPro/{servicesID}", method = GET)
    public String deleteServicesPro(@PathVariable("servicesID") int id) {
        servicesPromotionRepo.delete(id);
        return "redirect:/getAllServicesPro";
    }
    @RequestMapping(value = "/newServicesPro", method = GET )
    public String newServicesPro(Model model){
        model.addAttribute("ServicesPro", new ServicesPromotion());
        model.addAttribute("action", "Add");
        model.addAttribute("title", "Add Service Promotion");
        return "addServicesPro";
    }
    @RequestMapping(value = "/saveServicesPro", method = POST )
    public String saveServicesPro(ServicesPromotion servicesPromotion){
        servicesPromotionRepo.save(servicesPromotion);
        return "redirect:/getAllServicesPro"; 
    }
    //edit ServicesPro
    @RequestMapping(value = "/editServicesPro/{serviceProID}", method = GET )
    public String editServicePro(@PathVariable("serviceProID") int id, Model model){
        ServicesPromotion servicePro = servicesPromotionRepo.findOne(id);
        model.addAttribute("ServicesPro", servicePro); 
        model.addAttribute("action", "edit");
        model.addAttribute("title", "Edit Service Promotion");
        return "addServicesPro";
    }
}
