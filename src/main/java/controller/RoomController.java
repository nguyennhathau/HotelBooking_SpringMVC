/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Pictures;
import entity.Room;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import repository.RoomRepository;


@Controller
public class RoomController {

    @Autowired
    RoomRepository roomRepo;

    @RequestMapping(value = "/deleteRoom/{roomID}", method = GET)
    public String deleteRoom(@PathVariable(name = "roomID") int roomID, Model model) {       
        roomRepo.delete(roomID);
        model.addAttribute("message", "delete Room susscess");
        return "redirect:/manage";
    }
    @RequestMapping(value = "/viewIMG/{picID}", method = GET )
    public String viewRoom(@PathVariable("picID") int id, Model model){
        List<Pictures> listPic = (List<Pictures>)roomRepo.listPic(id);
        model.addAttribute("listPic", listPic);
        return "picture";
    }
}
