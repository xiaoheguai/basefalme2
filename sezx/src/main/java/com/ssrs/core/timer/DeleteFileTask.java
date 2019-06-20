package com.ssrs.core.timer;

import com.ssrs.util.commom.LoggerUtils;

import java.io.File;

/**
 * 定时删除D:\apps\sezx\logs1目录下的所有文件
 */
public class DeleteFileTask {

   private String filePath = "D:\\apps\\sezx\\logs1";
   private boolean deleteDir(File file){
        if(file.exists()){
            if(file.isDirectory()){
                String [] childrens = file.list();
                for(String str : childrens){
                    if(!deleteDir(new File(file,str))){
                        return false;
                    }
                }
            }
            boolean boo = file.delete();
            return boo?true:false;
        }else{
            return false;
        }
    }
   public void delete(){
       File files = new File(filePath);
       LoggerUtils.debug(getClass(),"开始删除"+filePath);
       String [] childrens = files.list();
       for(String str : childrens){
           File file = new File(files,str);
           if(deleteDir(file)){
               LoggerUtils.error(getClass(),"删除成功"+filePath+File.separator+str);
           }else{
               LoggerUtils.error(getClass(),"删除失败"+filePath+File.separator+str);
           }
       }
   }
}
