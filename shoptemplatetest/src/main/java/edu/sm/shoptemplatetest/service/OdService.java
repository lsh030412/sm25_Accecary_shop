package edu.sm.shoptemplatetest.service;

import edu.sm.shoptemplatetest.dto.Od;

import java.util.List;

public interface OdService {
    void register(Od od) throws Exception;
    List<Od> getOrdersByCust(String custId) throws Exception;
}