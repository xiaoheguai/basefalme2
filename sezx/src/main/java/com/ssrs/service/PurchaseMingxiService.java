package com.ssrs.service;

import com.ssrs.model.PurchaseMingxi;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
public interface PurchaseMingxiService extends IService<PurchaseMingxi> {
            List<PurchaseMingxi> getBeansByPXId(Long pxid);
}
