package com.ssrs.controller.admin;


import cn.hutool.crypto.digest.DigestUtil;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.Teacher;
import com.ssrs.service.TeacherService;
import com.ssrs.util.commom.APPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * <p>
 * 用户信息 前端控制器
 * </p>
 *
 * @author haha
 * @since 2019-02-24
 */
@Controller
@RequestMapping("/teacher")
public class TeacherController {

    private Page<Teacher> getPageByMe(Page<Teacher> tPage, List<Teacher> records){
        tPage.setRecords(records);
        tPage.setTotal(records.size());
        return tPage;
    }

    @Qualifier("teacherServiceImpl")
    @Autowired
    private TeacherService teacherService;
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public ModelAndView index(){
        return new ModelAndView("admin/teacher/list");
    }



    @RequestMapping(value = "getTeacherPage",method = RequestMethod.POST)
    @ResponseBody
    public Object getTeacherPage(int page ,int limit){
        //Page<Teacher> teacherPage = teacherService.selectPage(new Page<>(page, limit));
        return  PageManager.buildPage(getPageByMe(new Page<>(page, limit),
                teacherService.getAllBean()));
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public ModelAndView goAdd(){
        ModelAndView modelAndView = new ModelAndView("admin/teacher/add");
        return modelAndView;
    }

    /**
     * 添加方法
     * @param teacher
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(Teacher teacher){
        teacher.setLoginPwd(DigestUtil.md5Hex(teacher.getLoginPwd()));
        boolean b = teacherService.insertByReducePoJo(teacher);
        return b? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }

    /**
     * 跳转到编辑页面
     * @param id 学员id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("admin/teacher/update");
        Teacher tea = teacherService.getBeanById(id);

        modelAndView.addObject("teacher",tea);
        return modelAndView;
    }
    /**
     * 更新学员
     * @param teacher 学员id
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(Teacher teacher){
        teacher.setLoginPwd(DigestUtil.md5Hex(teacher.getLoginPwd()));
        Boolean b = teacherService.updateByReducePoJo(teacher);
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
        boolean b = teacherService.deleteById(id);
        return b? APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }

}

