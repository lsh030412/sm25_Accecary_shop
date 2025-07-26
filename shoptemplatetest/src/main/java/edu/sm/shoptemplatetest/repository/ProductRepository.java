package edu.sm.shoptemplatetest.repository;

import edu.sm.shoptemplatetest.dto.Product;
import edu.sm.shoptemplatetest.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

//exception, 레파지토리역할 상속받은 인서트, 셀렉트 같은걸 마이바티스를 통해서 동작시킬거다
@Repository
@Mapper
public interface ProductRepository extends SmRepository<Product, Integer>{

}
