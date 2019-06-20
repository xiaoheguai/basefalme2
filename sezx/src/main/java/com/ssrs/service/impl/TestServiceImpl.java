package com.ssrs.service.impl;

import com.ssrs.model.Test;
import com.ssrs.mapper.TestMapper;
import com.ssrs.service.TestService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.vo.TestVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author haha
 * @since 2019-03-10
 */
@Service
public class TestServiceImpl extends ServiceImpl<TestMapper, Test> implements TestService {

    @Override
    public List<Test> getListByWorksId(TestVo vo) {
        return baseMapper.getListByWorksId(vo);
    }

    @Override
    public Long getNextId() {
        return baseMapper.getNextId();
    }

    @Override
    public Long insertAndId(Test test) {
        return baseMapper.insertAndId(test);
    }
}
