package com.ssrs.service;

import com.ssrs.model.Discount;
import com.baomidou.mybatisplus.service.IService;
import com.ssrs.vo.OpenVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
public interface DiscountService extends IService<Discount> {
        boolean updateOpenById(OpenVo openVo);
        List<Discount> selectOpen();
}
