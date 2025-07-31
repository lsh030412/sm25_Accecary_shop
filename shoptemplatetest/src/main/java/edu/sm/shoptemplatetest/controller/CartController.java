package edu.sm.shoptemplatetest.controller;

import edu.sm.shoptemplatetest.dto.Cart;
import edu.sm.shoptemplatetest.dto.Cust;
import edu.sm.shoptemplatetest.dto.Od;
import edu.sm.shoptemplatetest.dto.OdDetail;
import edu.sm.shoptemplatetest.service.CartService;
import edu.sm.shoptemplatetest.service.CustService;
import edu.sm.shoptemplatetest.service.OdService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;
    private final OdService odService;
    private final CustService custService;
    private final String dir = "cart/";

    /** 1) 장바구니 목록 조회 (/cart?id=custId) */
    @RequestMapping("")
    public String list(Model model,
                       @RequestParam("id") String id) throws Exception {
        List<Cart> carts = cartService.findByCustId(id);
        model.addAttribute("carts", carts);
        model.addAttribute("left", "nullleft");
        model.addAttribute("center", dir + "cart");
        return "index";
    }

    /** 2) 장바구니 추가 */
    @RequestMapping("/add")
    public String add(Cart cart) throws Exception {
        cartService.register(cart);
        return "redirect:/cart?id=" + cart.getCustId();
    }

    /** 3) 장바구니 삭제 */
    @RequestMapping("/del")
    public String del(Cart cart) throws Exception {
        cartService.remove(cart);
        return "redirect:/cart?id=" + cart.getCustId();
    }

    /** 4) 장바구니 수량 수정 */
    @RequestMapping("/mod")
    public String mod(Cart cart) throws Exception {
        cartService.modify(cart);
        return "redirect:/cart?id=" + cart.getCustId();
    }

    /** 5) AJAX 장바구니 추가 */
    @RequestMapping("/addcart")
    public Object addcart(Cart cart) throws Exception {
        int result = 1;
        try {
            cartService.register(cart);
        } catch (Exception e) {
            result = 0;
            throw e;
        }
        return result;
    }

    /** 6) 장바구니 → 전체 주문서 작성 페이지 (GET) */
    @GetMapping("/checkout")
    public String checkout(Model model,
                           HttpSession session) throws Exception {
        Cust login = (Cust) session.getAttribute("logincust");
        if (login == null) {
            return "redirect:/login";
        }

        List<Cart> carts = cartService.findByCustId(login.getCustId());
        int totalPrice = carts.stream()
                .mapToInt(c -> c.getProductPrice() * c.getProductQt())
                .sum();
        int custMoney = custService.get(login.getCustId()).getCustMoney();

        Od order = new Od();
        order.setOdDetails(
                carts.stream()
                        .map(c -> {
                            OdDetail d = new OdDetail();
                            d.setProductId(c.getProductId());
                            d.setOdDetailQt(c.getProductQt());
                            d.setOdDetailTotalPrice(c.getProductPrice() * c.getProductQt());
                            return d;
                        })
                        .collect(Collectors.toList())
        );

        model.addAttribute("order", order);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("custMoney", custMoney);
        model.addAttribute("left", "nullleft");
        model.addAttribute("center", dir + "checkout");
        return "index";
    }

    @PostMapping("/order")
    public String orderFromCart(
            @RequestParam("odMethod")           String odMethod,
            @RequestParam("name")               String name,
            @RequestParam("addr")               String addr,
            @RequestParam("tel")                String tel,
            @RequestParam("productId")          List<Integer> productIds,
            @RequestParam("odDetailQt")         List<Integer> qts,
            @RequestParam("odDetailTotalPrice") List<Integer> totals,
            Model model,                         // ← 추가
            HttpSession session
    ) throws Exception {
        Cust login = (Cust) session.getAttribute("logincust");
        if (login == null) {
            return "redirect:/login";
        }

        // 1) 헤더 세팅
        Od od = new Od();
        od.setCustId(login.getCustId());
        od.setOdMethod(odMethod);
        od.setOdStatus("결제완료");
        od.setName(name);
        od.setAddr(addr);
        od.setTel(tel);
        od.setOdQt(qts.stream().mapToInt(Integer::intValue).sum());

        // 2) 디테일 세팅
        List<OdDetail> details = new ArrayList<>();
        for (int i = 0; i < productIds.size(); i++) {
            OdDetail d = new OdDetail();
            d.setProductId(productIds.get(i));
            d.setOdDetailQt(qts.get(i));
            d.setOdDetailTotalPrice(totals.get(i));
            details.add(d);
        }
        od.setOdDetails(details);

        // 3) 총액 계산 및 잔액 확인
        int totalAmount = totals.stream().mapToInt(Integer::intValue).sum();
        Cust cust = custService.get(login.getCustId());
        if (cust.getCustMoney() < totalAmount) {
            model.addAttribute("msg", "잔액이 부족합니다.");
            model.addAttribute("totalPrice", totalAmount);
            model.addAttribute("custMoney", cust.getCustMoney());
            // 다시 체크아웃 페이지
            model.addAttribute("left", "nullleft");
            model.addAttribute("center", "cart/checkout");
            model.addAttribute("order", od);
            return "index";
        }

        // 4) 잔액 차감
        cust.setCustMoney(cust.getCustMoney() - totalAmount);
        custService.modify(cust);
        session.setAttribute("logincust", cust);

        // 5) 주문 저장
        odService.register(od);

        // 6) 장바구니 비우기
        cartService.clearCart(login.getCustId());

        // 7) 완료 페이지 렌더링
        model.addAttribute("totalPrice", totalAmount);
        model.addAttribute("left", "nullleft");
        model.addAttribute("center", "cart/complete");
        return "index";
    }


}
