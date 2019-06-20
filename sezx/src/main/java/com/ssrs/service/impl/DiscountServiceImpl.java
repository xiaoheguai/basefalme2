package com.ssrs.service.impl;

import com.ssrs.model.Discount;
import com.ssrs.mapper.DiscountMapper;
import com.ssrs.service.DiscountService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.vo.OpenVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
@Service
public class DiscountServiceImpl extends ServiceImpl<DiscountMapper, Discount> implements DiscountService {

    @Override
    public boolean updateOpenById(OpenVo openVo) {
        baseMapper.updateOpenById(openVo);
        return true;
    }

    @Override
    public List<Discount> selectOpen() {
        return baseMapper.selectOpen();
    }
}
