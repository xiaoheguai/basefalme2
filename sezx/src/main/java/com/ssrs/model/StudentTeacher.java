package com.ssrs.model;

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
 * @since 2019-02-24
 */
@Data
@TableName("student_teacher")
public class StudentTeacher implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 学员id
     */
    private Integer studentId;
    /**
     * 教师id
     */
    private Integer teacherId;



    @Override
    public String toString() {
        return "StudentTeacher{" +
        ", studentId=" + studentId +
        ", teacherId=" + teacherId +
        "}";
    }
}
