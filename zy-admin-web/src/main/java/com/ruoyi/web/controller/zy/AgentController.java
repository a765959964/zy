package com.ruoyi.web.controller.zy;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.zy.domain.Agent;
import com.ruoyi.zy.service.IAgentService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 代理信息管理Controller
 * 
 * @author zy
 * @date 2020-02-03
 */
@Controller
@RequestMapping("/zy/agent")
public class AgentController extends BaseController
{
    private String prefix = "zy/agent";

    @Autowired
    private IAgentService agentService;

    @RequiresPermissions("zy:agent:view")
    @GetMapping()
    public String agent()
    {
        return prefix + "/agent";
    }

    /**
     * 查询代理信息管理列表
     */
    @RequiresPermissions("zy:agent:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Agent agent)
    {
        startPage();

        List<Agent> list = agentService.selectAgentList(agent);
        return getDataTable(list);
    }


    /**
     * 查询代理信息管理列表
     */
    @RequiresPermissions("zy:agent:list")
    @PostMapping("/getAgentList")
    @ResponseBody
    public TableDataInfo getAgentList(Agent agent)
    {
        startPage();
        Map<String, String>  params = new HashMap<String, String>();

        SysUser sysUser =  ShiroUtils.getSysUser();

        if(agent !=null){
            if(agent.getStatus() !=null){
                params.put("status",agent.getStatus());
            }


            if(agent.getAgentName()  != null){
                params.put("agentName", agent.getAgentName());
            }
        }

        if(!sysUser.isAdmin()){
            params.put("agentCode" , sysUser.getLoginName());
        }else{
            if(agent.getAgentCode() !=null ){
                params.put("agentCode" , agent.getAgentCode());
            }
        }




        List list = agentService.getAgentList(params);
        return getDataTable(list);
    }




    /**
     * 状态修改
     */
    @Log(title = "修改状态", businessType = BusinessType.UPDATE)
    @RequiresPermissions("zy:agent:edit")
    @PostMapping("/changeStatus")
    @ResponseBody
    public AjaxResult changeStatus(Agent agent)
    {
        return toAjax(agentService.updateAgent(agent));
    }

    /**
     * 导出代理信息管理列表
     */
    @RequiresPermissions("zy:agent:export")
    @Log(title = "代理信息管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Agent agent)
    {
        List<Agent> list = agentService.selectAgentList(agent);
        ExcelUtil<Agent> util = new ExcelUtil<Agent>(Agent.class);
        return util.exportExcel(list, "agent");
    }

    /**
     * 新增代理信息管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存代理信息管理
     */
    @RequiresPermissions("zy:agent:add")
    @Log(title = "代理信息管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Agent agent)
    {
        return toAjax(agentService.insertAgent(agent));
    }

    /**
     * 修改代理信息管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        Agent agent = agentService.selectAgentById(id);
        mmap.put("agent", agent);
        return prefix + "/edit";
    }

    /**
     * 修改保存代理信息管理
     */
    @RequiresPermissions("zy:agent:edit")
    @Log(title = "代理信息管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Agent agent)
    {
        return toAjax(agentService.updateAgent(agent));
    }

    /**
     * 删除代理信息管理
     */
    @RequiresPermissions("zy:agent:remove")
    @Log(title = "代理信息管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(agentService.deleteAgentByIds(ids));
    }
}
