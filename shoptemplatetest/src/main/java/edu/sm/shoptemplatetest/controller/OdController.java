package edu.sm.shoptemplatetest.controller;

import edu.sm.shoptemplatetest.dto.*;
import edu.sm.shoptemplatetest.service.OdService;
import edu.sm.shoptemplatetest.service.CustService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/od")
public class OdController {

    private final OdService odService;
    private final CustService custService;

    // 1) /od/checkout : see.jsp 폼에서 넘어온 주문 요청 처리
    @PostMapping("/checkout")
    public String checkout(@RequestParam("productId") int productId,
                           @RequestParam("productName") String productName,
                           @RequestParam("productPrice") int productPrice,
                           @RequestParam("productQt") int productQt,
                           HttpSession session,
                           Model model) throws Exception {
        Cust loginCust = (Cust) session.getAttribute("logincust");
        if (loginCust == null) return "redirect:/login";

        int totalPrice = productPrice * productQt;
        Cust cust = custService.get(loginCust.getCustId());
        if (cust.getCustMoney() < totalPrice) {
            model.addAttribute("msg", "잔액이 부족합니다.");
            model.addAttribute("left", "nullleft");
            model.addAttribute("center", "od/checkout");
            // 주문서 뷰 재표시용 정보
            OdDetail detail = new OdDetail();
            detail.setProductId(productId);
            detail.setOdDetailQt(productQt);
            detail.setOdDetailTotalPrice(totalPrice);
            Od odErr = new Od();
            odErr.setOdDetails(Collections.singletonList(detail));
            model.addAttribute("order", odErr);
            model.addAttribute("productName", productName);
            model.addAttribute("totalPrice", totalPrice);
            model.addAttribute("custMoney", cust.getCustMoney());
            return "index";
        }

        OdDetail detail = new OdDetail();
        detail.setProductId(productId);
        detail.setOdDetailQt(productQt);
        detail.setOdDetailTotalPrice(totalPrice);
        List<OdDetail> details = Collections.singletonList(detail);
        Od od = new Od();
        od.setCustId(cust.getCustId());
        od.setOdQt(productQt);
        od.setOdDetails(details);

        model.addAttribute("order", od);
        model.addAttribute("productName", productName);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("custMoney", cust.getCustMoney());
        model.addAttribute("left", "nullleft");
        model.addAttribute("center", "od/checkout");
        return "index";
    }

    // 2) /od/place : 최종 결제 처리
    @PostMapping("/place")
    public String place(@ModelAttribute Od order,
                        HttpSession session,
                        Model model) throws Exception {
        Cust loginCust = (Cust) session.getAttribute("logincust");
        if (loginCust == null) return "redirect:/login";
        Cust cust = custService.get(loginCust.getCustId());

        int total = order.getOdDetails().stream()
                .mapToInt(d -> d.getOdDetailTotalPrice())
                .sum();
        if (cust.getCustMoney() < total) {
            model.addAttribute("msg", "주문 도중 잔액이 부족합니다.");
            model.addAttribute("left", "nullleft");
            model.addAttribute("center", "od/checkout");
            model.addAttribute("order", order);
            return "index";
        }

        // 잔액 차감
        cust.setCustMoney(cust.getCustMoney() - total);
        custService.modify(cust);
        session.setAttribute("logincust", cust);

        // 주문 저장
        // 주문 저장 준비: 로그인 고객 아이디 설정
        order.setCustId(loginCust.getCustId());
        // 주문 상태 설정
        order.setOdStatus("결제완료");
        odService.register(order);

        model.addAttribute("totalPrice", total);
        model.addAttribute("left", "nullleft");
        model.addAttribute("center", "od/complete");
        return "index";
    }

    // 3) 직접 /od/complete GET 요청 차단
    @GetMapping("/complete")
    public String complete() {
        return "redirect:/";
    }


}