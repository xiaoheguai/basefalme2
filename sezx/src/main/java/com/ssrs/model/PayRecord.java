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
@TableName("m_pay_record")
public class PayRecord implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 支付时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss",iso = DateTimeFormat.ISO.NONE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date paymentTime;
    /**
     * 支付金额
     */
    private Double paymentMoney;
    /**
     * 购买信息表的id
     */
    private Long purchaseXinxiId;
    /**
     * 商户订单号
     */
    private String outtradeno;
    /**
     * 支付方式
     */
    private Integer payType;
    /**
     * 商品详情
     */
    private String goodsDetail;
    /**
     * 支付宝或者微信返回的交易号
     */
    private String tradeNumber;
    /**
     * 备注
     */
    private String content;




    @Override
    public String toString() {
        return "PayRecord{" +
        ", id=" + id +
        ", paymentTime=" + paymentTime +
        ", paymentMoney=" + paymentMoney +
        ", purchaseXinxiId=" + purchaseXinxiId +
        ", outtradeno=" + outtradeno +
        ", payType=" + payType +
        ", goodsDetail=" + goodsDetail +
        ", tradeNumber=" + tradeNumber +
        ", content=" + content +
        "}";
    }
}
