package controller;

import entity.Account;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import repository.AccountRepository;

@Controller
public class LoginController {
@Autowired
    AccountRepository accRepo;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap mm) {
        mm.put("acc", new Account());
        return "login";
    }
    
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String returnHome() {      
        return "home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam("username") String userName,
            @RequestParam("password") String password, Model model, HttpSession session) {
        List<Account> acc = (List<Account>) accRepo.findByUserNameAndPassword(userName, password);
        if (acc.size() > 0) {
            session.setAttribute("username", acc.get(0).getUserName());
            session.setAttribute("role", acc.get(0).getRole().getRoleID());
            return "home";
        } else {
            model.addAttribute("message", "Invalid Account.");
            return "login";
        }
    }

//    @RequestMapping(value = "/register", method = RequestMethod.GET)
//    public String register(Model model) {  
//        model.addAttribute("acc", new Account());
//        return "register";
//    }
//
//    @RequestMapping(value = "/register", method = RequestMethod.POST)
//    public String registerProcess(Account acc) {
//        accRepo.save(acc);
//        String message="create account sucess.";
//        return "redirect:/";
//    }
    
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String login(HttpSession session) {
        session.invalidate();
        return "login";
    }
}
