package com.ssrs.mapper;

import com.ssrs.model.Student;
import com.ssrs.model.Teacher;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户信息 Mapper 接口
 * </p>
 *
 * @author haha
 * @since 2019-02-24
 */
public interface TeacherMapper extends BaseMapper<Teacher> {
    public List<Teacher> getAllBean();
    public Teacher getBeanById(Long id);
    void insertByReducePoJo(Teacher teacher);
    void updateByReducePoJo(Teacher teacher);
    void updateByParam(@Param(value = "param") Map<Object,Object> map);
}
