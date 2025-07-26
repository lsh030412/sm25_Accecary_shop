package edu.sm.shoptemplatetest.frame;

import org.springframework.transaction.annotation.Transactional;

import java.util.List;
public interface SmService <V, K> {
    @Transactional
    void register(V v) throws Exception;
    @Transactional
    void modify(V v)  throws Exception;
    @Transactional
    void remove(K k)  throws Exception;

    // 모든 데이터 조회
    List<V> get() throws Exception;
    // 단일 데이터 조회
    V get(K k)  throws Exception;
}

