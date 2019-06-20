package com.ssrs.service;

import com.ssrs.model.Rcourse;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author haha
 * @since 2019-03-08
 */
public interface RcourseService extends IService<Rcourse> {
    List<Rcourse> selectByPage(Integer page , Integer size);
}
