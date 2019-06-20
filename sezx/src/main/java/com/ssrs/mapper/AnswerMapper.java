package com.ssrs.mapper;

import com.ssrs.model.Answer;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author haha
 * @since 2019-03-08
 */
public interface AnswerMapper extends BaseMapper<Answer> {
    List<Answer> getAnswerByTestId(Long testId);
    Long getNextId();
    boolean deleteByTestId(Long id);
}
