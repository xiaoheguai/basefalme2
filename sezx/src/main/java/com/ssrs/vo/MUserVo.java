package com.ssrs.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

@Data
public class MUserVo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
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
     * 个性签名
     */
    private String sign;
    /**
     * 前台用户是否为学员(true 学员 false 教师)
     */
    private int isStudent;
    /**
     * 最后登陆时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss",iso = DateTimeFormat.ISO.NONE)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    private Date lastLoginTime;

}
