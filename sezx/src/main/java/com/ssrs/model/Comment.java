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
@TableName("m_comment")
public class Comment implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 评论
     */
    private String message;
    /**
     * 用户类型(0:学员 1:教师  2:管理员)
     */
    private Integer userType;
    /**
     * 用户id
     */
    private Long userId;
    /**
     * 用户名
     */
    private String userName;
    /**
     * 评论时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss",iso = DateTimeFormat.ISO.NONE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date commentTime;
    /**
     * 父信息
     */
    private Long pId;
    /**
     * 视频id
     */
    private Long worksId;

    /**
     * 视频类型
     */
    private Long worksType;



    @Override
    public String toString() {
        return "Comment{" +
        ", id=" + id +
        ", message=" + message +
        ", userType=" + userType +
        ", userId=" + userId +
        ", userName=" + userName +
        ", commentTime=" + commentTime +
        ", pId=" + pId +
        ", worksId=" + worksId +
        "}";
    }
}
