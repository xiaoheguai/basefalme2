package com.ssrs.service;

import com.ssrs.model.Goods;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
public interface GoodsService extends IService<Goods> {
    void insertGetId(Goods goods);
}
