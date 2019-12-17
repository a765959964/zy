package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 系统参数表对象 s_system_parameter
 * 
 * @author ruoyi
 * @date 2019-12-12
 */
public class SSystemParameter extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 类别 */
    @Excel(name = "类别")
    private String category;

    /** 项编码 */
    @Excel(name = "项编码")
    private String code;

    /** 项内容 */
    @Excel(name = "项内容")
    private String value;

    /** 描述 */
    @Excel(name = "描述")
    private String description;

    /** 是否开启使用 */
    @Excel(name = "是否开启使用")
    private String flag;

    /** 创建人 */
    @Excel(name = "创建人")
    private String createUser;

    /** 修改人 */
    @Excel(name = "修改人")
    private String updateUser;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setCategory(String category) 
    {
        this.category = category;
    }

    public String getCategory() 
    {
        return category;
    }
    public void setCode(String code) 
    {
        this.code = code;
    }

    public String getCode() 
    {
        return code;
    }
    public void setValue(String value) 
    {
        this.value = value;
    }

    public String getValue() 
    {
        return value;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription() 
    {
        return description;
    }
    public void setFlag(String flag) 
    {
        this.flag = flag;
    }

    public String getFlag() 
    {
        return flag;
    }
    public void setCreateUser(String createUser) 
    {
        this.createUser = createUser;
    }

    public String getCreateUser() 
    {
        return createUser;
    }
    public void setUpdateUser(String updateUser) 
    {
        this.updateUser = updateUser;
    }

    public String getUpdateUser() 
    {
        return updateUser;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("category", getCategory())
            .append("code", getCode())
            .append("value", getValue())
            .append("description", getDescription())
            .append("flag", getFlag())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .append("updateTime", getUpdateTime())
            .append("updateUser", getUpdateUser())
            .toString();
    }
}
