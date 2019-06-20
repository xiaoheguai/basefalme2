package com.ssrs.service.impl;

import com.ssrs.model.Ccourse;
import com.ssrs.mapper.CcourseMapper;
import com.ssrs.service.CcourseService;
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
public class CcourseServiceImpl extends ServiceImpl<CcourseMapper, Ccourse> implements CcourseService {
    @Override
    public List<Ccourse> selectByPage(Integer page, Integer size) {
        Integer begin = (page-1)*size;
        Map<String,Integer> map = new HashMap<>();
        map.put("begin",begin);
        map.put("size",size);
        return baseMapper.selectByPage(map);
    }
}
