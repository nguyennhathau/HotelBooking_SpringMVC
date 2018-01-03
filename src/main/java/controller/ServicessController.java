package controller;

import entity.Promotion;
import entity.Servicess;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.bind.annotation.RequestParam;
import repository.ServicessRepository;

/**@RequestMapping(value="/getAllServicesPro")
    public String getAllServicesPro(Model model){
        List<ServicesPromotion> listServicesPro = (List<ServicesPromotion>)servicesPromotionRepo.findAll();
        model.addAttribute("listServicesPro", listServicesPro);
        return "listServicesPro";
    }
 *
 * @author PC
 */
@Controller
public class ServicessController {
    @Autowired
    ServicessRepository servicessRepo;
    
    @RequestMapping(value="/getALLServices")
    public String getAllServices(Model model){
        List<Servicess> listServicess = (List<Servicess>)servicessRepo.findAll();
        model.addAttribute("listServicess", listServicess);
        return "listServicess";
    }
    @RequestMapping(value = "/deleteServicess/{servicesID}", method = GET)
    public String deleteServicess(@RequestParam(name = "servicesID") int id, Model model) {
        servicessRepo.delete(id);
        model.addAttribute("massage", "delete suscess");
        return "redirect:/getALLServices";
    }
    @RequestMapping(value = "/newServicess", method = GET )
    public String newServicess(Model model){
        model.addAttribute("servicess", new Servicess());
        model.addAttribute("action", "add");
        model.addAttribute("title", "Add Servicess");
        return "addServicess";
    }
    @RequestMapping(value = "/saveServicess", method = POST )
    public String saveServicess(Servicess servicess){
        servicessRepo.save(servicess);
        return "redirect:/getALLServices"; 
    }
    
    //edit service
    @RequestMapping(value = "/editServices/{servicesID}", method = GET )
    public String editservice(@PathVariable("servicesID") int id, Model model){
        Servicess servicess = servicessRepo.findOne(id);
        model.addAttribute("servicess", servicess); 
        model.addAttribute("action", "edit");
        model.addAttribute("title", "Edit Servicess");
        return "addServicess";
    }
}
