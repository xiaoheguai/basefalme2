package com.ssrs.service;

import com.ssrs.model.Rcourse;
import com.ssrs.model.Works;
import com.baomidou.mybatisplus.service.IService;
import com.ssrs.permission.model.User;
import com.ssrs.vo.MUserVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
public interface WorksService extends IService<Works> {
    List<Works> selectByPage(Long id,Integer page , Integer size);
    List<Works> selectAllVideoByPage(Long id,Integer page , Integer size);
    Integer selectCountByPage(Long id);
    Integer selectCountAllVideoByPage(Long id);
    Rcourse selectVidoeByTypeAndId(Integer type, Long id);
    void updateHits(Integer type, Long id);
    User selectByRcourseUserId(Long id);
    User selectByCcourseUserId(Long id);
    MUserVo selectByWorksUserId(Long id);
    boolean checkXiaJia(Long id);
    void goToXiaJia(Long id);
    void updateByShangJia(Works works);
}
