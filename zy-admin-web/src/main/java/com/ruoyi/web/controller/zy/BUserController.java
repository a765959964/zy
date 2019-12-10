package com.ruoyi.web.controller.zy;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.zy.domain.BUser;
import com.ruoyi.zy.service.IBUserService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户管理Controller
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
@Controller
@RequestMapping("/zy/user")
public class BUserController extends BaseController
{
    private String prefix = "zy/user";

    @Autowired
    private IBUserService bUserService;

    @RequiresPermissions("zy:user:view")
    @GetMapping()
    public String user()
    {
        return prefix + "/user";
    }

    /**
     * 查询用户管理列表
     */
    @RequiresPermissions("zy:user:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BUser bUser)
    {
        startPage();
        List<BUser> list = bUserService.selectBUserList(bUser);
        return getDataTable(list);
    }

    /**
     * 导出用户管理列表
     */
    @RequiresPermissions("zy:user:export")
    @Log(title = "用户管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BUser bUser)
    {
        List<BUser> list = bUserService.selectBUserList(bUser);
        ExcelUtil<BUser> util = new ExcelUtil<BUser>(BUser.class);
        return util.exportExcel(list, "user");
    }

    /**
     * 新增用户管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存用户管理
     */
    @RequiresPermissions("zy:user:add")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BUser bUser)
    {
        return toAjax(bUserService.insertBUser(bUser));
    }

    /**
     * 修改用户管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        BUser bUser = bUserService.selectBUserById(id);
        mmap.put("bUser", bUser);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户管理
     */
    @RequiresPermissions("zy:user:edit")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BUser bUser)
    {
        return toAjax(bUserService.updateBUser(bUser));
    }

    /**
     * 删除用户管理
     */
    @RequiresPermissions("zy:user:remove")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(bUserService.deleteBUserByIds(ids));
    }
}
