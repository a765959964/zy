package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 商户用户信息对象 b_merchant_user
 * 
 * @author zy
 * @date 2019-11-20
 */
public class MerchantUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 商户号 */
    @Excel(name = "商户号")
    private String merchantNo;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;

    /** 密码 */
    @Excel(name = "密码")
    private String password;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String phoneNumber;

    /** 邮箱 */
    @Excel(name = "邮箱")
    private String email;

    /** 级别 */
    @Excel(name = "级别")
    private Long level;

    /** 登录次数 */
    @Excel(name = "登录次数")
    private Long loginTimes;

    /** 上次登录时间 */
    @Excel(name = "上次登录时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date lastLoginTime;

    /** 上次登录地址 */
    @Excel(name = "上次登录地址")
    private String lastLoginIp;

    /** 本次登录时间 */
    @Excel(name = "本次登录时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date thisLoginTime;

    /** 本次登录地址 */
    @Excel(name = "本次登录地址")
    private String thisLoginIp;

    /** 创建人 */
    @Excel(name = "创建人")
    private String createUser;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setMerchantNo(String merchantNo) 
    {
        this.merchantNo = merchantNo;
    }

    public String getMerchantNo() 
    {
        return merchantNo;
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
    public void setPhoneNumber(String phoneNumber) 
    {
        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber() 
    {
        return phoneNumber;
    }
    public void setEmail(String email) 
    {
        this.email = email;
    }

    public String getEmail() 
    {
        return email;
    }
    public void setLevel(Long level) 
    {
        this.level = level;
    }

    public Long getLevel() 
    {
        return level;
    }
    public void setLoginTimes(Long loginTimes) 
    {
        this.loginTimes = loginTimes;
    }

    public Long getLoginTimes() 
    {
        return loginTimes;
    }
    public void setLastLoginTime(Date lastLoginTime) 
    {
        this.lastLoginTime = lastLoginTime;
    }

    public Date getLastLoginTime() 
    {
        return lastLoginTime;
    }
    public void setLastLoginIp(String lastLoginIp) 
    {
        this.lastLoginIp = lastLoginIp;
    }

    public String getLastLoginIp() 
    {
        return lastLoginIp;
    }
    public void setThisLoginTime(Date thisLoginTime) 
    {
        this.thisLoginTime = thisLoginTime;
    }

    public Date getThisLoginTime() 
    {
        return thisLoginTime;
    }
    public void setThisLoginIp(String thisLoginIp) 
    {
        this.thisLoginIp = thisLoginIp;
    }

    public String getThisLoginIp() 
    {
        return thisLoginIp;
    }
    public void setCreateUser(String createUser) 
    {
        this.createUser = createUser;
    }

    public String getCreateUser() 
    {
        return createUser;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("merchantNo", getMerchantNo())
            .append("username", getUsername())
            .append("password", getPassword())
            .append("phoneNumber", getPhoneNumber())
            .append("email", getEmail())
            .append("level", getLevel())
            .append("loginTimes", getLoginTimes())
            .append("lastLoginTime", getLastLoginTime())
            .append("lastLoginIp", getLastLoginIp())
            .append("thisLoginTime", getThisLoginTime())
            .append("thisLoginIp", getThisLoginIp())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .toString();
    }
}
