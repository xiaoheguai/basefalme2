package com.ssrs.service;

import com.ssrs.model.Ccourse;
import com.baomidou.mybatisplus.service.IService;
import com.ssrs.model.Rcourse;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author haha
 * @since 2019-03-08
 */
public interface CcourseService extends IService<Ccourse> {
    List<Ccourse> selectByPage(Integer page , Integer size);
}
