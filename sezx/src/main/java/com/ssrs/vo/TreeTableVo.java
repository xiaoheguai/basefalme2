package com.ssrs.vo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class TreeTableVo {

    private int tId;
    private int tPid;
    /**
     * id
     */
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
    private Date commentTime;
    /**
     * 父信息
     */
    private Long pId;
    /**
     * 视频id
     */
    private Long worksId;

    public TreeTableVo (){}
    public TreeTableVo (int tId,
                        Long tPid,Long id,String message,Integer userType,Long userId,
                        String userName,Date commentTime,Long pId,Long worksId){
        this.tId = tId;
        if(tPid==null){
            this.tPid = 0;
        }else {
            this.tPid = Integer.valueOf(tPid.toString());
        }
        this.id = id;
        this.message = message;
        this.userType = userType;
        this.userId = userId;
        this.userName = userName;
        this.commentTime = commentTime;
        this.pId = pId;
        this.worksId = worksId;

    }

}
