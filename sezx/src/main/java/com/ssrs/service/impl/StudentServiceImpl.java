package com.ssrs.service.impl;

import com.ssrs.model.Student;
import com.ssrs.mapper.StudentMapper;
import com.ssrs.service.StudentService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.vo.MUserVo;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
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
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements StudentService {

    @Override
    public List<Student> getAllBean() {
        return baseMapper.getAllBean();
    }

    @Override
    public Student getBeanById(Long id) {
        return baseMapper.getBeanById(id);
    }

    @Override
    public Boolean insertByReducePoJo(Student student) {
        student.setCreateTime(new Date());
        baseMapper.insertByReducePoJo(student);
        return true;
    }

    @Override
    public Boolean updateByReducePoJo(Student student) {
        student.setCreateTime(new Date());
        baseMapper.updateByReducePoJo(student);
        return true;
    }

    @Override
    public boolean updateByParam(Map<Object,Object> map) {

        baseMapper.updateByParam(map);
        return true;
    }

    @Override
    public boolean updatePWD(MUserVo mUserVo) {
        baseMapper.updatePWD(mUserVo);
        return true;
    }

    @Override
    public boolean insertByRLogin(MUserVo mUserVo) {
        baseMapper.insertByRLogin(mUserVo);
        return true;
    }

    @Override
    public boolean checkNickname(String str,Integer isStudent) {
        Map<String,Object> map = new HashMap<>();
        map.put("type",isStudent);//0:学员 1:教师
        map.put("loginId",str);
        int count = baseMapper.checkNickname(map);
        if(count == 0){
            return  false;
        }
        return true;
    }
}
