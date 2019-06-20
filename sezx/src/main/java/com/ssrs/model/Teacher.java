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
import java.util.List;

/**
 * <p>
 * 用户信息
 * </p>
 *
 * @author haha
 * @since 2019-02-24
 */
@Data
@TableName("m_teacher")
public class Teacher implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 登录账号
     */
    private String loginId;
    /**
     * 密码
     */
    private String loginPwd;
    /**
     * 头像
     */
    private String touxiang;
    /**
     * 昵称
     */
    private String nickname;
    /**
     * 个性签名
     */
    private String sign;
    /**
     * 联系手机
     */
    private String mobile;
    /**
     * 注册时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date createTime;
    /**
     * 验证码
     */
    private String verifyCode;
    /**
     * 验证码发送时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss",iso = DateTimeFormat.ISO.NONE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date verifyCodeTime;
    /**
     * 是否通过审核(0:未通过 1:通过)
     */
    private Integer ischeck;
    /**
     * 状态(0:未注册,1:注册)
     */
    private Integer status;

    /**
     * 学生列表
     */
    private List<Student> students;


    @Override
    public String toString() {
        return "Teacher{" +
        ", id=" + id +
        ", loginId=" + loginId +
        ", loginPwd=" + loginPwd +
        ", touxiang=" + touxiang +
        ", nickname=" + nickname +
        ", mobile=" + mobile +
        ", createTime=" + createTime +
        ", verifyCode=" + verifyCode +
        ", verifyCodeTime=" + verifyCodeTime +
        ", ischeck=" + ischeck +
        ", status=" + status +
        "}";
    }
}
