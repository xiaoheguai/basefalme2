package com.ssrs.service.impl;

import com.ssrs.model.Comment;
import com.ssrs.mapper.CommentMapper;
import com.ssrs.service.CommentService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.ssrs.vo.CommentVo;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author haha
 * @since 2019-03-08
 */
@Service
public class CommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements CommentService {

    @Override
    public List<Comment> getListByWorksId(CommentVo vo) {
        return baseMapper.getListByWorksId(vo);
    }

    @Override
    public void insertByReception(Comment vo) {
         baseMapper.insertByReception(vo);
    }
}
