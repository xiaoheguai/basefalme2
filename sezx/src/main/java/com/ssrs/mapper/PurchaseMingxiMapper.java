package com.ssrs.mapper;

import com.ssrs.model.PurchaseMingxi;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
public interface PurchaseMingxiMapper extends BaseMapper<PurchaseMingxi> {
    List<PurchaseMingxi> getBeansByPXId(Long pxid);
}
