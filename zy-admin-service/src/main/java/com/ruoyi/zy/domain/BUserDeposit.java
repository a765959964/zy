package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 缴纳保证金记录对象 b_user_deposit
 * 
 * @author zf
 * @date 2019-11-28
 */
public class BUserDeposit extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 用户名 */
    @Excel(name = "用户名")
    private String username;

    @Excel(name = "所属代理")
    private String agent;

    /** 保证金金额 */
    @Excel(name = "保证金金额")
    private Long earnestMoney;

    /** 保证金图片地址 */
    @Excel(name = "保证金图片地址")
    private String earnestMoneyUrl;

    /** 收款二维码类型 */
    @Excel(name = "收款二维码类型")
    private String receiptType;

    /** 累计收款金额 */
    @Excel(name = "累计收款金额")
    private Long receiptAmount;

    /** 累计佣金金额 */
    @Excel(name = "累计佣金金额")
    private Double receiptCommissionAmount;

    /** 佣金提取标志 */
    @Excel(name = "佣金提取标志")
    private String withdrawalFlag;

    /** 佣金提取时间 */
    @Excel(name = "佣金提取时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date withdrawalTime;

    /** 佣金确认时间 */
    @Excel(name = "佣金确认时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date confirmTime;

    /** 审核状态 */
    @Excel(name = "审核状态")
    private String reviewStatus;

    /** 驳回原因 */
    @Excel(name = "驳回原因")
    private String reason;

    /** 审核时间 */
    @Excel(name = "审核时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date reviewTime;

    /** 是否开启使用 */
    @Excel(name = "是否开启使用")
    private String flag;

    /** 订单状态 */
    @Excel(name = "订单状态")
    private String status;

    /** 补发金额 */
    @Excel(name = "补发金额")
    private Double spreadAmount;

    /** 收款银行编号 */
    @Excel(name = "收款银行编号")
    private Long receiptBankId;

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
    public void setEarnestMoney(Long earnestMoney) 
    {
        this.earnestMoney = earnestMoney;
    }

    public Long getEarnestMoney() 
    {
        return earnestMoney;
    }
    public void setEarnestMoneyUrl(String earnestMoneyUrl) 
    {
        this.earnestMoneyUrl = earnestMoneyUrl;
    }

    public String getEarnestMoneyUrl() 
    {
        return earnestMoneyUrl;
    }
    public void setReceiptType(String receiptType) 
    {
        this.receiptType = receiptType;
    }

    public String getReceiptType() 
    {
        return receiptType;
    }
    public void setReceiptAmount(Long receiptAmount) 
    {
        this.receiptAmount = receiptAmount;
    }

    public Long getReceiptAmount() 
    {
        return receiptAmount;
    }
    public void setReceiptCommissionAmount(Double receiptCommissionAmount) 
    {
        this.receiptCommissionAmount = receiptCommissionAmount;
    }

    public Double getReceiptCommissionAmount() 
    {
        return receiptCommissionAmount;
    }
    public void setWithdrawalFlag(String withdrawalFlag) 
    {
        this.withdrawalFlag = withdrawalFlag;
    }

    public String getWithdrawalFlag() 
    {
        return withdrawalFlag;
    }
    public void setWithdrawalTime(Date withdrawalTime) 
    {
        this.withdrawalTime = withdrawalTime;
    }

    public Date getWithdrawalTime() 
    {
        return withdrawalTime;
    }
    public void setConfirmTime(Date confirmTime) 
    {
        this.confirmTime = confirmTime;
    }

    public Date getConfirmTime() 
    {
        return confirmTime;
    }
    public void setReviewStatus(String reviewStatus) 
    {
        this.reviewStatus = reviewStatus;
    }

    public String getReviewStatus() 
    {
        return reviewStatus;
    }
    public void setReason(String reason) 
    {
        this.reason = reason;
    }

    public String getReason() 
    {
        return reason;
    }
    public void setReviewTime(Date reviewTime) 
    {
        this.reviewTime = reviewTime;
    }

    public Date getReviewTime() 
    {
        return reviewTime;
    }
    public void setFlag(String flag) 
    {
        this.flag = flag;
    }

    public String getFlag() 
    {
        return flag;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setSpreadAmount(Double spreadAmount) 
    {
        this.spreadAmount = spreadAmount;
    }

    public Double getSpreadAmount() 
    {
        return spreadAmount;
    }
    public void setReceiptBankId(Long receiptBankId) 
    {
        this.receiptBankId = receiptBankId;
    }

    public Long getReceiptBankId() 
    {
        return receiptBankId;
    }

    public String getAgent() {
        return agent;
    }

    public void setAgent(String agent) {
        this.agent = agent;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("username", getUsername())
            .append("agent",getAgent())
            .append("earnestMoney", getEarnestMoney())
            .append("earnestMoneyUrl", getEarnestMoneyUrl())
            .append("receiptType", getReceiptType())
            .append("receiptAmount", getReceiptAmount())
            .append("receiptCommissionAmount", getReceiptCommissionAmount())
            .append("withdrawalFlag", getWithdrawalFlag())
            .append("withdrawalTime", getWithdrawalTime())
            .append("confirmTime", getConfirmTime())
            .append("reviewStatus", getReviewStatus())
            .append("reason", getReason())
            .append("reviewTime", getReviewTime())
            .append("flag", getFlag())
            .append("status", getStatus())
            .append("spreadAmount", getSpreadAmount())
            .append("remark", getRemark())
            .append("receiptBankId", getReceiptBankId())
            .append("createTime", getCreateTime())
            .toString();
    }
}
