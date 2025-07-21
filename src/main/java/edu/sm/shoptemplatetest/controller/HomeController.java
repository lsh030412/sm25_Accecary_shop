package edu.sm.shoptemplatetest.controller;

import edu.sm.shoptemplatetest.dto.Product; // 패키지 변경
import edu.sm.shoptemplatetest.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeController {

    @Autowired
    private ProductService productService;

    @GetMapping("/")
    public String index(Model model) {
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "index";  // index.jsp 렌더링
    }
}