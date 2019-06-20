package com.ssrs.controller.admin;


import com.ssrs.model.Goods;
import com.ssrs.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author haha
 * @since 2019-03-02
 */
@Controller
@RequestMapping("/goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @RequestMapping(value = "getGoodsById",method = RequestMethod.POST)
    @ResponseBody
    public Object getGoodsById(Long id){
        Map<String,Object> map = new HashMap<>(16);
        Goods goods = goodsService.selectById(id);
        if(goods!=null){
            map.put("message","成功获取数据");
            map.put("status","200");
            map.put("goodunitprice",goods.getGoodsUnitPrice());
        }else{
            map.put("message","获取商品信息失败");
            map.put("status","300");
        }
        return  map;
    }
}

