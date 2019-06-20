package com.ssrs.mapper;

import com.ssrs.model.Comment;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.ssrs.vo.CommentVo;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author haha
 * @since 2019-03-08
 */
public interface CommentMapper extends BaseMapper<Comment> {
    List<Comment> getListByWorksId(CommentVo vo);
    void insertByReception(Comment vo);
}
