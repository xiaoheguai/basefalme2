package com.ssrs.service;

import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Map;

public interface CommonService<T> extends IService<T> {
    List<T> getAllBean();
    T getBeanById(Long id);
    Boolean insertByReducePoJo(T t);
    Boolean updateByReducePoJo(T t);
    boolean updateByParam(Map<Object,Object> map);
}
