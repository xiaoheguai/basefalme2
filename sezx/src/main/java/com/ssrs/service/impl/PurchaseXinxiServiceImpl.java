package com.ssrs.service.impl;

import com.ssrs.model.PurchaseXinxi;
import com.ssrs.mapper.PurchaseXinxiMapper;
import com.ssrs.service.PurchaseXinxiService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.vo.PurchaseVo;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
@Service
public class PurchaseXinxiServiceImpl extends ServiceImpl<PurchaseXinxiMapper, PurchaseXinxi> implements PurchaseXinxiService {
    @Override
    public List<PurchaseXinxi> getAllBean() {
        return baseMapper.getAllBean();
    }

    @Override
    public PurchaseXinxi getBeanById(Long id) {
        return baseMapper.getBeanById(id);
    }

    @Override
    public Boolean insertByReducePoJo(PurchaseXinxi purchaseXinxi) {
        baseMapper.insertByReducePoJo(purchaseXinxi);
        return true;
    }

    @Override
    public Boolean updateByReducePoJo(PurchaseXinxi purchaseXinxi) {
        baseMapper.updateByReducePoJo(purchaseXinxi);
        return true;
    }

    @Override
    public boolean updateByParam(Map<Object, Object> map) {
        return false;
    }

    @Override
    public void addGetId(PurchaseXinxi purchaseXinxi) {
        baseMapper.addGetId(purchaseXinxi);
    }

    @Override
    public List<PurchaseVo> getPurchaseVos(Integer type,Long userId,Integer userType) {
        Map<String,Object> map = new HashMap<>();
        map.put("type",type);
        map.put("userId",userId);
        map.put("userType",userType);
        return baseMapper.getPurchaseVos(map);
    }

    @Override
    public boolean gotoPay(Long id) {
        baseMapper.gotoPay(id);
        return true;
    }
}
