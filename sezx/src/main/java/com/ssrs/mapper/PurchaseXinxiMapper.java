package com.ssrs.mapper;

import com.ssrs.model.PurchaseXinxi;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ssrs.vo.PurchaseVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
public interface PurchaseXinxiMapper extends BaseMapper<PurchaseXinxi> {
    public List<PurchaseXinxi> getAllBean();
    public PurchaseXinxi getBeanById(Long id);
    void insertByReducePoJo(PurchaseXinxi purchaseXinxi);
    void updateByReducePoJo(PurchaseXinxi purchaseXinxi);
    void addGetId(PurchaseXinxi purchaseXinxi);
    List<PurchaseVo> getPurchaseVos(@Param("map") Map<String,Object> type);
    void gotoPay(Long id);
}
