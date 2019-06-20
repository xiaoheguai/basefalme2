package com.ssrs.controller;

import com.ssrs.util.commom.UploadFileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping(value = "upload")
public class UploadController  {
        @RequestMapping(value = "add",method = RequestMethod.POST)
        @ResponseBody
        public Object upload(MultipartFile file, HttpServletRequest request){
            Map<String, Object> result = new HashMap<>(16);

            try{
                String path = UploadFileUtil.getFileUrl(file,"upload");
                result.put("status",0);
                result.put("path",path);
            }catch (Exception e){
                result.put("status",1);
                e.printStackTrace();
            }
            return result;
        }


        public String  uploadFile(MultipartFile file,String path) throws Exception{
            String name = file.getOriginalFilename();//上传文件的真实名称
            //String suffixName = name.substring(name.lastIndexOf("."));//获取后缀名
            //String hash = Integer.toHexString(new Random().nextInt());//自定义随机数(字母+数字)作为文件名
            //String filename = hash + suffixName;
            SimpleDateFormat sf = new SimpleDateFormat("yyMMddHHmm");
            String dateName = sf.format(new Date())+(int)(Math.random() * 100);
            String filename = dateName+name;
            File tempFile  = new File(path,filename);
            if(!tempFile.getParentFile().exists()){
                tempFile.getParentFile().mkdir();
            }
            if(tempFile.exists()){
                tempFile.delete();
            }
            tempFile.createNewFile();
            file.transferTo(tempFile);
            return filename;
    }
}
