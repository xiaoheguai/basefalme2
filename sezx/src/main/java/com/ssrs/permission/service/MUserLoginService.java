package com.ssrs.permission.service;

import com.ssrs.vo.MUserVo;

public interface MUserLoginService {
    MUserVo getMUserById(Long id);

    MUserVo login(String username, String pswd);

    void updateByPrimaryKeySelective(MUserVo muser);

   // int insertUserAndRole(MUserVo user, String rids);

  //  int updateById(MUserVo muser, String rids);

    //void initQuellaData();
}
