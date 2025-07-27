package edu.sm.shoptemplatetest.controller;

import edu.sm.shoptemplatetest.dto.Cust;
import edu.sm.shoptemplatetest.service.CustService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @RequestMapping("/updateimpl")
    public String udpateimpl(Model model, Cust cust) throws Exception {
        custService.modify(cust);
        return "redirect:/cust_get/detail?id="+cust.getCustId();
    }


}
