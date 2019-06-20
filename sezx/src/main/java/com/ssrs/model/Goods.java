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
@TableName("m_goods")
public class Goods implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 商品名称
     */
    private String goodsName;
    /**
     * 商品类别(多个用|隔开)
     */
    private String goodsType;
    /**
     * 商品描述
     */
    private String goodsDescribe;
    /**
     * 商品单价
     */
    private Double goodsUnitPrice;
    /**
    * 所属者id
    */
    private Long userId;
    /**
     * 所属者名称
     */
    private String userName;

    @Override
    public String toString() {
        return "Goods{" +
        ", id=" + id +
        ", goodsName=" + goodsName +
        ", goodsType=" + goodsType +
        ", goodsDescribe=" + goodsDescribe +
        ", goodsUnitPrice=" + goodsUnitPrice +
        "}";
    }
}
