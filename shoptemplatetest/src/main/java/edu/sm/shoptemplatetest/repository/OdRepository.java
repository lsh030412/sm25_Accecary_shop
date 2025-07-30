package edu.sm.shoptemplatetest.repository;

import edu.sm.shoptemplatetest.dto.Od;
import edu.sm.shoptemplatetest.dto.OdDetail;
import edu.sm.shoptemplatetest.frame.SmRepository;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface OdRepository extends SmRepository<Od, Integer> {
    void insertDetail(OdDetail detail) throws Exception;
    List<OdDetail> selectDetail(int odId) throws Exception;
}