package edu.sm.shoptemplatetest.controller;


import edu.sm.shoptemplatetest.dto.Product;
import edu.sm.shoptemplatetest.service.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@Slf4j
public class MainController {

    final ProductService productService;

    @RequestMapping("/")
    public String index(Model model) throws Exception {
        List<Product> list = null;
        list = productService.get();
        model.addAttribute("plist", list);
        model.addAttribute("left", "nullleft");
        model.addAttribute("center", "center");
        return "index";  // index.jsp 렌더링
    }
}
