package edu.sm.shoptemplatetest.service;

import edu.sm.shoptemplatetest.dto.Od;
import edu.sm.shoptemplatetest.dto.OdDetail;
import edu.sm.shoptemplatetest.repository.OdRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class OdServiceImpl implements OdService {

    private final OdRepository odRepository;

    @Override
    @Transactional
    public void register(Od od) throws Exception {
        // od 테이블에 저장
        odRepository.insert(od);
        // 상세 리스트 저장
        for (OdDetail d : od.getOdDetails()) {
            d.setOdId(od.getOdId());
            odRepository.insertDetail(d);
        }
    }
}