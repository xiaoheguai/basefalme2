package com.ssrs.controller.admin;


import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.Discount;
import com.ssrs.model.Goods;
import com.ssrs.model.PurchaseMingxi;
import com.ssrs.service.GoodsService;
import com.ssrs.service.PurchaseMingxiService;
import com.ssrs.util.commom.APPUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author haha
 * @since 2019-03-02
 */
@Controller
@RequestMapping("/pxmx")
public class PurchaseMingxiController {
    private Page<PurchaseMingxi> getPageByMe(Page<PurchaseMingxi> tPage, List<PurchaseMingxi> records){
        tPage.setRecords(records);
        tPage.setTotal(records.size());
        return tPage;
    }


    @Autowired
    private PurchaseMingxiService purchaseMingxiService;

    @Autowired
    private GoodsService goodsService;

    @RequestMapping(value = "detaillist",method = RequestMethod.GET)
    public ModelAndView index(Long pxid){
        ModelAndView mv =  new ModelAndView("admin/purchasemingxi/detaillist");
        mv.addObject("pxid",pxid);
        return mv;
    }



    @RequestMapping(value = "getpxmxPage",method = RequestMethod.GET)
    @ResponseBody
    public Object getPurchasemingxiPage(int page ,int limit,@Param(value = "pxid") Long pxid){
        //Page<Student> studentPage = studentService.selectPage(new Page<>(page, limit));
        return  PageManager.buildPage(getPageByMe(new Page<>(page, limit),
                purchaseMingxiService.getBeansByPXId(pxid)));
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public ModelAndView goAdd(Long pxid){

        List<Goods> goods = goodsService.selectList(null);
        ModelAndView modelAndView = new ModelAndView("admin/purchasemingxi/add");
        modelAndView.addObject("goods",goods);
        modelAndView.addObject("pxid",pxid);
        return modelAndView;
    }

    /**
     * 添加方法
     * @param purchaseMingxi
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(PurchaseMingxi purchaseMingxi){
        boolean b = purchaseMingxiService.insert(purchaseMingxi);
        return b? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }

    /**
     * 跳转到编辑页面
     * @param id 学员id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("admin/purchasemingxi/update");
        PurchaseMingxi purchaseMingxi = purchaseMingxiService.selectById(id);
        List<Goods> goods = goodsService.selectList(null);
        modelAndView.addObject("pxmx",purchaseMingxi);
        modelAndView.addObject("goods",goods);
        return modelAndView;
    }
    /**
     * 更新学员
     * @param purchaseMingxi 学员id
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(PurchaseMingxi purchaseMingxi){

        Boolean b = purchaseMingxiService.updateById(purchaseMingxi);
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
        boolean b = purchaseMingxiService.deleteById(id);
        return b?APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }

}

