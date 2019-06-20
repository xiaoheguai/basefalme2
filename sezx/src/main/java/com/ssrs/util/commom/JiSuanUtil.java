package com.ssrs.util.commom;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.regex.Pattern;


public class JiSuanUtil {

    /**
     * 格式化数字
     * @param obj 数字对象
     * @param format 格式化字符串
     * @return
     */
    public static String formatNumber(Object obj, String format) {
        if (obj == null)
            return "";

        String s = String.valueOf(obj);
        if (format == null || "".equals(format.trim())) {
            format = "#.00";
        }
        try {
            if (obj instanceof Double || obj instanceof Float) {
                if (format.contains("%")) {
                    NumberFormat numberFormat = NumberFormat.getPercentInstance();
                    s = numberFormat.format(obj);
                } else {
                    DecimalFormat decimalFormat = new DecimalFormat(format);
                    s = decimalFormat.format(obj);
                }
            } else {
                NumberFormat numberFormat = NumberFormat.getInstance();
                s = numberFormat.format(obj);
            }
        } catch (Exception e) {
        }
        return s;
    }

    /**
     * 计算字符串四则运算表达式
     * @param string
     * @return
     */
    public static String computeString(String string) {
        string = string.replaceAll("\\s+","");
        String regexCheck = "[\\(\\)\\d\\+\\-\\*/\\.]*";// 是否是合法的表达式

        if (!Pattern.matches(regexCheck, string))
            return string;

        try {
            if(string.contains("(") && string.contains(")")){
                if(string.replace("(", "").length() ==
                        string.replace(")", "").length()) {
                    string = computeStringBracket(string);
                }else{
                    return string;
                }

            }else if(!string.contains("(") && !string.contains(")")){
                string = computeStirngNoBracket(string);
            }else{
                return string;
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return e.getMessage();
        }catch (Exception e1){
            e1.printStackTrace();
            return e1.getMessage();
        }
        return string;
    }

    /**
     * 先将优先级最高的括号去掉
     * @param string
     * @return
     */
    private static String computeStringBracket(String string){
        int qiankou = 0;
        int houkou = 0;
        String qianstr = "";
        String houstr = "";
        houkou = string.indexOf(")");
        if(houkou==-1){
            return string;
        }
        qiankou = string.substring(0,houkou).lastIndexOf("(");
        if(houkou - qiankou == 1){
            return "";
        }
        String str = computeStirngNoBracket(string.substring(qiankou+1,houkou));
        if(qiankou == 0){
            qianstr = "";
        }else{
            qianstr = string.substring(0,qiankou);
        }
        if (houkou == string.length()-1){
            houstr = "";
        }else{
            houstr = string.substring(houkou+1);
        }
        return computeStringBracket(qianstr+str+houstr);
    }
    /**
     * 计算不包含括号的表达式
     * @param string
     * @return
     */
    private static String computeStirngNoBracket(String string) {
       // string = string.replaceAll("(^\\()|(\\)$)", "");
        //String regexMultiAndDivision = "[\\d\\.] (\\*|\\/)[\\d\\.] ";
        //String regexAdditionAndSubtraction = "(^\\-)?[\\d\\.] (\\ |\\-)[\\d\\.] ";
       // String regexIsDouble = "[0-9]*(.[0-9]+)?";
        //解析乘除法
        String [] strs = string.split("[*|/]");

        if(strs.length==1){
            //加减法
            return doAdditionAndSubtraction(strs[0]);
        }else{
            return doAdditionAndSubtraction(doMultiAndDivision(string,strs));
        }
    }

    /**
     * 执行乘除法
     * @param str
     * @param strs1
     * @return
     */
    private static String doMultiAndDivision(String str ,String[] strs1) {
        int temp = 0;
        String []strs2 = new String[strs1.length];
        for (int i = 0; i < strs1.length; i++)
        {
            strs2[i] = strs1[i];
        }

        for (int i = 0;i<strs1.length-1;i++){
            temp += strs2[i].length();
            strs1[i+1] = getZhanHeChu(strs1[i],strs1[i+1],str.substring(temp+i,temp+i+1));
        }
        return strs1[strs1.length-1];


    }

    /**
     * 拼接中间部分
     * @param leftstr
     * @param rightstr
     * @param fuhao
     * @return
     */
    private static String getZhanHeChu(String leftstr,String rightstr,String fuhao){
        BigDecimal left = new BigDecimal("0");
        BigDecimal right = new BigDecimal("0");
        int leftindexof = 0;
        int rightindexof = 0;
        if(leftstr.contains("+") || leftstr.contains("-")){
            int jindexof = leftstr.lastIndexOf("+");
            int jnindexof = leftstr.lastIndexOf("-");
            if (jindexof > jnindexof){
                leftindexof = jindexof;
            }else{
                leftindexof = jnindexof;
            }
            left = new BigDecimal(leftstr.substring(leftstr.indexOf(leftindexof)+1));
        }else{
            left= new BigDecimal(leftstr);
        }
        if(rightstr.contains("+") || rightstr.contains("-")){
            int jindexof = rightstr.lastIndexOf("+");
            int jnindexof = rightstr.lastIndexOf("-");
            if (jindexof > jnindexof){
                rightindexof = jindexof;
            }else{
                rightindexof = jnindexof;
            }
            right = new BigDecimal(rightstr.substring(0,rightstr.indexOf(rightindexof)));
        }else{
            right= new BigDecimal(rightstr);
        }
        if(leftindexof == 0){
            leftstr = "";
        }else{
            leftstr = leftstr.substring(0,leftindexof+1);
        }
        if(rightindexof == 0){
            rightstr = "";
        }else{
            rightstr = leftstr.substring(leftindexof+1);
        }
        String middel = "";
        if("*".equals(fuhao)){
            middel = left.multiply(right).setScale(4).toString();
        }else{
            middel = left.divide(right).setScale(4).toString();
        }
        return (leftstr+middel+rightstr).replaceAll("\\s+","");
    }

    /**
     * 执行加减法
     * @param string
     * @return
     */
    private static String doAdditionAndSubtraction(String string) {
        double d = 0;
        double d1 = 0;
        double d2 = 0;
        int temp = -1;
        String []strs = string.split("[+|-]");
        if(strs.length>1){
            d = Double.valueOf(strs[0]);
            temp += strs[0].length();
            for(int k =1;k<strs.length;k++){
                d1 = Double.valueOf(strs[k]);
                if ("+".equals(string.substring(temp+k,temp+k+1))){
                    d +=d1;
                }else if("-".equals(string.substring(temp+k,temp+k+1))){
                    d -=d1;
                }
                temp += strs[k].length();
            }
        }else {
            return string;
        }
        return String.valueOf(d);
    }

    /**
     * 执行负数运算
     * @param string
     * @return
     */
    private static String doNegativeOperation(String string) {
        String temp = string.substring(1);
        if (temp.contains(" ")) {
            temp = temp.replace(" ", "-");
        } else {
            temp = temp.replace("-", " ");
        }
        temp = doAdditionAndSubtraction(temp);
        if (temp.startsWith("-")) {
            temp = temp.substring(1);
        } else {
            temp = "-"+temp;
        }
        return temp;
    }

}

