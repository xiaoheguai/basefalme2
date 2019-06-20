package com.ssrs.mapper;

import com.ssrs.model.Student;
import com.ssrs.model.StudentTeacher;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ssrs.model.Teacher;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author haha
 * @since 2019-02-24
 */
public interface StudentTeacherMapper extends BaseMapper<StudentTeacher> {
        public List<Teacher> getTeachersByStudentId(int id);
        public List<Student> getStudentsByTeacherId(int id);
}
