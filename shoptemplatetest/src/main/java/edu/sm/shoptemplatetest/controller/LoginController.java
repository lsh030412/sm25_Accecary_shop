package edu.sm.shoptemplatetest.controller;

import edu.sm.shoptemplatetest.dto.Cust;
import edu.sm.shoptemplatetest.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
public class LoginController {

    final CustService custService;
    // 이름은 유니크
    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    }
@RequestMapping("/logout")
    public String logout(HttpSession session) {
        if(session != null) {
            session.invalidate();
        }
        return "index";
    }
    @RequestMapping("/loginimpl")
    // ?id=aaaaa&pwd=xxxxx
    public String loginimpl(Model model,
                            @RequestParam("id") String id,
                            @RequestParam("pwd") String pwd,
                            HttpSession session) throws Exception {
        log.info("ID:{}, PWD:{}", id, pwd);

        Cust dbCust = null;
        dbCust = custService.get(id);
        String next = "index";
        if(dbCust == null) {
            model.addAttribute("loginstate", "fail");
            model.addAttribute("center", "login");
        }else {
            if(dbCust.getCustPwd().equals(pwd)) {
                session.setAttribute("logincust", dbCust);
//                redirect 메인컨프롤러에 "main"으로 감
                next = "redirect:/";

            }else{
                model.addAttribute("loginstate", "fail");
                model.addAttribute("center", "login");
            }
        }

        return next;
    }
    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    }
    @RequestMapping("/mainregisterimpl")
    public String mainregisterimpl(Model model, Cust cust, HttpSession session) throws Exception {
        log.info("{}, {}, {}, {}, {}", cust.getCustPwd(), cust.getCustName(), cust.getCustId(), cust.getCustPnum(), cust.getCustNick());

//        try{
//            custService.register(cust);
//            session.setAttribute("logincust", cust);
//        }catch(Exception e){
//            log.info("error");
//            return "redirect:/register";
//        }

        return "redirect:/";
    }

}