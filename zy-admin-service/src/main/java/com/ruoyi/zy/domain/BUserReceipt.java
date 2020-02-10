package com.ruoyi.zy.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 收款次数对象 b_user_receipt
 * 
 * @author ruoyi
 * @date 2019-12-17
 */
public class BUserReceipt extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;
    
    /** 所属代理 */
    @Excel(name = "所属代理")
    private String agent;

    /** 微信收款次数 */
    @Excel(name = "微信收款次数")
    private int wechatReceiptTimes;

    /** 支付宝收款次数 */
    @Excel(name = "支付宝收款次数")
    private int alipayReceiptTimes;

    @Excel(name = "Y开启 N关闭")
    private String status;

    @Excel(name = "修改时间")
    private Date updateTime;

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
    public void setWechatReceiptTimes(int wechatReceiptTimes) 
    {
        this.wechatReceiptTimes = wechatReceiptTimes;
    }

    public int getWechatReceiptTimes() 
    {
        return wechatReceiptTimes;
    }
    public void setAlipayReceiptTimes(int alipayReceiptTimes) 
    {
        this.alipayReceiptTimes = alipayReceiptTimes;
    }

    public int getAlipayReceiptTimes() 
    {
        return alipayReceiptTimes;
    }
    
    public String getAgent() {
		return agent;
	}

	public void setAgent(String agent) {
		this.agent = agent;
	}

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("username", getUsername())
            .append("wechatReceiptTimes", getWechatReceiptTimes())
            .append("alipayReceiptTimes", getAlipayReceiptTimes())
            .append("updateTime", getUpdateTime())
            .append("agent", getAgent())
            .append("status", getStatus())
            .append("agent", getUpdateTime())
            .toString();
    }
}
