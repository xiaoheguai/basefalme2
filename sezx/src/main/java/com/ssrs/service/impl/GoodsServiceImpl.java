package com.ssrs.service.impl;

import com.ssrs.model.Goods;
import com.ssrs.mapper.GoodsMapper;
import com.ssrs.service.GoodsService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
@Service
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements GoodsService {

    @Override
    public void insertGetId(Goods goods) {
         baseMapper.insertGetId(goods);
    }
}
