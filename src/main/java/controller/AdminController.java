/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Account;
import entity.Role;
import java.util.ArrayList;
import java.util.Collections;
import static java.util.Collections.sort;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;
import org.springframework.web.bind.annotation.RequestParam;
import repository.AccountRepository;
import repository.RoleRepository;

@Controller
public class AdminController {

    @Autowired
    AccountRepository accRepo;
    @Autowired
    RoleRepository roleRepo;
//    phan trang 

    @RequestMapping(value = "/managerAcc")
    public String showpagesAcc(Model model, @RequestParam(name = "pages", defaultValue = "1") int pages) {
//        List<Account> accList = (List<Account>) accRepo.findAll();
        List<Account> accList = (List<Account>) accRepo.findAllByOrderByAccountIDAsc();
    
        //dem so trang auction 
        int totalAcc = accList.size();
        int firstResult, maxResult;

        int totalPages;
        if (totalAcc % 12 == 0) {
            totalPages = totalAcc / 6;
        } else {
            totalPages = (totalAcc / 6) + 1;
        }
        int count = 0;
        if (totalAcc <= 6) {
            firstResult = 0;
            maxResult = totalAcc;
        } else {
            firstResult = (pages - 1) * 6;
            maxResult = firstResult + 6;
        }
        List<Account> ptAcclist = new ArrayList<Account>();
        for (int i = firstResult; i < totalAcc && i < maxResult; i++) {
            count++;
            ptAcclist.add(accList.get(i));
        }

        //count = count + firstResult;
        model.addAttribute("pages", pages);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("accList", ptAcclist);
        model.addAttribute("sort", "sortByidAsc");
        return "managerAcc";
    }
    
    @RequestMapping(value = "/managerAccDes")
    public String showpagesAccDes(Model model, @RequestParam(name = "pages") int pages) {
//        List<Account> accList = (List<Account>) accRepo.findAll();
        List<Account> accList = (List<Account>) accRepo.findAllByOrderByAccountIDDesc();
    
        //dem so trang auction 
        int totalAcc = accList.size();
        int firstResult, maxResult;

        int totalPages;
        if (totalAcc % 12 == 0) {
            totalPages = totalAcc / 6;
        } else {
            totalPages = (totalAcc / 6) + 1;
        }
        int count = 0;
        if (totalAcc <= 6) {
            firstResult = 0;
            maxResult = totalAcc;
        } else {
            firstResult = (pages - 1) * 6;
            maxResult = firstResult + 6;
        }
        List<Account> ptAcclist = new ArrayList<Account>();
        for (int i = firstResult; i < totalAcc && i < maxResult; i++) {
            count++;
            ptAcclist.add(accList.get(i));
        }

        //count = count + firstResult;
        model.addAttribute("pages", pages);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("accList", ptAcclist);
        model.addAttribute("sort", "sortByidDesc");
        return "managerAcc";
    }

    //sort by status
    @RequestMapping(value = "/sortbystatus")
    public String sortbyStatus(Model model, @RequestParam(name = "pages", defaultValue = "1") int pages) {
        List<Account> accList = (List<Account>) accRepo.sortAccountBystatus();
    
        //dem so trang auction 
        int totalAcc = accList.size();
        int firstResult, maxResult;

        int totalPages;
        if (totalAcc % 12 == 0) {
            totalPages = totalAcc / 6;
        } else {
            totalPages = (totalAcc / 6) + 1;
        }
        int count = 0;
        if (totalAcc <= 6) {
            firstResult = 0;
            maxResult = totalAcc;
        } else {
            firstResult = (pages - 1) * 6;
            maxResult = firstResult + 6;
        }
        List<Account> ptAcclist = new ArrayList<Account>();
        for (int i = firstResult; i < totalAcc && i < maxResult; i++) {
            count++;
            ptAcclist.add(accList.get(i));
        }

        //count = count + firstResult;
        model.addAttribute("pages", pages);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("accList", ptAcclist);
        model.addAttribute("sort", "sortByStatus");
        return "managerAcc";
    }
    
    //sort by status desc
    @RequestMapping(value = "/sortbystatusDesc")
    public String sortbyStatusDesc(Model model, @RequestParam(name = "pages", defaultValue = "1") int pages) {
        List<Account> accList = (List<Account>) accRepo.findAllByOrderByStatusDesc();
    
        //dem so trang auction 
        int totalAcc = accList.size();
        int firstResult, maxResult;

        int totalPages;
        if (totalAcc % 12 == 0) {
            totalPages = totalAcc / 6;
        } else {
            totalPages = (totalAcc / 6) + 1;
        }
        int count = 0;
        if (totalAcc <= 6) {
            firstResult = 0;
            maxResult = totalAcc;
        } else {
            firstResult = (pages - 1) * 6;
            maxResult = firstResult + 6;
        }
        List<Account> ptAcclist = new ArrayList<Account>();
        for (int i = firstResult; i < totalAcc && i < maxResult; i++) {
            count++;
            ptAcclist.add(accList.get(i));
        }

        //count = count + firstResult;
        model.addAttribute("pages", pages);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("accList", ptAcclist);
        model.addAttribute("sort", "sortByStatusDesc");
        return "managerAcc";
    }
    
    //sort by role
    @RequestMapping(value = "/sortbyrole")
    public String sortbyRole(Model model, @RequestParam(name = "pages", defaultValue = "1") int pages) {
        List<Account> accList = (List<Account>) accRepo.sortbyrole();
    
        //dem so trang auction 
        int totalAcc = accList.size();
        int firstResult, maxResult;

        int totalPages;
        if (totalAcc % 12 == 0) {
            totalPages = totalAcc / 6;
        } else {
            totalPages = (totalAcc / 6) + 1;
        }
        int count = 0;
        if (totalAcc <= 6) {
            firstResult = 0;
            maxResult = totalAcc;
        } else {
            firstResult = (pages - 1) * 6;
            maxResult = firstResult + 6;
        }
        List<Account> ptAcclist = new ArrayList<Account>();
        for (int i = firstResult; i < totalAcc && i < maxResult; i++) {
            count++;
            ptAcclist.add(accList.get(i));
        }

        //count = count + firstResult;
        model.addAttribute("pages", pages);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("accList", ptAcclist);
        model.addAttribute("sort", "sortByRole");
        return "managerAcc";
    }
    
    //sort by role desc
    @RequestMapping(value = "/sortbyroleDesc")
    public String sortbyRoleDesc(Model model, @RequestParam(name = "pages", defaultValue = "1") int pages) {
        List<Account> accList = (List<Account>) accRepo.sortbyroleDesc();
    
        //dem so trang auction 
        int totalAcc = accList.size();
        int firstResult, maxResult;

        int totalPages;
        if (totalAcc % 12 == 0) {
            totalPages = totalAcc / 6;
        } else {
            totalPages = (totalAcc / 6) + 1;
        }
        int count = 0;
        if (totalAcc <= 6) {
            firstResult = 0;
            maxResult = totalAcc;
        } else {
            firstResult = (pages - 1) * 6;
            maxResult = firstResult + 6;
        }
        List<Account> ptAcclist = new ArrayList<Account>();
        for (int i = firstResult; i < totalAcc && i < maxResult; i++) {
            count++;
            ptAcclist.add(accList.get(i));
        }

        //count = count + firstResult;
        model.addAttribute("pages", pages);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("accList", ptAcclist);
        model.addAttribute("sort", "sortByRoleDesc");
        return "managerAcc";
    }
    
    
    @RequestMapping(value = "/newAcc", method = GET)
    public String newAcc(Model model) {
        List<Role> listRole = (List<Role>) roleRepo.findAll();
        model.addAttribute("listRole", listRole);
        model.addAttribute("acc", new Account());
        model.addAttribute("action", "add");
        model.addAttribute("title", "Add Account");

        return "addAcc";
    }

    @RequestMapping(value = "/saveAcc", method = POST)
    public String saveAcc(Account acc) {
        accRepo.save(acc);
        return "redirect:/managerAcc";
    }

    @RequestMapping(value = "/deleteAcc/{accountID}", method = GET)
    public String delAcc(@PathVariable("accountID") int id, Account acc) {
        accRepo.delete(id);
        return "redirect:/managerAcc";
    }

    @RequestMapping(value = "/editAcc/{accountID}", method = GET)
    public String editAcc(@PathVariable("accountID") int id, Model model) {
        Account acc = accRepo.findOne(id);
        List<Role> listRole = (List<Role>) roleRepo.findAll();
        model.addAttribute("acc", acc);
        model.addAttribute("action", "edit");
        model.addAttribute("title", "Edit Account");
        model.addAttribute("listRole", listRole);
        return "addAcc";
    }

    @RequestMapping(value = "/changepassword")
    public String showPassword(Model model) {
        return "changepass";
    }

    //change pass word
    @RequestMapping(value = "/changepass", method = POST)
    public String changePassword(
            @RequestParam("username") String username,
            @RequestParam("oldPassword") String oldPassword,
            @RequestParam("newpassword") String newpassword,
            @RequestParam("confirm") String confirm, Model model) {
        String mess1, mess2, mess3;
//        List<Account> acc = accRepo.findByUserName(name);
        List<Account> acc = (List<Account>) accRepo.findByUserName(username);

        if (!(acc.get(0).getPassword()).equals(oldPassword)) {
            mess1 = "Password incorrect.";
            model.addAttribute("mess1", mess1);
            return "changepass";
        } else {
            if (!newpassword.equals(confirm)) {
                mess2 = "confirm incorrect.";
                model.addAttribute("mess2", mess2);
                return "changepass";
            } else {
                acc.get(0).setPassword(newpassword);
                accRepo.save(acc.get(0));
                mess3 = "Change password success.";
                model.addAttribute("mess3", mess3);
                return "changepass";
            }
        }

    }

}
