package com.ssrs.service.impl;

import com.ssrs.model.Answer;
import com.ssrs.mapper.AnswerMapper;
import com.ssrs.service.AnswerService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author haha
 * @since 2019-03-08
 */
@Service
public class AnswerServiceImpl extends ServiceImpl<AnswerMapper, Answer> implements AnswerService {

    @Override
    public List<Answer> getAnswerByTestId(Long testId) {
        return baseMapper.getAnswerByTestId(testId);
    }

    @Override
    public Long getNextId() {
        return baseMapper.getNextId();
    }

    @Override
    public boolean deleteByTestId(Long id) {
        return baseMapper.deleteByTestId(id);
    }
}
