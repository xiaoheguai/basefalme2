package com.ssrs.controller.admin;


import cn.hutool.crypto.digest.DigestUtil;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.Goods;
import com.ssrs.model.Rcourse;
import com.ssrs.permission.model.User;
import com.ssrs.service.GoodsService;
import com.ssrs.service.RcourseService;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.vo.MUserVo;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
@RequestMapping("/rcourse")
public class RcourseController {

    @Autowired
    private GoodsService goodsService;
    private Page<Rcourse> getPageByMe(Page<Rcourse> tPage, List<Rcourse> records){
        tPage.setRecords(records);
        tPage.setTotal(records.size());
        return tPage;
    }


    @Autowired
    private RcourseService rcourseService;
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public ModelAndView index(){
        return new ModelAndView("admin/rcourse/list");
    }



    @RequestMapping(value = "getRcoursePage",method = RequestMethod.POST)
    @ResponseBody
    public Object getRcoursePage(int page ,int limit){
        //Page<Rcourse> rcoursePage = rcourseService.selectPage(new Page<>(page, limit));
        return  PageManager.buildPage(getPageByMe(new Page<>(page, limit),
                rcourseService.selectList(null)));//通过ajax将必修课数据返回到页面
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public ModelAndView goAdd(){
        ModelAndView modelAndView = new ModelAndView("admin/rcourse/add");
        return modelAndView;
    }

    /**
     * 添加方法
     * @param rcourse
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(Rcourse rcourse){
        User user = (User) SecurityUtils.getSubject().getPrincipal();//获取用户信息
        rcourse.setUploadTime(new Date());//设置时间
        rcourse.setMakerId(user.getId());//设置上传者id
        rcourse.setMakerName(user.getNickname());//设置上传者名称
        Goods goods = new Goods();
        goods.setGoodsName(rcourse.getCourseName());//设置视频名称
        goods.setGoodsType("1");//默认为上架视频
        goods.setGoodsUnitPrice(rcourse.getGoodsPrice());//设置上架视频价格
        goods.setUserId(user.getId());//设置上传者id
        goods.setUserName(user.getNickname());//设置上传者名称
        goodsService.insertGetId(goods);//将上架信息保存进数据库
        rcourse.setGoodsId(goods.getId());//设置上架id
        rcourse.setGoodsType(Integer.valueOf(goods.getGoodsType()));//设置上架类型
        boolean b = rcourseService.insert(rcourse);//保存视频课程进数据库
        return b? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);//判断是否保存成功
    }

    /**
     * 跳转到编辑页面
     * @param id 学员id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("admin/rcourse/update");
        Rcourse rcourse = rcourseService.selectById(id);

        modelAndView.addObject("rcourse",rcourse);
        return modelAndView;
    }
    /**
     * 更新学员
     * @param rcourse 学员id
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(Rcourse rcourse){
        Boolean b = rcourseService.updateById(rcourse);
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
        boolean b = rcourseService.deleteById(id);
        return b? APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }

}

