package com.ssrs.controller.admin;


import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.controller.BaseController;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.GoodsType;
import com.ssrs.model.Student;
import com.ssrs.model.Works;
import com.ssrs.service.GoodsTypeService;
import com.ssrs.service.StudentService;
import com.ssrs.service.WorksService;
import com.ssrs.util.commom.APPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
@Controller
@RequestMapping("/works")
public class WorksController extends BaseController {


    @Autowired
    private WorksService worksService;

    @Autowired
    private GoodsTypeService goodsTypeService;

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "list",method = RequestMethod.GET)
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("admin/works/list");
        return mv;
    }

    /**
     * 得到分页数据
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "getworksPage",method = RequestMethod.POST)
    @ResponseBody
    public Object getPermissionPage(int page ,int limit){
        Page<Works> worksPage = worksService.selectPage(new Page<>(page, limit));
        Map<String, Object> map = PageManager.buildPage(worksPage);
        return map;
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public ModelAndView goAdd(){
        ModelAndView modelAndView = new ModelAndView("/admin/works/add");
        List<Works> workss = worksService.selectList(null);
        List<GoodsType> goodsTypes = goodsTypeService.selectList(null);
        modelAndView.addObject("workss",workss);
        modelAndView.addObject("goodsTypes",goodsTypes);
        List<Student> users = studentService.getAllBean();
        modelAndView.addObject("users",users);
        return modelAndView;
    }

    /**
     * 添加作品方法
     * @param works
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(Works works){
        works.setUploadTime(new Date());

        //works.setUserName(getSession().getAttributeNames("admin"));
        Boolean bo = worksService.insert(works);
        return bo? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }


    /**
     * 跳转到编辑页面
     * @param id 作品id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("/admin/works/update");
        List<GoodsType>  goodsTypes = goodsTypeService.selectList(null );
        List<Student> users = studentService.getAllBean();
        modelAndView.addObject("users",users);
        Works work = worksService.selectById(id);
        modelAndView.addObject("work",work);
        modelAndView.addObject("goodsTypes",goodsTypes);
        return modelAndView;
    }

    /**
     * 编辑方法
     * @param work
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(Works work){
        boolean b = worksService.updateById(work);
        return b?APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    /**
     * 删除方法
     * @return
     */
    @RequestMapping(value = "del",method = RequestMethod.POST)
    @ResponseBody
    public Object del(Long id){
        boolean b = worksService.deleteById(id);
        return b?APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }

    /**
     * 修改按钮方法
     * @return
     */
    @RequestMapping(value = "updateOpen",method = RequestMethod.POST)
    @ResponseBody
    public Object del(Long id,String type,Integer isOpen){
        Works work = worksService.selectById(id);
        if("wanToGoods".equals(type)){
            work.setWanToGoods(isOpen);
        }else if("isGoods".equals(type)){
            work.setIsGoods(isOpen);
        }
        boolean b = worksService.updateById(work);
        return b?APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }
}

