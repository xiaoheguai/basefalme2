package com.ssrs.controller.admin;


import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.Comment;
import com.ssrs.permission.model.User;
import com.ssrs.service.CommentService;
import com.ssrs.service.CommonService;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.vo.CommentVo;
import com.ssrs.vo.TreeTableVo;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Array;
import java.util.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author haha
 * @since 2019-03-08
 */
@Controller
@RequestMapping("/comment")
public class CommentController {

    private Page<Comment> getPageByMe(Page<Comment> tPage, List<Comment> records){
        tPage.setRecords(records);
        tPage.setTotal(records.size());
        return tPage;
    }

    @Autowired
    private CommentService commentService;
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public ModelAndView index(CommentVo vo){
        List<Object> lists = getRootAndChildMap(vo);
        ModelAndView modelAndView = new ModelAndView("admin/comment/list");
        modelAndView.addObject("worksId",vo.getWorksId());
        modelAndView.addObject("worksType",vo.getWorksType());
        modelAndView.addObject("rootMap",(Map<String,Comment>)lists.get(0));
        modelAndView.addObject("childMap",(Map<String,List<Comment>>)lists.get(1));
        return modelAndView;
    }

public List<Object> getRootAndChildMap(CommentVo vo){
    List<Object> lists = new ArrayList<>();
    List<Comment> comments = commentService.getListByWorksId(vo);
    Map<String,Comment> rootMap = new LinkedHashMap<>();
    Map<String,List<Comment>> childMap = new LinkedHashMap<>();
    if(comments!=null &&comments.size()>0) {
        for (int i = 0; i < comments.size(); i++) {
            if (comments.get(i).getPId() == null) {
                List<Comment> commentList = new ArrayList<>();
                getNextComment(comments.get(i),commentList,comments);
                rootMap.put(String.valueOf(comments.get(i).getId()),comments.get(i));
                childMap.put(String.valueOf(comments.get(i).getId()),commentList);
            }

        }
    }
    lists.add(rootMap);
    lists.add(childMap);
    return lists;

}

    @RequestMapping(value = "getcommentPage",method = RequestMethod.POST)
    @ResponseBody
    public Object getcommentPage(Long worksId){
//        List<Comment> comments = commentService.getListByWorksId(worksId);
//        Map<Comment,Object> maps = new LinkedHashMap<>();
//        if(comments!=null &&comments.size()>0) {
//            for (int i = 0; i < comments.size(); i++) {
//                if (comments.get(i).getPId() == null) {
//                    Map<Comment,Object> mapss = new LinkedHashMap<>();
//                    getNextComment(comments.get(i),mapss,comments);
//                    maps.put(comments.get(i),mapss);
//                }
//            }
//        }
//        return maps;
        return  null;

    }

    private void getNextComment(Comment comment,List<Comment> list,List<Comment> comments){

            for (Comment comm : comments) {
                if(comm.getPId() != null && comment.getId() == comm.getPId()){

                    comm.setUserName(comm.getUserName()+"  [回复"+comment.getUserName()+"]");
                    list.add(comm);
                    getNextComment(comm,list,comments);
                }
            }

    }



    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public ModelAndView goAdd(@RequestParam(value = "id",required = false) Long pId,
                              @RequestParam(value = "worksId") Long worksId,
                              @RequestParam(value = "worksType") Long worksType){
        String id = "";
        ModelAndView modelAndView = new ModelAndView("admin/comment/add");
        modelAndView.addObject("pId",pId);
        modelAndView.addObject("worksId",worksId);
        modelAndView.addObject("worksType",worksType);

        return modelAndView;
    }

    /**
     * 添加方法
     * @param comment
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(Comment comment, HttpServletRequest request){
        comment.setCommentTime(new Date());
        User user = (User) SecurityUtils.getSubject().getPrincipal();
        comment.setUserId(user.getId());
        comment.setUserName(user.getNickname());
        boolean b = commentService.insert(comment);
        return b? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }

    /**
     * 跳转到编辑页面
     * @param id 学员id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("admin/comment/update");
        Comment comment = commentService.selectById(id);

        modelAndView.addObject("comment",comment);
        return modelAndView;
    }
    /**
     * 更新学员
     * @param comment 学员id
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(Comment comment){
        Boolean b = commentService.updateById(comment);
        return b? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    /**
     * 删除学员
     * @param id 学员id
     * @return
     */
    @RequestMapping(value = "del",method = RequestMethod.POST)
    @ResponseBody
    public Object del(Long id){
        boolean b = commentService.deleteById(id);
        return b? APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }
}

