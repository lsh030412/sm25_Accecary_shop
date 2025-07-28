package edu.sm.shoptemplatetest.cart;

import edu.sm.shoptemplatetest.dto.Cart;
import edu.sm.shoptemplatetest.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
class CartDeleteTest {

	@Autowired
	CartService cartService;

	@Test
	void deleteCartByCustId() throws Exception {
		String custId = "1234";

		try {
			// 1. 해당 고객의 장바구니 목록 불러오기
			List<Cart> cartList = cartService.findByCustId(custId);

			// 2. 해당 고객의 장바구니가 존재할 경우 삭제
			for (Cart cart : cartList) {
				cartService.remove(cart);  // Cart에는 custId, productId가 들어있음
				log.info("Deleted: {}", cart.toString());
			}

			log.info("Delete End ------------------------------------------");

		} catch (Exception e) {
			log.error("Error while deleting cart items for custId: {}", custId);
			e.printStackTrace();
		}
	}
}

