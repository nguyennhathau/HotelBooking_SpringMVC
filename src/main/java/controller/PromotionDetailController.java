/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Promotion;
import entity.PromotionDetail;
import entity.Room;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.bind.annotation.RequestParam;
import repository.PromotionDetailRepository;
import repository.PromotionRepository;
import repository.RoomRepository;


@Controller
public class PromotionDetailController {
    @Autowired
    PromotionDetailRepository promotionDetailRepo;
    @Autowired
    PromotionRepository promotionRepo;
    @Autowired
    RoomRepository roomrepo;
    @RequestMapping(value="/getAllRoomPromotion")
    public String getAllRoomPromotion(Model model){
        List<PromotionDetail> listRoomdtPro = (List<PromotionDetail>)promotionDetailRepo.findAll();
        model.addAttribute("listRoomPro", listRoomdtPro);
        return "listRoompro";
    }
    @RequestMapping(value = "/addProForRoom", method = GET )
    public String newCategory(Model model){
        List<Promotion> promotionList = (List<Promotion>)promotionRepo.findAll();
        model.addAttribute("promotionList",promotionList);
        List<Room> roomList = (List<Room>)roomrepo.findAll();
        model.addAttribute("roomList",roomList);
        model.addAttribute("promotionDe", new PromotionDetail());        
        return "addProForRoom";
    }


    
    
    @RequestMapping(value = "/save", method = POST )
    public String saveRoomPro(PromotionDetail promotionDe){
        promotionDetailRepo.save(promotionDe);
        return "redirect:/getAllRoomPromotion"; 
    }
    @RequestMapping(value = "/deleteRoompro", method = POST)
    public String delete(@RequestParam(name = "id") int id) {
        promotionDetailRepo.delete(id);
        return "redirect:/getAllRoomPromotion";
    }
    
    //edit room pro
//    @RequestMapping(value = "/editRoompro/{id}", method = GET )
//    public String editRoomDTPro(@PathVariable("id") int id, Model model){
//        PromotionDetail promotiondt = promotionDetailRepo.findOne(id);
//        model.addAttribute("promotionDe", promotiondt); 
//        model.addAttribute("action", "edit");
//        model.addAttribute("title", "Edit Room Promotion");
//        return "addProForRoom";
//    }
}
