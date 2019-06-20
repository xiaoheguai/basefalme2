package com.ssrs.mapper;

import com.ssrs.vo.MUserVo;

public interface MUserLoginMapper {
    MUserVo getMUserById(Long id);
    MUserVo selectOne(MUserVo vo);
    void updateById(MUserVo vo);
}
