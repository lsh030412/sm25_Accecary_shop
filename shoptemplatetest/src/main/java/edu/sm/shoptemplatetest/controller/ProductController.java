package edu.sm.shoptemplatetest.controller;

import edu.sm.shoptemplatetest.dto.Product;
import edu.sm.shoptemplatetest.service.ProductService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/product")
@RequiredArgsConstructor
@Slf4j
public class ProductController {

    final ProductService productService;
    String dir = "product/";

    @RequestMapping("/all_product")
    public String allProduct(Model model) throws Exception {
        List<Product> list = null;
        list = productService.get();
        model.addAttribute("plist", list);
        model.addAttribute("center", dir+"allproduct");
        return "index";
    }

    @RequestMapping("/get")
    public String get(Model model) throws Exception {
        List<Product> list = null;
        list = productService.get();
        // html밑에 로그인
        model.addAttribute("plist", list);
        model.addAttribute("left", "nullleft");
        model.addAttribute("center", dir+"get");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model) {
        // html밑에 로그인
        model.addAttribute("left", "nullleft");
        model.addAttribute("center", dir+"add");
        return "index";
    }
    @RequestMapping("/delete")
    public String delete(Model model, @RequestParam("id") int id) throws Exception {
        productService.remove(id);
        return "redirect:/product/get";
    }
    @RequestMapping("/detail")
    public String detail(Model model, @RequestParam("id") int id) throws Exception {
        Product product = null;
        product = productService.get(id);
        model.addAttribute("p", product);
        model.addAttribute("left", "nullleft");
        model.addAttribute("center", dir+"detail");
        return "index";
    }
    @RequestMapping("/see")
    public String see(Model model, @RequestParam("id") int id) throws Exception {
        Product product = null;
//        해당아이디값 가져오고
        product = productService.get(id);
//        p에 값을 넣는다
        model.addAttribute("p", product);
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"see");
        return "index";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Product product) throws Exception {
        productService.modify(product);
        return "redirect:/product/detail?id="+product.getProductId();
    }
    @RequestMapping("/addimpl")
    public String addimpl(Model model, Product product) throws Exception {
        log.info("Input Data {}, {}, {}, {}, {}, {}",
                product.getCateId(),
                product.getProductName(),
                product.getProductPrice(),
                product.getDiscountRate(),
                product.getProductQt(),
                product.getProductImgFile().getOriginalFilename());
        // html밑에 로그인
        productService.register(product);
        return "redirect:/product/get";
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
