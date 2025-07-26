package edu.sm.shoptemplatetest.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
public class ProductController {
    String dir = "product/";

    @RequestMapping("/all_product")
    public String all_product(Model model) {
        model.addAttribute("center",dir+"allproduct");
        return "index";
    }
    @RequestMapping("/watch")
    public String watch(Model model) {
        model.addAttribute("center",dir+"watch");
        return "index";
    }
    @RequestMapping("/bracelet")
    public String bracelet(Model model) {
        model.addAttribute("center",dir+"bracelet");
        return "index";
    }
    @RequestMapping("/necklace")
    public String necklace(Model model) {
        model.addAttribute("center",dir+"necklace");
        return "index";
    }
    @RequestMapping("/ring")
    public String ring(Model model) {
        model.addAttribute("center",dir+"ring");
        return "index";
    }

}
