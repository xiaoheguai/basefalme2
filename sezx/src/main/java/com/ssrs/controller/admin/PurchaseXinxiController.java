package com.ssrs.controller.admin;


import cn.hutool.crypto.digest.DigestUtil;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.Discount;
import com.ssrs.model.PurchaseXinxi;
import com.ssrs.model.Student;
import com.ssrs.service.DiscountService;
import com.ssrs.service.PurchaseXinxiService;
import com.ssrs.service.StudentService;
import com.ssrs.service.impl.DiscountServiceImpl;
import com.ssrs.service.impl.StudentServiceImpl;
import com.ssrs.util.commom.APPUtil;
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
 * @since 2019-03-02
 */
@Controller
@RequestMapping("/px")
public class PurchaseXinxiController {
    private Page<PurchaseXinxi> getPageByMe(Page<PurchaseXinxi> tPage, List<PurchaseXinxi> records){
        tPage.setRecords(records);
        tPage.setTotal(records.size());
        return tPage;
    }


    @Autowired
    private PurchaseXinxiService purchaseXinxiService;

    @Autowired
    private DiscountService discountService;

    @Autowired
    private StudentService studentService;
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public ModelAndView index(){
        return new ModelAndView("admin/purchasexinxi/list");
    }



    @RequestMapping(value = "getpxPage",method = RequestMethod.POST)
    @ResponseBody
    public Object getPurchasexinxiPage(int page ,int limit){
        //Page<Student> studentPage = studentService.selectPage(new Page<>(page, limit));
        return  PageManager.buildPage(getPageByMe(new Page<>(page, limit),
                purchaseXinxiService.getAllBean()));
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public ModelAndView goAdd(){
        List<Discount> discounts = discountService.selectList(null);
        //暂时只有学生是顾客
        List<Student> students = studentService.getAllBean();
        ModelAndView modelAndView = new ModelAndView("admin/purchasexinxi/add");
        modelAndView.addObject("discounts",discounts);
        modelAndView.addObject("customs",students);
        return modelAndView;
    }

    /**
     * 添加方法
     * @param purchaseXinxi
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(PurchaseXinxi purchaseXinxi){
        purchaseXinxi.setPurchaseTime(new Date());
        boolean b = purchaseXinxiService.insertByReducePoJo(purchaseXinxi);
        return b? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }

    /**
     * 跳转到编辑页面
     * @param id 学员id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("admin/purchasexinxi/update");
        PurchaseXinxi purchaseXinxi = purchaseXinxiService.getBeanById(id);
        List<Discount> discounts = discountService.selectList(null);
        //暂时只有学生是顾客
        List<Student> students = studentService.getAllBean();
        modelAndView.addObject("purchase",purchaseXinxi);
        modelAndView.addObject("discounts",discounts);
        modelAndView.addObject("customs",students);
        return modelAndView;
    }
    /**
     * 更新学员
     * @param purchaseXinxi 学员id
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(PurchaseXinxi purchaseXinxi){

        Boolean b = purchaseXinxiService.updateByReducePoJo(purchaseXinxi);
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
        boolean b = purchaseXinxiService.deleteById(id);
        return b?APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }


}

