package com.ssrs.service;

import com.ssrs.model.Student;
import com.baomidou.mybatisplus.service.IService;
import com.ssrs.vo.MUserVo;

import java.util.List;

/**
 * <p>
 * 用户信息 服务类
 * </p>
 *
 * @author haha
 * @since 2019-02-24
 */
public interface StudentService extends CommonService<Student>{
    boolean updatePWD(MUserVo mUserVo);
    boolean insertByRLogin(MUserVo mUserVo);
    boolean checkNickname(String str,Integer isStudent);
}
