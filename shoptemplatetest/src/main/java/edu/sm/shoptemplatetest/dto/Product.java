package edu.sm.shoptemplatetest.dto;
import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Product {
    private int productId;
    private int cateId;
    private String productName;
    private int productPrice;
    private double discountRate;
    private String productImg;
    private Timestamp productRegdate;
    private Timestamp productUpdate;
    private String cateName;
    private String productExp;
    private MultipartFile productImgFile;
}