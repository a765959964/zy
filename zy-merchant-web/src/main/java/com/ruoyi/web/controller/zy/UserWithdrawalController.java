package com.ruoyi.web.controller.zy;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.zy.domain.UserWithdrawal;
import com.ruoyi.zy.service.IUserWithdrawalService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 用户提款记录Controller
 * 
 * @author zf
 * @date 2019-11-28
 */
@Controller
@RequestMapping("/zy/userWithdrawal")
public class UserWithdrawalController extends BaseController
{
    private String prefix = "zy/userWithdrawal";

    @Autowired
    private IUserWithdrawalService userWithdrawalService;

    @RequiresPermissions("zy:userWithdrawal:view")
    @GetMapping()
    public String userWithdrawal()
    {
        return prefix + "/userWithdrawal";
    }

    /**
     * 查询用户提款记录列表
     */
    @RequiresPermissions("zy:userWithdrawal:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(UserWithdrawal userWithdrawal)
    {
        startPage();
        List<UserWithdrawal> list = userWithdrawalService.selectUserWithdrawalList(userWithdrawal);
        return getDataTable(list);
    }

    /**
     * 导出用户提款记录列表
     */
    @RequiresPermissions("zy:userWithdrawal:export")
    @Log(title = "用户提款记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(UserWithdrawal userWithdrawal)
    {
        List<UserWithdrawal> list = userWithdrawalService.selectUserWithdrawalList(userWithdrawal);
        ExcelUtil<UserWithdrawal> util = new ExcelUtil<UserWithdrawal>(UserWithdrawal.class);
        return util.exportExcel(list, "userWithdrawal");
    }

    /**
     * 新增用户提款记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存用户提款记录
     */
    @RequiresPermissions("zy:userWithdrawal:add")
    @Log(title = "用户提款记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(UserWithdrawal userWithdrawal)
    {
        return toAjax(userWithdrawalService.insertUserWithdrawal(userWithdrawal));
    }

    /**
     * 修改用户提款记录
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        UserWithdrawal userWithdrawal = userWithdrawalService.selectUserWithdrawalById(id);
        mmap.put("userWithdrawal", userWithdrawal);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户提款记录
     */
    @RequiresPermissions("zy:userWithdrawal:edit")
    @Log(title = "用户提款记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(UserWithdrawal userWithdrawal)
    {
        return toAjax(userWithdrawalService.updateUserWithdrawal(userWithdrawal));
    }

    /**
     * 删除用户提款记录
     */
    @RequiresPermissions("zy:userWithdrawal:remove")
    @Log(title = "用户提款记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(userWithdrawalService.deleteUserWithdrawalByIds(ids));
    }
}
