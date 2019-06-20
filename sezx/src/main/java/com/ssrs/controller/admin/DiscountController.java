package com.ssrs.controller.admin;


import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.Discount;
import com.ssrs.model.GoodsType;
import com.ssrs.service.DiscountService;
import com.ssrs.service.GoodsTypeService;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.util.commom.JiSuanUtil;
import com.ssrs.vo.OpenVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author haha
 * @since 2019-03-02
 */
@Controller
@RequestMapping("/discount")
public class DiscountController {

    @Autowired
    private DiscountService discountService;

    @Autowired
    private GoodsTypeService goodsTypeService;
    /**
     * 删除学员
     * @param totalAmount 学员id
     * @param discountId 学员id
     * @return
     */
    @RequestMapping(value = "getDiscountAmount",method = RequestMethod.POST)
    @ResponseBody
    public Object getDiscountAmount(@Param(value = "totalAmount") Double totalAmount,
            @Param(value = "discountId") Long discountId){
        Discount discount = discountService.selectById(discountId);
        String status = "";
        String message = "";
        String amountstr = "";
        double amount = 0.0;
        if (discount!=null){
            String gs = discount.getDiscountExpression();
            gs = gs.replaceAll("P",String.valueOf(totalAmount));
            if (gs!=null){
                amountstr = JiSuanUtil.computeString(gs);
            }
        }
        Map<String,Object> map = new HashMap<>(16);
        boolean boo = false;
        try{
            if(Double.valueOf(amountstr) instanceof Double){
                amount = (double) Math.round(Double.valueOf(amountstr) * 100) / 100;
                boo = true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        map.put("status",boo?200:300);
        map.put("message",boo?"成功":"计算出错");
        map.put("amount",amount);


        return map;
    }

    @RequestMapping(value = "list",method = RequestMethod.GET)
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("admin/discount/list");
        return mv;
    }

    /**
     * 得到分页数据
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "getdiscountPage",method = RequestMethod.POST)
    @ResponseBody
    public Object getPermissionPage(int page ,int limit){
        Page<Discount> permissionPage = discountService.selectPage(new Page<>(page, limit));
        Map<String, Object> map = PageManager.buildPage(permissionPage);
        return map;
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public ModelAndView goAdd(){
        ModelAndView modelAndView = new ModelAndView("/admin/discount/add");
        List<Discount> discounts = discountService.selectList(null);
        List<GoodsType> goodsTypes = goodsTypeService.selectList(null);
        modelAndView.addObject("discounts",discounts);
        modelAndView.addObject("goodsTypes",goodsTypes);
        return modelAndView;
    }

    /**
     * 添加折扣方法
     * @param discount
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(Discount discount){
        Boolean bo = discountService.insert(discount);
        return bo? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }


    /**
     * 跳转到编辑页面
     * @param id 折扣id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("/admin/discount/update");
        List<GoodsType>  goodsTypes = goodsTypeService.selectList(null );
        Discount discount = discountService.selectById(id);
        modelAndView.addObject("discount",discount);
        modelAndView.addObject("goodsTypes",goodsTypes);
        return modelAndView;
    }

    /**
     * 编辑方法
     * @param permission
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(Discount permission){
        boolean b = discountService.updateById(permission);
        return b?APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    /**
     * 权限删除方法
     * @return
     */
    @RequestMapping(value = "del",method = RequestMethod.POST)
    @ResponseBody
    public Object del(Long id){
        boolean b = discountService.deleteById(id);
        return b?APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }


    @RequestMapping(value = "updateOpen",method = RequestMethod.POST)
    @ResponseBody
    public Object updateType(OpenVo openVo){
        boolean bo = discountService.updateOpenById(openVo);
        return bo? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }
}

