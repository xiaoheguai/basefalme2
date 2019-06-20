package com.ssrs.service;

import com.ssrs.model.Test;
import com.baomidou.mybatisplus.service.IService;
import com.ssrs.vo.TestVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author haha
 * @since 2019-03-10
 */
public interface TestService extends IService<Test> {
    List<Test> getListByWorksId(TestVo vo);
    Long getNextId();
    Long insertAndId(Test test);
}
