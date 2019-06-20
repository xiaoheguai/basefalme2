package com.ssrs.controller.admin;


import com.ssrs.model.Answer;
import com.ssrs.model.Test;
import com.ssrs.service.AnswerService;
import com.ssrs.service.TestService;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.vo.TestVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.beans.Transient;
import java.util.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author haha
 * @since 2019-03-10
 */
@Controller
@RequestMapping("/test")
public class TestController {
    @Autowired
    private TestService testService;
    @Autowired
    private AnswerService answerService;
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public ModelAndView index(TestVo vo){
        List<Test> tests = testService.getListByWorksId(vo);
        Map<String,Test> rootMap = new LinkedHashMap<>();
        Map<String,List<Answer>> childMap = new LinkedHashMap<>();
        if(tests!=null &&tests.size()>0) {
            for (int i = 0; i < tests.size(); i++) {
                List<Answer> answers = answerService.getAnswerByTestId(tests.get(i).getId());
                rootMap.put(String.valueOf(tests.get(i).getId()),tests.get(i));
                childMap.put(String.valueOf(tests.get(i).getId()),answers);
            }
        }
        ModelAndView modelAndView = new ModelAndView("admin/test/list");
        modelAndView.addObject("worksId",vo.getCourseId());
        modelAndView.addObject("worksType",vo.getCourseType());
        modelAndView.addObject("rootMap",rootMap);
        modelAndView.addObject("childMap",childMap);
        return modelAndView;
    }



    @RequestMapping(value = "gettestPage",method = RequestMethod.POST)
    @ResponseBody
    public Object gettestPage(Long worksId){
//        List<test> comments = commentService.getListByWorksId(worksId);
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




    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public ModelAndView goAdd(@RequestParam(value = "id",required = false) Long pId,
                              @RequestParam(value = "courseId") Long courseId,
                              @RequestParam(value = "courseType") Long courseType){
        String id = "";
        ModelAndView modelAndView = new ModelAndView("admin/test/add");
        modelAndView.addObject("pId",pId);
        modelAndView.addObject("courseId",courseId);
        modelAndView.addObject("courseType",courseType);

        return modelAndView;
    }

    /**
     * 添加方法
     * @param questionNo
     * @param question
     * @param answer1
     * @param answer2
     * @param answer3
     * @param answer4
     * @param isright
     * @param courseId
     * @param courseType
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(int questionNo ,String question ,String answer1,String answer2,String answer3,
                      String answer4,String isright,String courseId,String courseType){
       // Long testid = testService.getNextId();
        Test test = new Test();
        //test.setId(testid);
        test.setCourseId(Long.valueOf(courseId));
        test.setCourseType(Long.valueOf(courseType));
        test.setQuestion(question);
        test.setQuestionNo(questionNo);
        testService.insertAndId(test);
        Long testid = test.getId();
        if(answer1!=null && answer1!=""){
            addanswer(1,answer1,testid,Integer.valueOf(isright));
        }
        if(answer2!=null && answer2!=""){
            addanswer(2,answer2,testid,Integer.valueOf(isright));
        }
        if(answer3!=null && answer3!=""){
            addanswer(3,answer3,testid,Integer.valueOf(isright));
        }
        if(answer4!=null && answer4!=""){
            addanswer(4,answer4,testid,Integer.valueOf(isright));
        }

        return APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE);
    }

    private void addanswer(int nomber,String answerstr,Long testId,int truenomber){
        //Long answerid = answerService.getNextId();
        Answer answer = new Answer();
        //answer.setId(answerid);
        answer.setAnswerNo(nomber);
        answer.setAnswer(answerstr);
        if ((nomber == truenomber)) {
            answer.setIsTrue(1);
        } else {
            answer.setIsTrue(0);
        }
        answer.setTestId(testId);
        answerService.insert(answer);
    }

    /**
     * 跳转到编辑页面
     * @param id 学员id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("admin/test/update");
        Test test = testService.selectById(id);
        List<Answer> answers = new ArrayList<>();
        String answer1 = null;
        String answer2 = null;
        String answer3 = null;
        String answer4 = null;
        int istrue = 0;
        if (test!=null ){
            answers = answerService.getAnswerByTestId(test.getId());
            for(Answer answer : answers){
                if(answer.getAnswerNo()==1){
                    answer1 = answer.getAnswer();
                    if (answer.getIsTrue() == 1){
                        istrue = 1;
                    }
                }else if(answer.getAnswerNo()==2){
                    answer2 = answer.getAnswer();
                    if (answer.getIsTrue() == 1){
                        istrue = 2;
                    }
                }else if(answer.getAnswerNo()==3){
                    answer3 = answer.getAnswer();
                    if (answer.getIsTrue() == 1){
                        istrue = 3;
                    }
                }else if(answer.getAnswerNo()==4){
                    answer4 = answer.getAnswer();
                    if (answer.getIsTrue() == 1){
                        istrue = 4;
                    }
                }
            }
        }
        modelAndView.addObject("test",test);
        modelAndView.addObject("answer1",answer1);
        modelAndView.addObject("answer2",answer2);
        modelAndView.addObject("answer3",answer3);
        modelAndView.addObject("answer4",answer4);
        modelAndView.addObject("istrue",istrue);
        return modelAndView;
    }
    /**
     * 更新学员
     * @param
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(Long id,int questionNo ,String question ,String answer1,String answer2,String answer3,
                         String answer4,String isright){
        Test test = new Test();
        test.setId(id);
        test.setQuestionNo(questionNo);
        test.setQuestion(question);
        boolean bo = testService.updateById(test);
        int bo1 = 0;
        List<Answer> answers = answerService.getAnswerByTestId(id);
        for(Answer answer : answers){
            if(answer.getAnswerNo() == 1){
                answer.setAnswer(answer1);
                if(Integer.valueOf(isright) == 1){
                    answer.setIsTrue(1);
                }else{
                    answer.setIsTrue(0);
                }
            }else if(answer.getAnswerNo() == 2){
                answer.setAnswer(answer2);
                if(Integer.valueOf(isright) == 2){
                    answer.setIsTrue(1);
                }else{
                    answer.setIsTrue(0);
                }
            }else if(answer.getAnswerNo() == 3){
                answer.setAnswer(answer3);
                if(Integer.valueOf(isright) == 3){
                    answer.setIsTrue(1);
                }else{
                    answer.setIsTrue(0);
                }
            }else if(answer.getAnswerNo() == 4){
                answer.setAnswer(answer4);
                if(Integer.valueOf(isright) == 4){
                    answer.setIsTrue(1);
                }else{
                    answer.setIsTrue(0);
                }
            }
            bo1 += (answerService.updateById(answer))?1:0;
        }
        return (bo &&(bo1 == 4))? APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):
                APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    /**
     * 删除学员
     * @param id 学员id
     * @return
     */
    @RequestMapping(value = "del",method = RequestMethod.POST)
    @ResponseBody
    public Object del(Long id){
        boolean b = testService.deleteById(id);
        boolean b1 = answerService.deleteByTestId(id);
        return (b && b1)? APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):
                APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }
}

