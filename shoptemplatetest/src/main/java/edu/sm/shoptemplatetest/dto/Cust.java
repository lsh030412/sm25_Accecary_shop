package edu.sm.shoptemplatetest.dto;

import lombok.*;

import java.sql.Timestamp;

@AllArgsConstructor // 모든 필드를 인자로 받는 생성자 생성
@NoArgsConstructor  // 기본 생성자 생성
@ToString   // toString()메서드 자동 생성
@Getter
@Setter
@Builder    // 빌더 패턴으로 객체 생성 가능(유연하고 가독성 좋은 생성 방식
public class Cust {
    private String custId;
    private String custPwd;
    private String custName;
    private Timestamp custRegdate;
    private Timestamp custUpdate;
    private String custPnum;
    private String custNick;
    private int custMoney;
}