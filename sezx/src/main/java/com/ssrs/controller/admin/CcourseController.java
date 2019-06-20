package com.ssrs.controller.admin;


import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.Ccourse;
import com.ssrs.model.Goods;
import com.ssrs.permission.model.User;
import com.ssrs.service.CcourseService;
import com.ssrs.service.GoodsService;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.vo.MUserVo;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author haha
 * @since 2019-03-08
 */
@Controller
@RequestMapping("/ccourse")
public class CcourseController {
    @Autowired
    private GoodsService goodsService;

    private Page<Ccourse> getPageByMe(Page<Ccourse> tPage, List<Ccourse> records){
        tPage.setRecords(records);
        tPage.setTotal(records.size());
        return tPage;
    }


    @Autowired
    private CcourseService ccourseService;
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public ModelAndView index(){
        return new ModelAndView("admin/ccourse/list");
    }



    @RequestMapping(value = "getCcoursePage",method = RequestMethod.POST)
    @ResponseBody
    public Object getccoursePage(int page ,int limit){
        //Page<Rcourse> rcoursePage = rcourseService.selectPage(new Page<>(page, limit));
        return  PageManager.buildPage(getPageByMe(new Page<>(page, limit),
                ccourseService.selectList(null)));
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public ModelAndView goAdd(){
        ModelAndView modelAndView = new ModelAndView("admin/ccourse/add");
        return modelAndView;
    }

    /**
     * 添加方法
     * @param ccourse
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(Ccourse ccourse){
        User user = (User) SecurityUtils.getSubject().getPrincipal();

        ccourse.setUploadTime(new Date());
        ccourse.setMakerId(user.getId());
        ccourse.setMakerName(user.getNickname());
        Goods goods = new Goods();
        goods.setGoodsName(ccourse.getCourseName());
        goods.setGoodsType("2");
        goods.setGoodsUnitPrice(ccourse.getGoodsPrice());
        goods.setUserId(user.getId());
        goods.setUserName(user.getNickname());
        goodsService.insertGetId(goods);
        ccourse.setGoodsId(goods.getId());
        ccourse.setGoodsType(Integer.valueOf(goods.getGoodsType()));
        boolean b = ccourseService.insert(ccourse);
        return b? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }

    /**
     * 跳转到编辑页面
     * @param id 学员id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("admin/ccourse/update");
        Ccourse ccourse = ccourseService.selectById(id);

        modelAndView.addObject("ccourse",ccourse);
        return modelAndView;
    }
    /**
     * 更新学员
     * @param ccourse 学员id
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(Ccourse ccourse){
        Boolean b = ccourseService.updateById(ccourse);
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
        boolean b = ccourseService.deleteById(id);
        return b? APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }
}

