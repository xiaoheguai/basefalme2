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
 * @since 2019-03-08
 */
@Data
@TableName("m_ccourse")
public class Ccourse implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 课程名
     */
    private String courseName;
    /**
     * 课程描述
     */
    private String courseDescribe;
    /**
     * 课程地址
     */
    private String courseUrl;
    /**
     * 课程类型
     */
    private Integer courseType;
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
     * 点击量
     */
    private Integer hits;
    /**
     * 上传时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss",iso = DateTimeFormat.ISO.NONE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date uploadTime;



    /**
     * 制作人id
     */
    private Long makerId;

    /**
     * 制作人
     */
    private String makerName;

    @Override
    public String toString() {
        return "Ccourse{" +
        ", id=" + id +
        ", courseName=" + courseName +
        ", courseDescribe=" + courseDescribe +
        ", courseUrl=" + courseUrl +
        ", courseType=" + courseType +
        ", hits=" + hits +
        ", uploadTime=" + uploadTime +
        "}";
    }
}
