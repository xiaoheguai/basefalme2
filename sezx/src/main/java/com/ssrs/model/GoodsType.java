package com.ssrs.model;

import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.annotations.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author haha
 * @since 2019-03-04
 */
@Data
@TableName("m_goods_type")
public class GoodsType implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    /**
     * 类别名称
     */
    private String typeName;
    /**
     * 类别描述
     */
    private String typeDescribe;



    @Override
    public String toString() {
        return "GoodsType{" +
        ", id=" + id +
        ", typeName=" + typeName +
        ", typeDescribe=" + typeDescribe +
        "}";
    }
}
