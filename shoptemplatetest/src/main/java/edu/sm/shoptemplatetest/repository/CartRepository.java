package edu.sm.shoptemplatetest.repository;


import edu.sm.shoptemplatetest.dto.Cart;
import edu.sm.shoptemplatetest.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

//스프링부트에서 연동하기 위해 레파지토리, 매퍼랑 연동하기 위해 maper
@Repository
@Mapper
//커스트아이디와 카트아이디를 둘 다 넣어줄수 있다
// 밸류에는 카트에 모든 정보를 가져오겠다
// 두개를 카트에 넣어서 그걸 키값으로 사용하면 된다.
// 마이바티스 프레임웤에 들어갈때 인터페이스가 얘다
// insert, select, update ... 가 숨어있는거다
public interface CartRepository extends SmRepository<Cart, Cart> {
//    필요시에 추가하는거다
//    파인드로 sql이 동작하는거다
//    해당 아이디가 입력한 카트정보를 조회한다 crud랑 별개의 동작이다
    List<Cart> findByCustId(String custId) throws Exception;
    void deleteByCustId(String custId) throws Exception;
}
