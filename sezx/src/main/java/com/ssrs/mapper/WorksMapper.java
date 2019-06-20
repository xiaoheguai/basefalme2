package com.ssrs.mapper;

import com.ssrs.model.Rcourse;
import com.ssrs.model.Works;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ssrs.permission.model.User;
import com.ssrs.vo.MUserVo;
import org.apache.ibatis.annotations.Param;

import javax.resource.spi.work.Work;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
public interface WorksMapper extends BaseMapper<Works> {
    List<Works> selectByPage(@Param(value = "page") Map<String,Object> map);
    List<Works> selectAllVideoByPage(@Param(value = "page") Map<String,Object> map);
    Integer selectCountByPage(Long id);
    Integer selectCountAllVideoByPage(Long id);
    Rcourse selectVidoeByTypeAndId(@Param(value = "video") Map<String,Object> map);
    void updateHits(@Param(value = "hitmap") Map<String,Object> map);
    User selectByRcourseUserId(Long id);
    User selectByCcourseUserId(Long id);
    MUserVo selectByWorksUserId(Long id);
    Integer checkXiaJia(Long id);
    void deleteGoodsByWorksId(Long id);
    void goToXiaJia(Long id);
    void updateByShangJia(Works works);
}
