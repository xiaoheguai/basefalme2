package com.ssrs.mapper;

import com.ssrs.model.Goods;
import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
public interface GoodsMapper extends BaseMapper<Goods> {
        void insertGetId(Goods goods);
}
