package com.ssrs.controller.admin;


import cn.hutool.crypto.digest.DigestUtil;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.controller.BaseController;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.Student;
import com.ssrs.service.StudentService;
import com.ssrs.util.commom.APPUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户信息 前端控制器
 * </p>
 *
 * @author haha
 * @since 2019-02-24
 */
@Controller
@Scope(value = "prototype")
@RequestMapping("/student")
public class StudentController extends BaseController {

    private Page<Student> getPageByMe(Page<Student> tPage,List<Student> records){
        tPage.setRecords(records);
        tPage.setTotal(records.size());
        return tPage;
    }

    @Qualifier("studentServiceImpl")
    @Autowired
    private StudentService studentService;
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public ModelAndView index(){
        return new ModelAndView("admin/student/list");
    }



    @RequestMapping(value = "getstudentPage",method = RequestMethod.POST)
    @ResponseBody
    public Object getStudentPage(int page ,int limit){
        //Page<Student> studentPage = studentService.selectPage(new Page<>(page, limit));
        return  PageManager.buildPage(getPageByMe(new Page<>(page, limit),
                                            studentService.getAllBean()));
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public ModelAndView goAdd(){
        ModelAndView modelAndView = new ModelAndView("admin/student/add");
        return modelAndView;
    }

    /**
     * 添加方法
     * @param student
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(Student student){
        student.setLoginPwd(DigestUtil.md5Hex(student.getLoginPwd()));
        boolean b = studentService.insertByReducePoJo(student);
        return b? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }

    /**
     * 跳转到编辑页面
     * @param id 学员id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("admin/student/update");
        Student stu = studentService.getBeanById(id);

        modelAndView.addObject("student",stu);
        return modelAndView;
    }
    /**
     * 更新学员
     * @param student 学员id
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(Student student){
        student.setLoginPwd(DigestUtil.md5Hex(student.getLoginPwd()));
        Boolean b = studentService.updateByReducePoJo(student);
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
        boolean b = studentService.deleteById(id);
        return b?APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }


}