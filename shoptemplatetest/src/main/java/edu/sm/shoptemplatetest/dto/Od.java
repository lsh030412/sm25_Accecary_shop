package edu.sm.shoptemplatetest.dto;

import lombok.Data;
import java.util.Date;
import java.util.List;

@Data
public class Od {
    private int odId;                // PK
    private String custId;           // FK
    private Date odDate;             // 주문일자
    private String odMethod;         // 결제수단
    private String odStatus;         // 주문 상태
    private int odQt;                // 총 수량
    private String name;             // 수령인
    private String addr;             // 주소
    private String tel;              // 전화번호

    private List<OdDetail> odDetails; // 상세 리스트
}