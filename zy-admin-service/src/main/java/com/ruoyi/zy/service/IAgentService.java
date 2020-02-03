package com.ruoyi.zy.service;

import com.ruoyi.zy.domain.Agent;
import java.util.List;
import java.util.Map;

/**
 * 代理信息管理Service接口
 * 
 * @author zy
 * @date 2020-02-03
 */
public interface IAgentService 
{
    /**
     * 查询代理信息管理
     * 
     * @param id 代理信息管理ID
     * @return 代理信息管理
     */
    public Agent selectAgentById(Long id);

    /**
     * 查询代理信息管理列表
     * 
     * @param agent 代理信息管理
     * @return 代理信息管理集合
     */
    public List<Agent> selectAgentList(Agent agent);


    /**
     *
     *  代理管理列表
     * @param params
     * @return
     */
    List getAgentList(Map params);

    /**
     * 新增代理信息管理
     * 
     * @param agent 代理信息管理
     * @return 结果
     */
    public int insertAgent(Agent agent);

    /**
     * 修改代理信息管理
     * 
     * @param agent 代理信息管理
     * @return 结果
     */
    public int updateAgent(Agent agent);

    /**
     * 批量删除代理信息管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteAgentByIds(String ids);

    /**
     * 删除代理信息管理信息
     * 
     * @param id 代理信息管理ID
     * @return 结果
     */
    public int deleteAgentById(Long id);



}
