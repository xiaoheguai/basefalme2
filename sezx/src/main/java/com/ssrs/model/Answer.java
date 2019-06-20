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
 * @since 2019-03-08
 */
@Data
@TableName("m_answer")
public class Answer implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 答案
     */
    private String answer;
    /**
     * 答案号
     */
    private Integer answerNo;
    /**
     * 题目号
     */
    private Long testId;
    /**
     * 是否正确(0:错误 1:正确）
     */
    private Integer isTrue;



    @Override
    public String toString() {
        return "Answer{" +
        ", id=" + id +
        ", answer=" + answer +
        ", answerNo=" + answerNo +
        ", testId=" + testId +
        ", isTrue=" + isTrue +
        "}";
    }
}
