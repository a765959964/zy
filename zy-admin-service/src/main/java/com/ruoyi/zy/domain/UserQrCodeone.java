package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 收款码管理对象 b_user_qr_codeone
 * 
 * @author zy
 * @date 2020-01-08
 */
public class UserQrCodeone extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;

    /** 收款二维码类型 */
    @Excel(name = "收款二维码类型")
    private String receiptType;

    /** 收款二维码地址 */
    @Excel(name = "收款二维码地址")
    private String receiptQrcodeUrl;

    /** 二维码code */
    @Excel(name = "二维码code")
    private String receiptQrcodeCode;

    /** 当前登录的用户名 */
    @Excel(name = "当前登录的用户名")
    private String agent;

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
    public void setReceiptType(String receiptType) 
    {
        this.receiptType = receiptType;
    }

    public String getReceiptType() 
    {
        return receiptType;
    }
    public void setReceiptQrcodeUrl(String receiptQrcodeUrl) 
    {
        this.receiptQrcodeUrl = receiptQrcodeUrl;
    }

    public String getReceiptQrcodeUrl() 
    {
        return receiptQrcodeUrl;
    }
    public void setReceiptQrcodeCode(String receiptQrcodeCode) 
    {
        this.receiptQrcodeCode = receiptQrcodeCode;
    }

    public String getReceiptQrcodeCode() 
    {
        return receiptQrcodeCode;
    }
    public void setAgent(String agent) 
    {
        this.agent = agent;
    }

    public String getAgent() 
    {
        return agent;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("username", getUsername())
            .append("receiptType", getReceiptType())
            .append("receiptQrcodeUrl", getReceiptQrcodeUrl())
            .append("receiptQrcodeCode", getReceiptQrcodeCode())
            .append("agent", getAgent())
            .append("createTime", getCreateTime())
            .toString();
    }
}
