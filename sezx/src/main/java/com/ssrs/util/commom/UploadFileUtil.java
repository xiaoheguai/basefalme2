package com.ssrs.util.commom;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UploadFileUtil {

    /**
     *
     * @param file
     * @param path
     * @return
     */
    public static String getFileUrl(MultipartFile file,String path){
        String xiangduipath = "";
    try{
        String filepath = UtilPath.getRootPath()+"/"+path+"/";
        String newName = uploadFile(file,filepath);
        xiangduipath = "/"+path+"/"+newName;
    }catch (Exception e){
        e.printStackTrace();
    }
            return xiangduipath;
}


    private static String  uploadFile(MultipartFile file, String path) throws Exception{
        String name = file.getOriginalFilename();//上传文件的真实名称
        //String suffixName = name.substring(name.lastIndexOf("."));//获取后缀名
        //String hash = Integer.toHexString(new Random().nextInt());//自定义随机数(字母+数字)作为文件名
        //String filename = hash + suffixName;
        SimpleDateFormat sf = new SimpleDateFormat("yyyyMMddHHmmss");
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
