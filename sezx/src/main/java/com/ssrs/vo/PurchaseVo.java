package com.ssrs.vo;

import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Data
public class PurchaseVo implements Serializable {
    /**
     * id
     */
    private Long id;
    /**
     * 购买编号
     */
    private String bianhao;
    /**
     * 购买数量
     */
    private Integer purchaseNum;
    /**
     * 购买总金额
     */
    private Double totalAmount;
    /**
     * 购买人手机
     */
    private String customerPhone;
    /**
     * 顾客id
     */
    private Long customerId;
    /**
     * 顾客类型(0:学员 1:教师)
     */
    private Integer customerType;
    /**
     * 折扣方式
     */
    private Long discountId;
    /**
     * 折扣后价格
     */
    private Double discountAmount;
    /**
     * 顾客姓名
     */
    private String customerName;
    /**
     * 是否付款(0:未付款 1:已付款 2:付款失败)
     */
    private Integer isPayment;
    /**
     * 付款方式(0:现金交易1:支付宝2:微信3:刷卡支付)
     */
    private Integer payType;
    /**
     * 购买时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss",iso = DateTimeFormat.ISO.NONE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date purchaseTime;
    /**
     * 交易号（调支付宝或微信返回）
     */
    private String tradeNumber;
    /**
     * 是否生成合同(0:未生成 1:生成)
     */
    private Integer ismakepact;
    /**
     * 订单号
     */
    private String outTradeNo;
    /**
     * 付款记录id
     */
    private Long payRecordId;

    //以下为PurchaseMingxi表
    /**
     * mingxiid
     */
    private Long mingXiId;
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
//    /**
//     * 购买信息表id
//     */
//    private Long purchaseXinxiId;
}
