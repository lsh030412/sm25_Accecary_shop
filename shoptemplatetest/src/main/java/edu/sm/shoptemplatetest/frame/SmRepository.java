package edu.sm.shoptemplatetest.frame;

import java.util.List;

public interface SmRepository <V, K> {
    // INSERT(CREATE), SELECT(READ), UPDATE(U), DELETE(D)
    void insert(V v) throws Exception;
    void update(V v) throws Exception;
    void delete(K k) throws Exception;
    List<V> selectAll() throws Exception;
    V select(K k) throws Exception;
}
