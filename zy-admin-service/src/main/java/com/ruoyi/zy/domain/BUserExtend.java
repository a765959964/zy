package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 收款码管理对象 b_user_extend
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
public class BUserExtend extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;

    /** 微信收款码审核标志 */
    @Excel(name = "微信收款码审核标志")
    private String wechatFlag;

    /** 微信收款码驳回原因 */
    @Excel(name = "微信收款码驳回原因")
    private String wechatReason;

    /** 支付宝收款码审核标志 */
    @Excel(name = "支付宝收款码审核标志")
    private String alipayFlag;

    /** 支付宝收款码驳回原因 */
    @Excel(name = "支付宝收款码驳回原因")
    private String alipayReason;

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
    public void setWechatFlag(String wechatFlag) 
    {
        this.wechatFlag = wechatFlag;
    }

    public String getWechatFlag() 
    {
        return wechatFlag;
    }
    public void setWechatReason(String wechatReason) 
    {
        this.wechatReason = wechatReason;
    }

    public String getWechatReason() 
    {
        return wechatReason;
    }
    public void setAlipayFlag(String alipayFlag) 
    {
        this.alipayFlag = alipayFlag;
    }

    public String getAlipayFlag() 
    {
        return alipayFlag;
    }
    public void setAlipayReason(String alipayReason) 
    {
        this.alipayReason = alipayReason;
    }

    public String getAlipayReason() 
    {
        return alipayReason;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("username", getUsername())
            .append("wechatFlag", getWechatFlag())
            .append("wechatReason", getWechatReason())
            .append("alipayFlag", getAlipayFlag())
            .append("alipayReason", getAlipayReason())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
