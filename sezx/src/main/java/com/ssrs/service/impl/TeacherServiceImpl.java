package com.ssrs.service.impl;

import com.ssrs.model.Teacher;
import com.ssrs.mapper.TeacherMapper;
import com.ssrs.service.TeacherService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户信息 服务实现类
 * </p>
 *
 * @author haha
 * @since 2019-02-24
 */
@Service
public class TeacherServiceImpl extends ServiceImpl<TeacherMapper, Teacher> implements TeacherService {

    @Override
    public List<Teacher> getAllBean() {
        return baseMapper.getAllBean();
    }

    @Override
    public Teacher getBeanById(Long id) {
        return baseMapper.getBeanById(id);
    }

    @Override
    public Boolean insertByReducePoJo(Teacher teacher) {
        teacher.setCreateTime(new Date());
        baseMapper.insertByReducePoJo(teacher);
        return true;
    }

    @Override
    public Boolean updateByReducePoJo(Teacher teacher) {
        teacher.setCreateTime(new Date());
        baseMapper.updateByReducePoJo(teacher);
        return true;
    }

    @Override
    public boolean updateByParam(Map<Object, Object> map) {
        baseMapper.updateByParam(map);
        return true;
    }
}
