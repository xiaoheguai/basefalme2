package com.ssrs.service;

import com.ssrs.model.Answer;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author haha
 * @since 2019-03-08
 */
public interface AnswerService extends IService<Answer> {
        List<Answer> getAnswerByTestId(Long testId);
        Long getNextId();
        boolean deleteByTestId(Long id);
}
