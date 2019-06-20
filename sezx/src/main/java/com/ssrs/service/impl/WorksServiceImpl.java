package com.ssrs.service.impl;

import com.ssrs.model.Rcourse;
import com.ssrs.model.Works;
import com.ssrs.mapper.WorksMapper;
import com.ssrs.permission.model.User;
import com.ssrs.service.WorksService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.vo.MUserVo;
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
 * @since 2019-03-04
 */
@Service
public class WorksServiceImpl extends ServiceImpl<WorksMapper, Works> implements WorksService {
    @Override
    public List<Works> selectByPage(Long id, Integer page, Integer size) {
        Integer begin = (page-1)*size;
        Map<String,Object> map = new HashMap<>();
        map.put("begin",begin);
        map.put("size",size);
        map.put("id",id);
        return baseMapper.selectByPage(map);
    }
    @Override
    public List<Works> selectAllVideoByPage(Long id, Integer page, Integer size) {
        Integer begin = (page-1)*size;
        Map<String,Object> map = new HashMap<>();
        map.put("begin",begin);
        map.put("size",size);
        map.put("id",id);
        return baseMapper.selectAllVideoByPage(map);
    }

    @Override
    public Integer selectCountByPage(Long id) {
        return baseMapper.selectCountByPage(id);
    }

    @Override
    public Integer selectCountAllVideoByPage(Long id) {
        return baseMapper.selectCountAllVideoByPage(id);
    }
    @Override
    public Rcourse selectVidoeByTypeAndId(Integer type, Long id) {
        Map<String,Object> map = new HashMap<>();
        map.put("type",type);
        map.put("id",id);
        return baseMapper.selectVidoeByTypeAndId(map);
    }

    @Override
    public void updateHits(Integer type, Long id) {
        Map<String,Object> map = new HashMap<>();
        map.put("type",type);
        map.put("id",id);
        baseMapper.updateHits(map);
    }

    @Override
    public User selectByRcourseUserId(Long id) {
        return baseMapper.selectByRcourseUserId(id);
    }

    @Override
    public User selectByCcourseUserId(Long id) {
        return baseMapper.selectByCcourseUserId(id);
    }

    @Override
    public MUserVo selectByWorksUserId(Long id) {
        return baseMapper.selectByWorksUserId(id);
    }

    @Override
    public boolean checkXiaJia(Long id) {
        Integer count = baseMapper.checkXiaJia(id);
        return (count == 0)?true:false;
    }

    @Override
    public void goToXiaJia(Long id) {
        baseMapper.deleteGoodsByWorksId(id);
        baseMapper.goToXiaJia(id);
    }

    @Override
    public void updateByShangJia(Works works) {
        baseMapper.updateByShangJia(works);
    }
}
