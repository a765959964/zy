package com.ruoyi.zy.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 代理信息管理对象 b_agent
 * 
 * @author zy
 * @date 2020-02-03
 */
public class Agent extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 代理名称 */
    @Excel(name = "代理名称")
    private String agentName;

    /** 代理号 */
    @Excel(name = "代理号")
    private String agentCode;

    /** 状态 Y开启 N关闭 */
    @Excel(name = "状态 Y开启 N关闭")
    private String status;

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
    public void setAgentName(String agentName)
    {
        this.agentName = agentName;
    }

    public String getAgentName()
    {
        return agentName;
    }
    public void setAgentCode(String agentCode) 
    {
        this.agentCode = agentCode;
    }

    public String getAgentCode() 
    {
        return agentCode;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
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
            .append("agentName", getAgentName())
            .append("agentCode", getAgentCode())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("createUser", getCreateUser())
            .toString();
    }
}
