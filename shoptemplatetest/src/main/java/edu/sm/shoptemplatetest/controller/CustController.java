package edu.sm.shoptemplatetest.controller;

import edu.sm.shoptemplatetest.dto.Cust;
import edu.sm.shoptemplatetest.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@Slf4j
@RequestMapping("/cust_get")
@RequiredArgsConstructor
public class CustController {

    final CustService custService;

    String dir = "cust/";

    @RequestMapping("")
    public String get(Model model) throws Exception {
        List<Cust> list = null;
        list = custService.get();

        model.addAttribute("clist", list);
        model.addAttribute("left", "nullleft");
        model.addAttribute("center", dir+"get");
        return "index";
    }

    @RequestMapping("/delete")
    public String delete(Model model, @RequestParam("id") String id) throws Exception {
        custService.remove(id);
        return "redirect:/cust_get/get";
    }

    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") String id) throws Exception {
        Cust cust = null;
        cust = custService.get(id);
        model.addAttribute("cust", cust);
        model.addAttribute("left", "nullleft");
        model.addAttribute("center", dir+"detail");
        return "index";
    }

    @RequestMapping("/myinfo")
    public String myinfo(Model model, @RequestParam("id") String id) throws Exception {
        Cust cust = null;
        cust = custService.get(id);
        model.addAttribute("cust", cust);
        model.addAttribute("left", "nullleft");
        model.addAttribute("center", dir+"myinfo");
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String udpateimpl(Model model, Cust cust) throws Exception {
        custService.modify(cust);
        return "redirect:/cust_get/detail?id="+cust.getCustId();
    }

    @RequestMapping("/charge")
    public String charge(Model model, HttpSession session) throws Exception {
        Cust loginCust = (Cust) session.getAttribute("logincust");
        if (loginCust == null) {
            return "redirect:/login"; // 로그인 안했을 경우
        }

        Cust cust = custService.get(loginCust.getCustId());
        model.addAttribute("cust", cust);
        model.addAttribute("left", "nullleft");
        model.addAttribute("center", "cust/charge");
        return "index";
    }

    @PostMapping("/chargeimpl")
    public String chargeimpl(@RequestParam("amount") int amount, HttpSession session) throws Exception {
        Cust loginCust = (Cust) session.getAttribute("logincust");
        if (loginCust == null) {
            return "redirect:/login";
        }

        // 현재 금액 가져오기
        Cust cust = custService.get(loginCust.getCustId());
        cust.setCustMoney(cust.getCustMoney() + amount);

        custService.modify(cust); // update 수행
        session.setAttribute("logincust", cust); // 세션도 갱신

        return "redirect:/cust_get/charge";
    }



}
