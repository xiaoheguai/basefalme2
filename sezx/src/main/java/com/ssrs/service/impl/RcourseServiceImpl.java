package com.ssrs.service.impl;

import com.ssrs.model.Rcourse;
import com.ssrs.mapper.RcourseMapper;
import com.ssrs.service.RcourseService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author haha
 * @since 2019-03-08
 */
@Service
public class RcourseServiceImpl extends ServiceImpl<RcourseMapper, Rcourse> implements RcourseService {

    @Override
    public List<Rcourse> selectByPage(Integer page, Integer size) {
        Integer begin = (page-1)*size;
        Map<String,Integer> map = new HashMap<>();
        map.put("begin",begin);
        map.put("size",size);
        return baseMapper.selectByPage(map);
    }
}
