package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

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

    /** 微信收款次数 */
    @Excel(name = "微信收款次数")
    private Long wechatReceiptTimes;

    /** 支付宝收款次数 */
    @Excel(name = "支付宝收款次数")
    private Long alipayReceiptTimes;

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
    public void setWechatReceiptTimes(Long wechatReceiptTimes) 
    {
        this.wechatReceiptTimes = wechatReceiptTimes;
    }

    public Long getWechatReceiptTimes() 
    {
        return wechatReceiptTimes;
    }
    public void setAlipayReceiptTimes(Long alipayReceiptTimes) 
    {
        this.alipayReceiptTimes = alipayReceiptTimes;
    }

    public Long getAlipayReceiptTimes() 
    {
        return alipayReceiptTimes;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("username", getUsername())
            .append("wechatReceiptTimes", getWechatReceiptTimes())
            .append("alipayReceiptTimes", getAlipayReceiptTimes())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
