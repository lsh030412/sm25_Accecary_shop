package edu.sm.shoptemplatetest;

import edu.sm.shoptemplatetest.dto.Cust;
import edu.sm.shoptemplatetest.dto.Product;
import edu.sm.shoptemplatetest.service.CustService;
import edu.sm.shoptemplatetest.service.ProductService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
@Slf4j
class ProductTest {

    @Autowired
    ProductService productService;

    @Test
    void getall() {
        List<Product> list = null;
        try {
            list = productService.get();
            list.forEach(product -> log.info(product.toString()));
            log.info("Select All End ------------------------------------------");

        } catch (Exception e) {
            log.info("Error Test ...");
            e.printStackTrace();
        }
    }


//    @Test
//    void insert() {
//        Product cust = Product.builder().productName("반바지").productPrice(10000).productImg("pp.jpg").discountRate(0.3).cateId(10).build();
//        try {
//            productService.register(cust);
//            log.info("Insert End ------------------------------------------");
//        } catch (Exception e) {
//            log.info("Error Insert Test ...");
//            e.printStackTrace();
//        }
//    }

//    @Test
//    void get() {
//        Product product = null;
//        try {
//            product = productService.get(1007);
//            log.info(product.toString());
//            log.info("Select End ------------------------------------------");
//
//        } catch (Exception e) {
//            log.info("Error Test ...");
//            e.printStackTrace();
//        }
//    }
//    @Test
//    void update() {
//        Product product = Product.builder().productId(1007).productName("반바지2").productPrice(20000).productImg("pp.jpg").discountRate(0.3).cateId(10).build();
//        try {
//            productService.modify(product);
//            log.info("Update End ------------------------------------------");
//        } catch (Exception e) {
//            log.info("Error Test ...");
//            e.printStackTrace();
//        }
//    }
//    @Test
//    void get2() {
//        Product product = null;
//        try {
//            product = productService.get(1007);
//            log.info(product.toString());
//            log.info("Select End ------------------------------------------");
//
//        } catch (Exception e) {
//            log.info("Error Test ...");
//            e.printStackTrace();
//        }
//    }
//    @Test
//    void delete() {
//        try {
//            productService.remove(1012);
//            log.info("Delete End ------------------------------------------");
//        } catch (Exception e) {
//            log.info("Error Test ...");
//            e.printStackTrace();
//        }
//    }

}