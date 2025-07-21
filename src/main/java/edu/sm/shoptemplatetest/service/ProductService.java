package edu.sm.shoptemplatetest.service;

import edu.sm.shoptemplatetest.dto.Product; // 패키지 변경
import edu.sm.shoptemplatetest.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    private ProductMapper productMapper;

    public List<Product> getAllProducts() {
        return productMapper.getAllProducts();
    }
}