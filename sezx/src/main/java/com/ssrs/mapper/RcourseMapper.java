package com.ssrs.mapper;

import com.ssrs.model.Rcourse;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author haha
 * @since 2019-03-08
 */
public interface RcourseMapper extends BaseMapper<Rcourse> {
    List<Rcourse> selectByPage(@Param(value = "page") Map<String,Integer> map);
}
