package com.ssrs.service;

import com.ssrs.model.Comment;
import com.baomidou.mybatisplus.service.IService;
import com.ssrs.vo.CommentVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author haha
 * @since 2019-03-08
 */
public interface CommentService extends IService<Comment> {
    List<Comment> getListByWorksId(CommentVo vo);
    void insertByReception(Comment vo);
}
