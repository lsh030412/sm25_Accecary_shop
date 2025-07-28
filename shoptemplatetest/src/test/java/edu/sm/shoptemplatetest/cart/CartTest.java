package edu.sm.shoptemplatetest.cart;

import edu.sm.shoptemplatetest.dto.Cart;
import edu.sm.shoptemplatetest.service.CartService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
@Slf4j
class CartTest {

	@Autowired
	CartService cartService;

// 테스트할때 웹애플리케이션은 죽여놔라
	@Test
	void insert() {
		Cart cart = Cart.builder().custId("id01").productId(1001).productQt(4).build();
		try {
			cartService.register(cart);
			log.info("Insert End ------------------------------------------");
		} catch (Exception e) {
			log.info("Error Insert Test ...");
			e.printStackTrace();
		}
	}

//	@Test
//	void update() {
//		Cust cust = Cust.builder().custId("id65").custName("이태준").custPwd("5555").build();
//		try {
//			custService.modify(cust);
//			log.info("Update End ------------------------------------------");
//		} catch (Exception e) {
//			log.info("Error Test ...");
//			e.printStackTrace();
//		}
//	}
//
//	@Test
//	void delete() {
//		try {
//			custService.remove("id65");
//			log.info("Delete End ------------------------------------------");
//		} catch (Exception e) {
//			log.info("Error Test ...");
//			e.printStackTrace();
//		}
//	}

}