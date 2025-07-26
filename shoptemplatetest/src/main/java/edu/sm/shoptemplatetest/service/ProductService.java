package edu.sm.shoptemplatetest.service;

import edu.sm.shoptemplatetest.dto.Product;
import edu.sm.shoptemplatetest.frame.SmService;
import edu.sm.shoptemplatetest.repository.ProductRepository;
import edu.sm.shoptemplatetest.util.FileUploadUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService implements SmService<Product, Integer> {

    final ProductRepository  productRepository;

    @Value("${app.dir.uploadimgsdir}")
    String imgDir;


    @Override
    public void register(Product product) throws Exception {
//        파일에 이름이 들어간다 파일을 시스템에 저장? 유틀리티파일 로 가라
//        smservice에 트렌젝션 처리 해놔서 오류나면 롤백된다
        if(product.getProductImgFile() != null) {
            product.setProductImg(product.getProductImgFile().getOriginalFilename());
            FileUploadUtil.saveFile(product.getProductImgFile(), imgDir);
        }
        productRepository.insert(product);
    }

    @Override
    public void modify(Product product) throws Exception {
//        비어있으면 기존이미지를 사용해라
        if(product.getProductImgFile().isEmpty()) {
            productRepository.update(product);
        }else {
            FileUploadUtil.deleteFile(product.getProductImg(), imgDir);
            FileUploadUtil.saveFile(product.getProductImgFile(), imgDir);
            product.setProductImg(product.getProductImgFile().getOriginalFilename());
            productRepository.update(product);
        }
    }

    @Override
    public void remove(Integer s) throws Exception {
        productRepository.delete(s);
    }

    @Override
    public List<Product> get() throws Exception {
        return productRepository.selectAll();
    }

    @Override
    public Product get(Integer s) throws Exception {
        return productRepository.select(s);
    }
}