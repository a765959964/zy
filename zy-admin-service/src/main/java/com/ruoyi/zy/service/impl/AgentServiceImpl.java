package com.ruoyi.zy.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.zy.domain.Agent;
import com.ruoyi.zy.mapper.AgentMapper;
import com.ruoyi.zy.service.IAgentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 代理信息管理Service业务层处理
 * 
 * @author zy
 * @date 2020-02-03
 */
@Service
public class AgentServiceImpl implements IAgentService 
{
    @Autowired
    private AgentMapper agentMapper;

    /**
     * 查询代理信息管理
     * 
     * @param id 代理信息管理ID
     * @return 代理信息管理
     */
    @Override
    public Agent selectAgentById(Long id)
    {
        return agentMapper.selectAgentById(id);
    }

    /**
     * 查询代理信息管理列表
     * 
     * @param agent 代理信息管理
     * @return 代理信息管理
     */
    @Override
    public List<Agent> selectAgentList(Agent agent)
    {
        return agentMapper.selectAgentList(agent);
    }

    @Override
    public List getAgentList(Map params) {
        return agentMapper.getAgentList(params);
    }

    /**
     * 新增代理信息管理
     * 
     * @param agent 代理信息管理
     * @return 结果
     */
    @Override
    public int insertAgent(Agent agent)
    {
        agent.setCreateTime(DateUtils.getNowDate());
        return agentMapper.insertAgent(agent);
    }

    /**
     * 修改代理信息管理
     * 
     * @param agent 代理信息管理
     * @return 结果
     */
    @Override
    public int updateAgent(Agent agent)
    {
        return agentMapper.updateAgent(agent);
    }

    /**
     * 删除代理信息管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteAgentByIds(String ids)
    {
        return agentMapper.deleteAgentByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除代理信息管理信息
     * 
     * @param id 代理信息管理ID
     * @return 结果
     */
    @Override
    public int deleteAgentById(Long id)
    {
        return agentMapper.deleteAgentById(id);
    }
}
