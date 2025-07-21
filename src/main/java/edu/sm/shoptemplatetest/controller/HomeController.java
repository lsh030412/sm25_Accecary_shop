package edu.sm.shoptemplatetest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String        index() {
        return "index";  // index.jsp 렌더링
    }
}
