package com.ssrs.controller.reception;

import cn.hutool.crypto.digest.DigestUtil;
import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.controller.BaseController;
import com.ssrs.controller.admin.CommentController;
import com.ssrs.controller.reception.token.mamager.MTokenManager;
import com.ssrs.model.*;
import com.ssrs.permission.service.IUserService;
import com.ssrs.service.*;
import com.ssrs.util.commom.JiSuanUtil;
import com.ssrs.util.commom.LoggerUtils;
import com.ssrs.vo.CommentVo;
import com.ssrs.vo.MUserVo;
import com.ssrs.vo.PurchaseVo;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
@RequestMapping("/m")
public class MController extends BaseController {

    protected final static Logger logger = Logger.getLogger(MController.class);

    @Autowired
    private StudentService studentService;
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private RcourseService rcourseService;
    @Autowired
    private CcourseService ccourseService;
    @Autowired
    private DiscountService discountService;
    @Autowired
    private WorksService worksService;
    @Autowired
    private CommentService commentService;
    @Autowired
    @Qualifier(value = "userService")
    private IUserService iUserService;
    @Autowired
    private DownloadService  downloadService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private PurchaseXinxiService purchaseXinxiService;
    @Autowired
    private PurchaseMingxiService purchaseMingxiService;

    @Autowired
    private PayRecordService payRecordService;
    /**
     * 登录跳转
     *
     * @return
     */
    @RequestMapping("login")
    public ModelAndView login(){
        return new ModelAndView("/reception/login");
    }


    /**
     * 注册跳转
     *
     * @returnBaseController
     */
    @RequestMapping("register")
    public String register() {
        return "reception/register";
    }


    /**
     * 登录
     * @param mUserVo 实体类
     * @param remeberMe 是否记住我
     * @param request
     * @return
     */
    @RequestMapping(value = "submitLogin", method = RequestMethod.POST)
    @ResponseBody
    public Object submitLogin(MUserVo mUserVo, Boolean remeberMe, HttpServletRequest request) {
        Map<String,Object> resultMap = new HashMap<>();
        try {

            MUserVo loginInfo = MTokenManager.login(mUserVo, remeberMe);
            resultMap.put("status", 200);
            resultMap.put("message", "登录成功");
            //获取登录之前的地址
//            SavedRequest savedRequest = WebUtils.getSavedRequest(request);
//            String url = null;
//            if (savedRequest != null) {
//                url = savedRequest.getRequestUrl();
//            }
//            LoggerUtils.fmtDebug(getClass(), "获取登录之前的URL:[%s]", url);
            //如果登录之前没有地址，那么跳转到首页
//            if (StringUtils.isBlank(url)) {
//                url = "/"+request.getContextPath() + "user/index";
//            }
//            resultMap.put("back_url", url);
        } catch (DisabledAccountException e) {
            resultMap.put("status", 500);
            resultMap.put("message", "账户已经禁用");
        } catch (Exception e) {
            resultMap.put("status", 500);
            resultMap.put("message", "账户或密码错误");
        }

        return resultMap;
    }

    /**
     * 退出
     * @return
     */
    @RequestMapping(value="logout",method =RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> logout(){
        Map<String,Object> resultMap = new HashMap<>();
        try {
            MTokenManager.logout();
            resultMap.put("status", 200);
        } catch (Exception e) {
            resultMap.put("status", 500);
            logger.error("errorMessage:" + e.getMessage());
            LoggerUtils.fmtError(getClass(), e, "退出出现错误，%s。", e.getMessage());
        }
        return resultMap;
    }
    @RequestMapping("index")
    public  ModelAndView index(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("reception/index");
        modelAndView.addObject("muser",(MUserVo) SecurityUtils.getSubject().getPrincipal());
        return modelAndView;
    }

    @RequestMapping("main")
    public  ModelAndView main(HttpServletResponse response,HttpServletRequest request){
        String url ="";
        ModelAndView modelAndView = new ModelAndView("reception/main");
        response.setCharacterEncoding("utf-8");
        response.setHeader("contentType", "text/html; charset=utf-8");
        modelAndView.addObject("muser",(MUserVo) SecurityUtils.getSubject().getPrincipal());
        return modelAndView;
    }
    @RequestMapping("user")
    public  ModelAndView mauserin(HttpServletResponse response,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("reception/user");
        modelAndView.addObject("muser",(MUserVo) SecurityUtils.getSubject().getPrincipal());
        return modelAndView;
    }

    @RequestMapping("discount")
    public  ModelAndView discount(HttpServletResponse response,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("reception/discount");
        List<Discount> discounts = discountService.selectOpen();
        modelAndView.addObject("discounts",discounts);
        return modelAndView;
    }

    @RequestMapping("download")
    public  ModelAndView download(HttpServletResponse response,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("reception/download");
        List<Download> downloads = downloadService.selectList(null);
        modelAndView.addObject("downloads",downloads);
        return modelAndView;
    }

    @RequestMapping("order")
    public  ModelAndView order(HttpServletResponse response,HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView("reception/order");
        return modelAndView;
    }

    @RequestMapping(value = "updateByType",method = RequestMethod.POST)
    @ResponseBody
    public  Object updateByType(@RequestParam(value = "type") String type,
                                @RequestParam(value = "value") String val){
        Map<String,Object> resultMap = new HashMap<>();
        MUserVo mUserVo = (MUserVo) SecurityUtils.getSubject().getPrincipal();
        boolean bo = false;
        Map<Object,Object> param = new HashMap<>();
        param.put(type,val);
        param.put("id",mUserVo.getId());

        if(mUserVo.getIsStudent()==1){
            bo = studentService.updateByParam(param);
        }else if (mUserVo.getIsStudent()==0){
            bo = teacherService.updateByParam(param);
        }
        if(bo){
            resultMap.put("status", 200);
            resultMap.put("message", "成功");
            relogin();
        }else{
            resultMap.put("status", 300);
            resultMap.put("message", "修改失败");
        }


        return resultMap;
    }


    @RequestMapping("rcourseList")
    public  ModelAndView rcourseList(HttpServletResponse response,HttpServletRequest request,
                                     @RequestParam(value = "page" ,required = false) Integer page){
        ModelAndView modelAndView = new ModelAndView("reception/video/list");
        //modelAndView.addObject("muser",(MUserVo) SecurityUtils.getSubject().getPrincipal());
        if(page == null || page == 0){
            page = 1;
        }
        List<Rcourse> rcourseList = rcourseService.selectByPage(page,10);
        Integer totalPage = (rcourseService.selectCount(null)/10)+1;
        modelAndView.addObject("rcourseList",rcourseList);
        modelAndView.addObject("url","/m/rcourseList");
        modelAndView.addObject("durl","m/rcourseDetail");
        modelAndView.addObject("totalPage",totalPage);
        modelAndView.addObject("currentPage",page);
        modelAndView.addObject("type",0);
        modelAndView.addObject("isSelf",0);
        //折扣
        List<Discount> discounts = discountService.selectOpen();
        modelAndView.addObject("discounts",discounts);

        return modelAndView;
    }

    @RequestMapping(value = "pagetab",method = RequestMethod.GET)
    public ModelAndView pagetab(int totalPage,int currentPage,String url){
        ModelAndView modelAndView = new ModelAndView("reception/page/paging");
        modelAndView.addObject("totalPage",totalPage);
        modelAndView.addObject("currentPage",currentPage);
        modelAndView.addObject("url",url);

        return modelAndView;
    }


    @RequestMapping("ccourseList")
    public  ModelAndView ccourseList(HttpServletResponse response,HttpServletRequest request,
                                     @RequestParam(value = "page" ,required = false) Integer page){
        ModelAndView modelAndView = new ModelAndView("reception/video/list");
        //modelAndView.addObject("muser",(MUserVo) SecurityUtils.getSubject().getPrincipal());
        if(page == null || page == 0){
            page = 1;
        }
        List<Ccourse> rcourseList = ccourseService.selectByPage(page,10);
        Integer totalPage = (ccourseService.selectCount(null)/10)+1;
        modelAndView.addObject("rcourseList",rcourseList);
        modelAndView.addObject("url","/m/ccourseList");
        modelAndView.addObject("durl","m/ccourseDetail");
        modelAndView.addObject("totalPage",totalPage);
        modelAndView.addObject("currentPage",page);
        modelAndView.addObject("type",1);
        modelAndView.addObject("isSelf",0);
        //折扣
        List<Discount> discounts = discountService.selectOpen();
        modelAndView.addObject("discounts",discounts);
        return modelAndView;
    }

    @RequestMapping("worksList")
    public  ModelAndView worksList(HttpServletResponse response,HttpServletRequest request,
                                     @RequestParam(value = "page" ,required = false) Integer page){
        ModelAndView modelAndView = new ModelAndView("reception/video/list");//设置视图路径
        MUserVo mUserVo = (MUserVo) SecurityUtils.getSubject().getPrincipal();//获取当前登陆用户信息
        modelAndView.addObject("muser",mUserVo);//将用户信息放入视图中
        if(page == null || page == 0){  //判断当前页面值，没有值的话赋为1
            page = 1;
        }
        List<Works> rcourseList = worksService.selectByPage(mUserVo.getId(),page,10);//获取必修课视频分页集合
        Integer totalPage = (worksService.selectCountByPage(mUserVo.getId())/10)+1;//得到总页数
        modelAndView.addObject("rcourseList",rcourseList);//将视频信息放入视图中
        modelAndView.addObject("url","/m/worksList");//将当前访问路径信息放入视图中
        modelAndView.addObject("durl","m/worksDetail");//将详细页访问路径信息放入视图中
        modelAndView.addObject("totalPage",totalPage);//将总页数信息放入视图中
        modelAndView.addObject("currentPage",page);//将当前页数信息放入视图中
        modelAndView.addObject("isSelf",1);
        //折扣
        List<Discount> discounts = discountService.selectOpen();//获取可用的折扣信息
        modelAndView.addObject("discounts",discounts);//将折扣信息放入视图中

        return modelAndView;//返回视图
    }

    @RequestMapping("allvideoList")
    public  ModelAndView allvideoList(HttpServletResponse response,HttpServletRequest request,
                                      @RequestParam(value = "page" ,required = false) Integer page){
        ModelAndView modelAndView = new ModelAndView("reception/video/list");
        MUserVo mUserVo = (MUserVo) SecurityUtils.getSubject().getPrincipal();
        modelAndView.addObject("muser",mUserVo);
        if(page == null || page == 0){
            page = 1;
        }
        List<Works> rcourseList = worksService.selectAllVideoByPage(mUserVo.getId(),page,10);
        Integer totalPage = (worksService.selectCountAllVideoByPage(mUserVo.getId())/10)+1;
        modelAndView.addObject("rcourseList",rcourseList);
        modelAndView.addObject("url","/m/allvideoList");
        modelAndView.addObject("durl","m/allvideoDetail");
        modelAndView.addObject("totalPage",totalPage);
        modelAndView.addObject("currentPage",page);
        modelAndView.addObject("isSelf",0);
        //折扣
        List<Discount> discounts = discountService.selectOpen();
        modelAndView.addObject("discounts",discounts);

        return modelAndView;
    }

    @RequestMapping("rcourseDetail")
    public  ModelAndView rcourseDetail(HttpServletResponse response,HttpServletRequest request,
                                    Long id,Integer type){
        ModelAndView modelAndView = new ModelAndView("reception/video/detail");//设置视图路径

        //默认这里就为浏览量加1(0:必修课 1:选修课 2:学员作品)

        worksService.updateHits(type,id);//修改点击量
        //必修课和选修课只能通过后台添加，学员作品和教师作品可以通过前端添加
         Object obj = new Object();
        Integer isUser = 1;//用户(0:前台会员或教师上传视频 1:后台管理员上传视频)
        if(type == 0){
            obj = worksService.selectByRcourseUserId(id);//查询后台管理员上传必修课视频
        }else if(type == 1){
            obj = worksService.selectByCcourseUserId(id);//查询后台管理员上传选修课视频
        }else if(type == 2){
            obj = worksService.selectByWorksUserId(id);//查询前台会员或教师上传视频
            isUser = 0;
        }
        modelAndView.addObject("muser",obj);//将上传者信息放入视图
        //1.课程类型(0:必修课 1:选修课 2:学员作品)
        Rcourse rcourse = worksService.selectVidoeByTypeAndId(type,id);//查出课程视频

        modelAndView.addObject("video",rcourse);//将视频信息放入视图
        modelAndView.addObject("id",id);//为视频的id
        modelAndView.addObject("type",type);//0：必修课 1：选修课 2：学员作品
        //上传人角色(0:MUser 1:User)
        modelAndView.addObject("isUser",isUser);//将后台管理员或前台会员与教师标识放入视图
        return modelAndView;//返回视图
    }



    @RequestMapping("commentdeatil")
    public  ModelAndView commentdeatil(HttpServletResponse response,HttpServletRequest request,
                                       Long id,String type,
                                       @RequestParam(value = "page" ,required = false) Integer page){
        ModelAndView modelAndView = new ModelAndView("reception/video/commentdeatil");
        if(page == null || page == 0){
            page = 1;
        }
        CommentVo commentVo = new CommentVo();
        commentVo.setWorksId(id);
        Long workType = Long.valueOf(String.valueOf(type));
        //视频类型(0:学员作品 1:必修课 2:试听课)
        if(workType == 0){
            commentVo.setWorksType(1L);
        }else if(workType == 1){
            commentVo.setWorksType(2L);
        }else if(workType == 2){
            commentVo.setWorksType(0L);
        }
        List<Object> commentList = getRootAndChildMap(commentVo);
        modelAndView.addObject("totalPage",
                (((Map<String,Comment> )commentList.get(0)).size()/10)+1);
        modelAndView.addObject("currentPage",page);
        Map<String,Comment> rootMap = new LinkedHashMap<>();
        int i = 0;
        for(String key:((Map<String,Comment> )(commentList.get(0))).keySet()){
            if(i>=(page-1)*10 && i<=(page)*10){
                Comment comment = ((Map<String,Comment> )(commentList.get(0))).get(key);
                rootMap.put(comment.getUserType()+"-"+comment.getId(),comment);
            }
            i++;
        }
        Map<String ,Object> userVoMap = new LinkedHashMap<>();
        List<Comment> map = commentService.selectList(null);
        for(Comment comment : map){
            Long userId = comment.getUserId();
            int userType = comment.getUserType();
            Object obj = null;
            //用户类型(0:学员 1:教师 2:管理员 )
            if(userType == 0){
                obj = studentService.getBeanById(userId);
            }else if(userType == 1){
                obj = teacherService.getBeanById(userId);
            }else if(userType == 2){
                obj = iUserService.selectById(userId);
            }
            userVoMap.put(userType+"-"+String.valueOf(comment.getId()),obj);
        }
        modelAndView.addObject("rootMap",rootMap);
        modelAndView.addObject("userVoMap",userVoMap);
        modelAndView.addObject("childMap",((Map<String,List<Comment>> )(commentList.get(1))));
        modelAndView.addObject("url","/m/commentdeatil");
        modelAndView.addObject("addworkType",commentVo.getWorksType());
        commentVo.setWorksType(workType);
        modelAndView.addObject("commentVo",commentVo);
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
                    rootMap.put(comments.get(i).getUserType()+"-"+comments.get(i).getId(),comments.get(i));
                    childMap.put(comments.get(i).getUserType()+"-"+comments.get(i).getId(),commentList);
                }

            }
        }
        lists.add(rootMap);
        lists.add(childMap);
        return lists;

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
     * 前台的追加评论
     * @param comment
     */
    @RequestMapping("addComment")
    @ResponseBody
    public Object addComment(Comment comment){
        MUserVo mUserVo = (MUserVo) SecurityUtils.getSubject().getPrincipal();
        comment.setUserId(mUserVo.getId());
        comment.setUserName(mUserVo.getNickname());
        comment.setUserType(((mUserVo.getIsStudent()==1)?0:1));
        comment.setCommentTime(new Date());
        commentService.insertByReception(comment);
        return "{\"message\":\"成功\",\"code\":200}";
    }

    /**
     * 下架(针对学员或教师上架的，管理员上传的没有下架)
     * @param id
     * @return
     */
    @RequestMapping("xiajia")
    @ResponseBody
   public Object xiajia(Long id){
        Works works = worksService.selectById(id);
        if("".equals(works.getGoodsId()) || works.getGoodsId()==null){
            resultMap.put("status", 300);
            resultMap.put("message", "已下架不能再下架");
            return resultMap;
        }
       Boolean canXiaJia = worksService.checkXiaJia(id);
       Map<String,Object> resultMap = new HashMap<>();
        if(canXiaJia){
            worksService.goToXiaJia(id);
            resultMap.put("status", 200);
            resultMap.put("message", "下架成功");
        }else{
            resultMap.put("status", 300);
            resultMap.put("message", "已产生交易,不能下架");
        }
        return resultMap;
   }

    @RequestMapping("shangjia")
    @ResponseBody
    public Object shangjia(Long id,Double goods_price){
        
        Map<String,Object> resultMap = new HashMap<>();

        try{
            Works works = worksService.selectById(id);
            if(!"".equals(works.getGoodsId()) && works.getGoodsId()!=null){
                resultMap.put("status", 300);
                resultMap.put("message", "已上架不能再上架");
                return resultMap;
            }
            Goods goods = new Goods();
            goods.setGoodsName(works.getWorksName());
            MUserVo mUserVo = (MUserVo)SecurityUtils.getSubject().getPrincipal();
            if(mUserVo.getIsStudent() == 1){
                goods.setGoodsType("3");
            }else{
                goods.setGoodsType("4");
            }
            goods.setGoodsUnitPrice(goods_price);
            goods.setUserId(mUserVo.getId());
            goods.setUserName(mUserVo.getNickname());
            goodsService.insertGetId(goods);
            works.setIsGoods(1);
            works.setGoodsId(goods.getId());
            works.setGoodsType(Integer.valueOf(goods.getGoodsType()));
            works.setGoodsPrice(goods_price);
            worksService.updateByShangJia(works);
            resultMap.put("status", 200);
            resultMap.put("message", "上架成功");
        }catch(Exception e){
            resultMap.put("status", 300);
            resultMap.put("message", "上架失败");
            e.printStackTrace();
        }

        return resultMap;
    }


    @RequestMapping("goToGouMai")
    @ResponseBody
    public Object goToGouMai(Long goodsId,Long  discountId){

        Map<String,Object> resultMap = new HashMap<>();
        MUserVo mUserVo = (MUserVo)SecurityUtils.getSubject().getPrincipal();
        try{
            Goods goods = goodsService.selectById(goodsId);
            Discount discount = discountService.selectById(discountId);
            //获得折扣后的价格
            String amountstr = "";
            double amount = 0.0;
            if (discount!=null){
                String gs = discount.getDiscountExpression();
                gs = gs.replaceAll("P",String.valueOf(goods.getGoodsUnitPrice()));
                if (gs!=null){
                    amountstr = JiSuanUtil.computeString(gs);
                    if(Double.valueOf(amountstr) instanceof Double){
                        amount = (double) Math.round(Double.valueOf(amountstr) * 100) / 100;
                    }
                }
            }else{
                amount = goods.getGoodsUnitPrice();
            }

            //新增交易记录，交易明细，等到在订单上点击支付完成后加入到自己作品中
            PurchaseXinxi purchaseXinxi = new PurchaseXinxi();
            purchaseXinxi.setDiscountAmount(amount);
            purchaseXinxi.setPurchaseNum(1);
            purchaseXinxi.setTotalAmount(goods.getGoodsUnitPrice());
            purchaseXinxi.setCustomerPhone(mUserVo.getMobile());
            purchaseXinxi.setCustomerId(mUserVo.getId());
            purchaseXinxi.setCustomerName(mUserVo.getNickname());
            purchaseXinxi.setCustomerType(mUserVo.getIsStudent()==1?0:1);
            if(discount != null){
                purchaseXinxi.setDiscountId(discount.getId());
            }
            purchaseXinxi.setIsPayment(0);
            purchaseXinxi.setPurchaseTime(new Date());
            purchaseXinxiService.addGetId(purchaseXinxi);
            PurchaseMingxi purchaseMingxi = new PurchaseMingxi();
            purchaseMingxi.setGoodsAmount(1);
            purchaseMingxi.setGoodsId(goods.getId());
            purchaseMingxi.setGoodsName(goods.getGoodsName());
            purchaseMingxi.setGoodsTotalPrice(amount);
            purchaseMingxi.setGoodsUnitPrice(goods.getGoodsUnitPrice());
            purchaseMingxi.setPurchaseXinxiId(purchaseXinxi.getId());
            purchaseMingxiService.insert(purchaseMingxi);
            resultMap.put("status", 200);
            resultMap.put("message", "购买成功");
        }catch(Exception e){
            resultMap.put("status", 300);
            resultMap.put("message", "购买失败");
            e.printStackTrace();
        }

        return resultMap;
    }

    /**
     * 前台查询订单
     * @param type ，0:未支付 1:已支付 2:全部
     * @return
     */
    @RequestMapping(value = "getPurchaseXinXi",method = RequestMethod.POST)
    @ResponseBody
    public Object getPurchaseXinXi(Integer type){
        //由于基本上一个订单只有一个视频商品，因此考虑把两个表合在一起形成PurchaseVo
        //还是得加上是哪个人的订单才行
        MUserVo mUserVo = (MUserVo)SecurityUtils.getSubject().getPrincipal();
        Integer userType = mUserVo.getIsStudent()==1?0:1;
        Long id = mUserVo.getId();
        List<PurchaseVo> purchaseVos = purchaseXinxiService.getPurchaseVos(type,id,userType);
        return purchaseVos;
    }

    @RequestMapping(value = "gotoPay",method = RequestMethod.POST)
    @ResponseBody
    public Object gotoPay(Long id){
        Map<String,Object> map = new HashMap<>();
        boolean bo = purchaseXinxiService.gotoPay(id);
        PurchaseXinxi purchaseXinxi = purchaseXinxiService.getBeanById(id);
        List<PurchaseMingxi> purchaseMingxis = purchaseMingxiService.getBeansByPXId(id);
        if(bo){
            map.put("status",200);
            map.put("message","支付成功");
            //新增一条付款记录
            PayRecord payRecord = new PayRecord();
            payRecord.setPaymentTime(new Date());
            payRecord.setPaymentMoney(purchaseXinxi.getDiscountAmount());
            payRecord.setOuttradeno(purchaseXinxi.getOutTradeNo());
            payRecord.setPurchaseXinxiId(id);
            payRecord.setPayType(purchaseXinxi.getPayType());
            payRecord.setGoodsDetail(purchaseMingxis.get(0).getGoodsName());
            payRecordService.insert(payRecord);
        }else{
            map.put("status",300);
            map.put("message","支付失败");
        }
        return map;
    }

    @RequestMapping(value = "worksAdd",method = RequestMethod.POST)
    @ResponseBody
    public Object worksAdd(Works works){
        Map<String,Object> map = new HashMap<>();
        works.setWanToGoods(1);
        works.setHits(0);
        works.setUploadTime(new Date());
        works.setIsGoods(0);
        works.setWorksTypeId(1L);
        MUserVo mUserVo = (MUserVo)SecurityUtils.getSubject().getPrincipal();
        works.setUserName(mUserVo.getNickname());
        works.setUserId(mUserVo.getId());
        works.setUserType((mUserVo.getIsStudent()==1)?0:1);
        boolean bo = worksService.insert(works);
        if(bo){
            map.put("status",200);
            map.put("message","上传成功");
        }else{
            map.put("status",300);
            map.put("message","上传失败");
        }
        return map;
    }

    @RequestMapping(value = "worksEdit",method = RequestMethod.POST)
    @ResponseBody
    public Object worksEdit(Works works){
        Map<String,Object> map = new HashMap<>();
        boolean bo = worksService.updateById(works);
        if(bo){
            map.put("status",200);
            map.put("message","编辑成功");
        }else{
            map.put("status",300);
            map.put("message","编辑失败");
        }
        return map;
    }

    @RequestMapping(value = "worksDel",method = RequestMethod.POST)
    @ResponseBody
    public Object worksDel(Long id){
        Map<String,Object> map = new HashMap<>();
        boolean bo = worksService.deleteById(id);
        if(bo){
            map.put("status",200);
            map.put("message","删除成功");
        }else{
            map.put("status",300);
            map.put("message","删除失败");
        }
        return map;
    }


    @RequestMapping(value = "updatePWD",method = RequestMethod.POST)
    @ResponseBody
    public Object updatePWD(String oldPWD,String newPWD){
        Map<String,Object> map = new HashMap<>();
        MUserVo mUserVo = (MUserVo)SecurityUtils.getSubject().getPrincipal();
        if(!mUserVo.getLoginPwd().equals(DigestUtil.md5Hex(oldPWD))){
            map.put("status",400);
            map.put("message","原始密码不正确，请重新输入！");
            return map;
        }
        mUserVo.setLoginPwd(DigestUtil.md5Hex(newPWD));
        boolean bo = studentService.updatePWD(mUserVo);
        if(bo){
            map.put("status",200);
            map.put("message","修改成功");
            Subject subject = SecurityUtils.getSubject();
            PrincipalCollection principalCollection = subject.getPrincipals();
            String realmName = principalCollection.getRealmNames().iterator().next();
            PrincipalCollection newPrincipalCollection = new SimplePrincipalCollection(mUserVo, realmName);
            //重新加载Principal
            subject.runAs(newPrincipalCollection);

        }else{
            map.put("status",300);
            map.put("message","修改失败");
        }
        return map;
    }

    @RequestMapping(value = "toRegister",method = RequestMethod.POST)
    @ResponseBody
    public Object toRegister(MUserVo mUserVo){
        Map<String,Object> map = new HashMap<>();
        mUserVo.setLoginPwd(DigestUtil.md5Hex(mUserVo.getLoginPwd()));
        boolean check = studentService.checkNickname(mUserVo.getLoginId(),mUserVo.getIsStudent());
        if(check){
            map.put("status",400);
            map.put("message","账号已存在，请输入其他账号");
            return map;
        }
        mUserVo.setCreateTime(new Date());
        mUserVo.setIscheck(0);
        mUserVo.setStatus(1);
        boolean bo = studentService.insertByRLogin(mUserVo);
        if(bo){
            map.put("status",200);
            map.put("message","注册成功");
        }else{
            map.put("status",300);
            map.put("message","注册失败");
        }
        return map;
    }

    private void relogin(){
        //重新登录一次
        boolean isRembered = false;
        if (SecurityUtils.getSubject().isRemembered()){
            isRembered = true;
        }
        try{
            MTokenManager.relogin(MTokenManager.getToken(), isRembered);
        }catch (Exception e){
            MTokenManager.logout();
        }

    }


}
