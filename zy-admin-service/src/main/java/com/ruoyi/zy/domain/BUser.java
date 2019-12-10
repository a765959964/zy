package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 用户管理对象 b_user
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
public class BUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;

    /** 密码 */
    @Excel(name = "密码")
    private String password;

    /** 推荐人账号 */
    @Excel(name = "推荐人账号")
    private String agent;

    /** 手机号码 */
    @Excel(name = "手机号码")
    private String phoneNumber;

    /** 佣金比例 */
    @Excel(name = "佣金比例")
    private Double commissionRate;

    /** 级别 */
    @Excel(name = "级别")
    private Long level;

    /** 申请次数 */
    @Excel(name = "申请次数")
    private Long frequency;

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

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 注册时间 */
    @Excel(name = "注册时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date registerTime;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
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
    public void setAgent(String agent) 
    {
        this.agent = agent;
    }

    public String getAgent() 
    {
        return agent;
    }
    public void setPhoneNumber(String phoneNumber) 
    {
        this.phoneNumber = phoneNumber;
    }

    public String getPhoneNumber() 
    {
        return phoneNumber;
    }
    public void setCommissionRate(Double commissionRate) 
    {
        this.commissionRate = commissionRate;
    }

    public Double getCommissionRate() 
    {
        return commissionRate;
    }
    public void setLevel(Long level) 
    {
        this.level = level;
    }

    public Long getLevel() 
    {
        return level;
    }
    public void setFrequency(Long frequency) 
    {
        this.frequency = frequency;
    }

    public Long getFrequency() 
    {
        return frequency;
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
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setRegisterTime(Date registerTime) 
    {
        this.registerTime = registerTime;
    }

    public Date getRegisterTime() 
    {
        return registerTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("username", getUsername())
            .append("password", getPassword())
            .append("agent", getAgent())
            .append("phoneNumber", getPhoneNumber())
            .append("commissionRate", getCommissionRate())
            .append("level", getLevel())
            .append("frequency", getFrequency())
            .append("loginTimes", getLoginTimes())
            .append("lastLoginTime", getLastLoginTime())
            .append("lastLoginIp", getLastLoginIp())
            .append("thisLoginTime", getThisLoginTime())
            .append("thisLoginIp", getThisLoginIp())
            .append("status", getStatus())
            .append("registerTime", getRegisterTime())
            .toString();
    }
}
