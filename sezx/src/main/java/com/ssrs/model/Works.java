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
@TableName("m_works")
public class Works implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 作品名称
     */
    private String worksName;
    /**
     * 作品类型
     */
    private Long worksTypeId;
    /**
     * 作品描述
     */
    private String worksDescribe;
    /**
     * 作品存放地址
     */
    private String worksUrl;
    /**
     * 是否愿意上架(0:不愿意 1:愿意)
     */
    private Integer wanToGoods;
    /**
     * 是否上架(0:未上架 1:已上架 
     */
    private Integer isGoods;
    /**
     * 商品id
     */
    private Long goodsId;
    /**
     * 商品类型(1:必修课程 2:试听课程 3:私人作品(学生) 4:私人作品(教师))
     */
    private Integer goodsType;
    /**
     * 商品价格
     */
    private Double goodsPrice;
    /**
     * 上传日期
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss",iso = DateTimeFormat.ISO.NONE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date uploadTime;
    /**
     * 点击量
     */
    private Integer hits;
    /**
     * 用户id
     */
    private Long userId;
    /**
     * 用户名称
     */
    private String userName;
    /**
     * 用户类型(0:学员1:教师)
     */
    private Integer userType;



    @Override
    public String toString() {
        return "Works{" +
        ", id=" + id +
        ", worksName=" + worksName +
        ", worksTypeId=" + worksTypeId +
        ", worksDescribe=" + worksDescribe +
        ", worksUrl=" + worksUrl +
        ", wanToGoods=" + wanToGoods +
        ", isGoods=" + isGoods +
        ", goodsId=" + goodsId +
        ", uploadTime=" + uploadTime +
        ", hits=" + hits +
        ", userId=" + userId +
        ", userName=" + userName +
        "}";
    }
}
