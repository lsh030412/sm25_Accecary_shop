package edu.sm.shoptemplatetest.mapper;

import edu.sm.shoptemplatetest.dto.Product; // 패키지 변경
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface ProductMapper {
    List<Product> getAllProducts();
}