package edu.sm.shoptemplatetest.service;

import edu.sm.shoptemplatetest.dto.Cart;
import edu.sm.shoptemplatetest.frame.SmService;
import edu.sm.shoptemplatetest.repository.CartRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService implements SmService<Cart, Cart> {

    final CartRepository cartRepository;

    @Override
    public void register(Cart cart) throws Exception {
        cartRepository.insert(cart);
    }

    @Override
    public void modify(Cart cart) throws Exception {
        cartRepository.update(cart);
    }

    @Override
    public void remove(Cart cart) throws Exception {
//        프라이머리키: cust_id, product_id가 들감
        cartRepository.delete(cart);
    }

//    관리자일때에는 필요하지만 서비스를 만드는 입장에서 필요  x
    @Override
    public List<Cart> get() throws Exception {
//        조인 걸어야함
        return null;
    }

    @Override
    public Cart get(Cart cart) throws Exception {
        return null;
    }

    public List<Cart> findByCustId(String custId) throws Exception {
        return cartRepository.findByCustId(custId);
    }

    @Transactional
    public void clearCart(String custId) throws Exception {
        cartRepository.deleteByCustId(custId);
    }
}
