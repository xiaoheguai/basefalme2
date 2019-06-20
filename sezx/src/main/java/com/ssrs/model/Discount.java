package com.ssrs.model;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

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
@TableName("m_discount")
public class Discount implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 折扣名称
     */
    private String discountName;
    /**
     * 折扣公式(P为当前价格占位）
     */
    private String discountExpression;
    /**
     * 商品类别
     */
    private Long goodsTypeId;
    /**
     * 折扣开始时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss",iso = DateTimeFormat.ISO.NONE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date beginTime;
    /**
     * 结束时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss",iso = DateTimeFormat.ISO.NONE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date endTime;
    /**
     * 是否启用(0:不启用 1:启用)
     */
    private Integer isOpen;



    @Override
    public String toString() {
        return "Discount{" +
        ", id=" + id +
        ", discountName=" + discountName +
        ", discountExpression=" + discountExpression +
        ", goodsTypeId=" + goodsTypeId +
        ", beginTime=" + beginTime +
        ", endTime=" + endTime +
        ", isOpen=" + isOpen +
        "}";
    }
}
