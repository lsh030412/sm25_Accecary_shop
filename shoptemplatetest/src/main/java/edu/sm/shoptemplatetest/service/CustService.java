package edu.sm.shoptemplatetest.service;

import edu.sm.shoptemplatetest.dto.Cust;
import edu.sm.shoptemplatetest.frame.SmService;
import edu.sm.shoptemplatetest.repository.CustRepository;
import edu.sm.shoptemplatetest.repository.OdRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
@RequiredArgsConstructor
public class CustService implements SmService<Cust, String> {

    final CustRepository custRepository;
    final OdRepository odRepository;


    @Override
    public void register(Cust cust) throws Exception {
        custRepository.insert(cust);
    }

    @Override
    public void modify(Cust cust) throws Exception {
        custRepository.update(cust);
    }

    @Override
    public void remove(String custId) throws Exception {
        odRepository.deleteDetailByCustId(custId); // 1단계: orderdetail 삭제
        odRepository.deleteByCustId(custId);       // 2단계: orders 삭제
        custRepository.delete(custId);             // 3단계: 고객 삭제
    }

    @Override
    public List<Cust> get() throws Exception {
        return custRepository.selectAll();
    }

    @Override
    public Cust get(String s) throws Exception {
        return custRepository.select(s);
    }
}
