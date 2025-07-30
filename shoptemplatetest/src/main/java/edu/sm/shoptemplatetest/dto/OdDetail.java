package edu.sm.shoptemplatetest.dto;

import lombok.Data;

@Data
public class OdDetail {
    private int odDetailId;          // PK
    private int odId;                // FK
    private int productId;           // 상품 ID
    private int odDetailQt;          // 수량
    private int odDetailTotalPrice;  // 총가격
}