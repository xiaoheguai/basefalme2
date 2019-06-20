package com.ssrs.service;

import com.ssrs.model.PurchaseXinxi;
import com.baomidou.mybatisplus.service.IService;
import com.ssrs.vo.PurchaseVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
public interface PurchaseXinxiService extends CommonService<PurchaseXinxi> {
    void addGetId(PurchaseXinxi purchaseXinxi);
    List<PurchaseVo> getPurchaseVos(Integer type,Long userId,Integer userType);
    boolean gotoPay(Long id);
}
