package edu.sm.shoptemplatetest.dto; // 패키지 변경

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Product {
    private Long id;
    private String name;
    private double price;
    private String imageUrl; // 상품 이미지 URL
    private String brand;    // 브랜드명 (예: GUCCI, LOUIS VUITTON, 우주마켓)
    private boolean onSale;
    private double originalPrice;
    private int reviewStars;
}
