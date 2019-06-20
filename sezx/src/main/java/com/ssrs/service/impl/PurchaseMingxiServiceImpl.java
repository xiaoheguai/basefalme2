package com.ssrs.service.impl;

import com.ssrs.model.PurchaseMingxi;
import com.ssrs.mapper.PurchaseMingxiMapper;
import com.ssrs.service.PurchaseMingxiService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
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
public class PurchaseMingxiServiceImpl extends ServiceImpl<PurchaseMingxiMapper, PurchaseMingxi> implements PurchaseMingxiService {

    @Override
    public List<PurchaseMingxi> getBeansByPXId(Long pxid) {
        return baseMapper.getBeansByPXId(pxid);
    }
}
