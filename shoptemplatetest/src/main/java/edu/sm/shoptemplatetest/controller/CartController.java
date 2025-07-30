package edu.sm.shoptemplatetest.controller;

import edu.sm.shoptemplatetest.dto.Cart;
import edu.sm.shoptemplatetest.dto.Cust;
import edu.sm.shoptemplatetest.dto.Od;
import edu.sm.shoptemplatetest.dto.OdDetail;
import edu.sm.shoptemplatetest.service.CartService;
import edu.sm.shoptemplatetest.service.OdService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

//이렇게 클래스에 매핑해도 됨(html클릭했을때
@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    final CartService cartService;
    final OdService odService;
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

    @PostMapping("/order")
    public String orderFromCart(
            @RequestParam("odMethod")               String odMethod,
            @RequestParam("name")                   String name,
            @RequestParam("addr")                   String addr,
            @RequestParam("tel")                    String tel,
            @RequestParam("productId")              List<Integer> productIds,
            @RequestParam("odDetailQt")             List<Integer> qts,
            @RequestParam("odDetailTotalPrice")     List<Integer> totals,
            HttpSession session
    ) throws Exception {
        // 1) 로그인 사용자 확인
        Cust loginCust = (Cust) session.getAttribute("logincust");
        if (loginCust == null) {
            return "redirect:/login";
        }

        // 2) Od(헤더) 생성
        Od od = new Od();
        od.setCustId(loginCust.getCustId());
        od.setOdMethod(odMethod);
        od.setOdStatus("결제대기");        // 초기 상태
        // 총 수량 = 장바구니 개수 합
        int sumQt = qts.stream().mapToInt(Integer::intValue).sum();
        od.setOdQt(sumQt);
        od.setName(name);
        od.setAddr(addr);
        od.setTel(tel);

        // 3) OdDetail 리스트 생성
        List<OdDetail> details = new ArrayList<>();
        for (int i = 0; i < productIds.size(); i++) {
            OdDetail d = new OdDetail();
            d.setProductId(productIds.get(i));
            d.setOdDetailQt(qts.get(i));
            d.setOdDetailTotalPrice(totals.get(i));
            details.add(d);
        }
        od.setOdDetails(details);

        // 4) 서비스에 위임 (헤더 + 상세 모두 저장)
        odService.register(od);

        // 5) 주문 완료 페이지로 리다이렉트
        return "redirect:/od/list";
    }
}
