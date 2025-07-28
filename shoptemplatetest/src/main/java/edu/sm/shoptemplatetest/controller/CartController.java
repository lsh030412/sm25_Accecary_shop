package edu.sm.shoptemplatetest.controller;

import edu.sm.shoptemplatetest.dto.Cart;
import edu.sm.shoptemplatetest.service.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

//이렇게 클래스에 매핑해도 됨(html클릭했을때
@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    final CartService cartService;
    // html 을 어디에 저장할거냐
    String dir = "cart/";

    // 아무것도 없을때
    @RequestMapping("")
    public String login(Model model, @RequestParam("id") String id) throws Exception {
        List<Cart> list = null;
        list = cartService.findByCustId(id);
        // html밑에 로그인
        model.addAttribute("carts", list);
        model.addAttribute("left", "nullleft");
        model.addAttribute("center", dir+"cart");
        return "index";
    }
    @RequestMapping("/add")
    public String add(Model model, Cart cart) throws Exception {
        cartService.register(cart);

        return "redirect:/cart?id="+cart.getCustId();
    }
    @RequestMapping("/del")
    public String del(Model model, Cart cart) throws Exception {
        cartService.remove(cart);

        return "redirect:/cart?id="+cart.getCustId();
    }
    @RequestMapping("/mod")
    public String mod(Model model, Cart cart) throws Exception {
        cartService.modify(cart);

        return "redirect:/cart?id="+cart.getCustId();
    }
    @RequestMapping("/addcart")
    public Object addcart(Cart cart) throws Exception {

        int result = 1;
        try{
            cartService.register(cart);
        }catch(Exception e){
            result =0;
            throw e;
        }
        return result;
    }
}
