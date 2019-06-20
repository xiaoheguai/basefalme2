package com.ssrs.controller.admin;


import com.baomidou.mybatisplus.plugins.Page;
import com.ssrs.core.manager.PageManager;
import com.ssrs.model.Download;
import com.ssrs.service.DownloadService;
import com.ssrs.util.commom.APPUtil;
import com.ssrs.util.commom.UploadFileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author haha
 * @since 2019-03-06
 */
@Controller
@RequestMapping("/download")
public class DownloadController {

    @Autowired
    private DownloadService downloadService;

    @RequestMapping(value = "list",method = RequestMethod.GET)
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("admin/download/list");
        return mv;
    }

    /**
     * 得到分页数据
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "getdownloadPage",method = RequestMethod.POST)
    @ResponseBody
    public Object getPermissionPage(int page ,int limit){
        Page<Download> permissionPage = downloadService.selectPage(new Page<>(page, limit));
        Map<String, Object> map = PageManager.buildPage(permissionPage);
        return map;
    }

    /**
     * 跳转到添加页面
     * @return
     */
    @RequestMapping(value = "goAdd",method = RequestMethod.GET)
    public ModelAndView goAdd(){
        ModelAndView modelAndView = new ModelAndView("/admin/download/add");
        List<Download> downloads = downloadService.selectList(null);
        //List<GoodsType> goodsTypes = goodsTypeService.selectList(null);
        modelAndView.addObject("downloads",downloads);
       // modelAndView.addObject("goodsTypes",goodsTypes);
        return modelAndView;
    }

    /**
     * 添加折扣方法
     * @param download
     * @return
     */
    @RequestMapping(value = "add",method = RequestMethod.POST)
    @ResponseBody
    public Object add(Download download){
        //Download download = new Download();
        download.setUploadTime(new Date());
       // download.setFileDescribe(fileDescribe);
       // download.setFileName(fileName);
        //String path = UploadFileUtil.getFileUrl(file,"upload");
        //download.setFileUrl(path);
        Boolean bo = downloadService.insert(download);
        return bo? APPUtil.resultMapType(APPUtil.INSERT_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.INSERT_ERROR_TYPE);
    }


    /**
     * 跳转到编辑页面
     * @param id 折扣id
     * @return
     */
    @RequestMapping(value = "goUpdate",method = RequestMethod.GET)
    public ModelAndView goUpdate(Long id){
        ModelAndView modelAndView = new ModelAndView("/admin/download/update");
       // List<GoodsType>  goodsTypes = goodsTypeService.selectList(null );
        Download download = downloadService.selectById(id);
        modelAndView.addObject("download",download);
        //modelAndView.addObject("goodsTypes",goodsTypes);
        return modelAndView;
    }

    /**
     * 编辑方法
     * @param download
     * @return
     */
    @RequestMapping(value = "update",method = RequestMethod.POST)
    @ResponseBody
    public Object update(Download download){
        boolean b = downloadService.updateById(download);
        return b?APPUtil.resultMapType(APPUtil.UPDATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.UPDATE_ERROR_TYPE);
    }

    /**
     * 权限删除方法
     * @return
     */
    @RequestMapping(value = "del",method = RequestMethod.POST)
    @ResponseBody
    public Object del(Long id){
        boolean b = downloadService.deleteById(id);
        return b?APPUtil.resultMapType(APPUtil.DELEATE_SUCCESS_TYPE):APPUtil.resultMapType(APPUtil.DELEATE_ERROR_TYPE);
    }
}

