package com.ssrs.mapper;

import com.ssrs.model.Student;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ssrs.vo.MUserVo;
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
public interface StudentMapper extends BaseMapper<Student> {
    public List<Student> getAllBean();
    public Student getBeanById(Long id);
    void insertByReducePoJo(Student student);
    void updateByReducePoJo(Student student);
    void updateByParam(@Param(value = "param") Map<Object,Object> map);
    void updatePWD(MUserVo mUserVo);
    void insertByRLogin(MUserVo mUserVo);
    Integer checkNickname(@Param(value = "map") Map<String,Object> map);
}
