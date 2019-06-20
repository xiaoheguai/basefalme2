package com.ssrs.model;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
@Data
@TableName("m_purchase_mingxi")
public class PurchaseMingxi implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 商品id
     */
    private Long goodsId;
    /**
     * 商品名
     */
    private String goodsName;
    /**
     * 商品单价
     */
    private Double goodsUnitPrice;
    /**
     * 商品数量
     */
    private Integer goodsAmount;
    /**
     * 商品总价
     */
    private Double goodsTotalPrice;
    /**
     * 购买信息表id
     */
    private Long purchaseXinxiId;




    @Override
    public String toString() {
        return "PurchaseMingxi{" +
        ", id=" + id +
        ", goodsId=" + goodsId +
        ", goodsName=" + goodsName +
        ", goodsUnitPrice=" + goodsUnitPrice +
        ", goodsAmount=" + goodsAmount +
        ", goodsTotalPrice=" + goodsTotalPrice +
        ", purchaseXinxiId=" + purchaseXinxiId +
        "}";
    }
}
