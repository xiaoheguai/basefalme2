package com.ssrs.mapper;

import com.ssrs.model.Test;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ssrs.vo.TestVo;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author haha
 * @since 2019-03-10
 */
public interface TestMapper extends BaseMapper<Test> {
    List<Test> getListByWorksId(TestVo vo);
    Long getNextId();
    Long insertAndId(Test test);
}
