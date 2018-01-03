
package controller;

import entity.CategoryRoom;
import entity.Room;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.bind.annotation.RequestParam;
import repository.CategoryRoomRepository;
import repository.RoomRepository;


@Controller
public class CategoryController {
      @Autowired
    CategoryRoomRepository categoryRepo;
      @Autowired
      RoomRepository roomRepo;
      
//       @RequestMapping(value="/getAllRoom")
//    public String getAllRoom(Model model){
//        List<Room> listRoom = (List<Room>)roomRepo.findAll();
//        model.addAttribute("listRoom", listRoom);
//        return "listRoom";
//    }
    
    //danh sach list category
    @RequestMapping(value="/manage")
    public String showCategory(Model model){
        List<CategoryRoom> categoryRoomlist = (List<CategoryRoom>)categoryRepo.findAll();
        model.addAttribute("roomManagement", categoryRoomlist);
        return "managerCategoryRoom";
    }
    
    //danh sach room
    @RequestMapping(value = "/viewDetails/{categoryID}", method = GET )
    public String viewRoom(@PathVariable("categoryID") int id, Model model){
        List<Room> listRoom = (List<Room>)categoryRepo.listRoo(id);
        model.addAttribute("listRoom", listRoom);
        return "managerRoom";
    }
    
    //sua category room
    @RequestMapping(value = "/editCategory/{categoryID}", method = GET )
    public String editCategoryRoom(@PathVariable("categoryID") int id, Model model){
        CategoryRoom categoryRoom = categoryRepo.findOne(id);
        model.addAttribute("categoryRoom", categoryRoom);  
        model.addAttribute("title", "Edit Category Room");
        model.addAttribute("action", "edit");
        return "addCategory";
    }
    
    //luu category room
    @RequestMapping(value = "/savecategoryRoom", method = POST )
    public String saveRoom(CategoryRoom categoryRoom){
        categoryRepo.save(categoryRoom);
        return "redirect:/manage"; 
    }
    //xoa category
    @RequestMapping(value = "/delCategory/{categoryID}", method = GET)
    public String deletecategoryRoom(@PathVariable("categoryID") int id, Model model) {
        categoryRepo.delete(id);
        return "redirect:/manage";
    }
    //them category Room
    @RequestMapping(value = "/newCategory", method = GET )
    public String newCategory(Model model){
        model.addAttribute("categoryRoom", new CategoryRoom());
         model.addAttribute("title", "Add Category Room");
        model.addAttribute("action", "Add");
        return "addCategory";
    }
      
}
