package com.ssrs.mapper;

import com.ssrs.model.Discount;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ssrs.vo.OpenVo;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
public interface DiscountMapper extends BaseMapper<Discount> {
    void updateOpenById(OpenVo openVo);
    List<Discount> selectOpen();
}
