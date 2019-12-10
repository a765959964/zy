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
import com.ruoyi.zy.domain.BUserWithdrawal;
import com.ruoyi.zy.service.IBUserWithdrawalService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户提款记录Controller
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
@Controller
@RequestMapping("/zy/withdrawal")
public class BUserWithdrawalController extends BaseController
{
    private String prefix = "zy/withdrawal";

    @Autowired
    private IBUserWithdrawalService bUserWithdrawalService;

    @RequiresPermissions("zy:withdrawal:view")
    @GetMapping()
    public String withdrawal()
    {
        return prefix + "/withdrawal";
    }

    /**
     * 查询用户提款记录列表
     */
    @RequiresPermissions("zy:withdrawal:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BUserWithdrawal bUserWithdrawal)
    {
        startPage();
        List<BUserWithdrawal> list = bUserWithdrawalService.selectBUserWithdrawalList(bUserWithdrawal);
        return getDataTable(list);
    }

    /**
     * 导出用户提款记录列表
     */
    @RequiresPermissions("zy:withdrawal:export")
    @Log(title = "用户提款记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BUserWithdrawal bUserWithdrawal)
    {
        List<BUserWithdrawal> list = bUserWithdrawalService.selectBUserWithdrawalList(bUserWithdrawal);
        ExcelUtil<BUserWithdrawal> util = new ExcelUtil<BUserWithdrawal>(BUserWithdrawal.class);
        return util.exportExcel(list, "withdrawal");
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
    @RequiresPermissions("zy:withdrawal:add")
    @Log(title = "用户提款记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BUserWithdrawal bUserWithdrawal)
    {
        return toAjax(bUserWithdrawalService.insertBUserWithdrawal(bUserWithdrawal));
    }

    /**
     * 修改用户提款记录
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        BUserWithdrawal bUserWithdrawal = bUserWithdrawalService.selectBUserWithdrawalById(id);
        mmap.put("bUserWithdrawal", bUserWithdrawal);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户提款记录
     */
    @RequiresPermissions("zy:withdrawal:edit")
    @Log(title = "用户提款记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BUserWithdrawal bUserWithdrawal)
    {
        return toAjax(bUserWithdrawalService.updateBUserWithdrawal(bUserWithdrawal));
    }

    /**
     * 删除用户提款记录
     */
    @RequiresPermissions("zy:withdrawal:remove")
    @Log(title = "用户提款记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(bUserWithdrawalService.deleteBUserWithdrawalByIds(ids));
    }
}
