package com.ssrs.permission.service.impl;

import com.ssrs.mapper.MUserLoginMapper;
import com.ssrs.permission.service.MUserLoginService;
import com.ssrs.vo.MUserVo;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "mUserService")
public class MUserLoginServiceImpl implements MUserLoginService {
    @Autowired
    MUserLoginMapper mUserLoginMapper;


    @Override
    public MUserVo getMUserById(Long id) {
        return mUserLoginMapper.getMUserById(id);
    }

    @Override
    public MUserVo login(String username, String pswd) {
        MUserVo mUserVo = new MUserVo();
        mUserVo.setLoginId(username);
        mUserVo.setLoginPwd(pswd);
        MUserVo mUserVo1 = mUserLoginMapper.selectOne(mUserVo);
        return mUserVo1;
    }

    @Override
    public void updateByPrimaryKeySelective(MUserVo muser) {
        mUserLoginMapper.updateById(muser);

    }

    //@Override
   // public int insertUserAndRole(MUserVo user, String rids) {
      //  return 0;
   // }

//    @Override
//    public int updateById(MUserVo user, String rids) {
//        return 0;
//    }

//    @Override
//    public void initQuellaData() {
//
//    }
}
