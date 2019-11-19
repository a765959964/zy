package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 门店对象 t_kitchen
 * 
 * @author zy
 * @date 2019-11-19
 */
public class TKitchen extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 序号 */
    private Long id;

    /** 门店id */
    @Excel(name = "门店id")
    private Long kitchenId;

    /** 门店管理员账号 */
    @Excel(name = "门店管理员账号")
    private String username;

    /** 管理员密码 */
    @Excel(name = "管理员密码")
    private String password;

    /** 门店名称 */
    @Excel(name = "门店名称")
    private String name;

    /** 地址 */
    @Excel(name = "地址")
    private String address;

    /** 联系人 */
    @Excel(name = "联系人")
    private String person;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 用户token */
    @Excel(name = "用户token")
    private String userToken;

    /** 是否 禁用0 否 1是 */
    @Excel(name = "是否 禁用 0 否 1是")
    private Long status;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setKitchenId(Long kitchenId) 
    {
        this.kitchenId = kitchenId;
    }

    public Long getKitchenId() 
    {
        return kitchenId;
    }
    public void setUsername(String username) 
    {
        this.username = username;
    }

    public String getUsername() 
    {
        return username;
    }
    public void setPassword(String password) 
    {
        this.password = password;
    }

    public String getPassword() 
    {
        return password;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setAddress(String address) 
    {
        this.address = address;
    }

    public String getAddress() 
    {
        return address;
    }
    public void setPerson(String person) 
    {
        this.person = person;
    }

    public String getPerson() 
    {
        return person;
    }
    public void setPhone(String phone) 
    {
        this.phone = phone;
    }

    public String getPhone() 
    {
        return phone;
    }
    public void setUserToken(String userToken) 
    {
        this.userToken = userToken;
    }

    public String getUserToken() 
    {
        return userToken;
    }
    public void setStatus(Long status) 
    {
        this.status = status;
    }

    public Long getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("kitchenId", getKitchenId())
            .append("username", getUsername())
            .append("password", getPassword())
            .append("name", getName())
            .append("address", getAddress())
            .append("person", getPerson())
            .append("phone", getPhone())
            .append("createTime", getCreateTime())
            .append("userToken", getUserToken())
            .append("status", getStatus())
            .toString();
    }
}
