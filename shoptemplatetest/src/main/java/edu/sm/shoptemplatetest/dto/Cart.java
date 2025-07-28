package edu.sm.shoptemplatetest.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;


@AllArgsConstructor // 모든 필드를 인자로 받는 생성자 생성
@NoArgsConstructor  // 기본 생성자 생성
@Data
@Builder
    // 카멜, 스네이크기법 잘해라잉
public class Cart {
    private String custId;
    private int productId;
    private int productQt;

    private Timestamp cartRegdate;
    private String productName;
    private int productPrice;
    private String productImg;
}
