package edu.sm.shoptemplatetest.service;

import edu.sm.shoptemplatetest.dto.Cust;
import edu.sm.shoptemplatetest.frame.SmService;
import edu.sm.shoptemplatetest.repository.CustRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
//자동적으로 만들어준다 아래 커스트 레파지토리 객체를
@RequiredArgsConstructor
public class CustService implements SmService<Cust, String> {

    final CustRepository custRepository;

    @Override
    public void register(Cust cust) throws Exception {
        custRepository.insert(cust);
    }

    @Override
    public void modify(Cust cust) throws Exception {
        custRepository.update(cust);
    }

    @Override
    public void remove(String s) throws Exception {
        custRepository.delete(s);
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
