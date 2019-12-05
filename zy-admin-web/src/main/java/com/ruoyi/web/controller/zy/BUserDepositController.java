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
import com.ruoyi.zy.domain.BUserDeposit;
import com.ruoyi.zy.service.IBUserDepositService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 保证金记录Controller
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
@Controller
@RequestMapping("/zy/deposit")
public class BUserDepositController extends BaseController
{
    private String prefix = "zy/deposit";

    @Autowired
    private IBUserDepositService bUserDepositService;

    @RequiresPermissions("zy:deposit:view")
    @GetMapping()
    public String deposit()
    {
        return prefix + "/deposit";
    }

    /**
     * 查询保证金记录列表
     */
    @RequiresPermissions("zy:deposit:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BUserDeposit bUserDeposit)
    {
        startPage();
        List<BUserDeposit> list = bUserDepositService.selectBUserDepositList(bUserDeposit);
        return getDataTable(list);
    }

    /**
     * 导出保证金记录列表
     */
    @RequiresPermissions("zy:deposit:export")
    @Log(title = "保证金记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BUserDeposit bUserDeposit)
    {
        List<BUserDeposit> list = bUserDepositService.selectBUserDepositList(bUserDeposit);
        ExcelUtil<BUserDeposit> util = new ExcelUtil<BUserDeposit>(BUserDeposit.class);
        return util.exportExcel(list, "deposit");
    }

    /**
     * 新增保证金记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存保证金记录
     */
    @RequiresPermissions("zy:deposit:add")
    @Log(title = "保证金记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BUserDeposit bUserDeposit)
    {
        return toAjax(bUserDepositService.insertBUserDeposit(bUserDeposit));
    }

    /**
     * 修改保证金记录
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        BUserDeposit bUserDeposit = bUserDepositService.selectBUserDepositById(id);
        mmap.put("bUserDeposit", bUserDeposit);
        return prefix + "/edit";
    }

    /**
     * 修改保存保证金记录
     */
    @RequiresPermissions("zy:deposit:edit")
    @Log(title = "保证金记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BUserDeposit bUserDeposit)
    {
        return toAjax(bUserDepositService.updateBUserDeposit(bUserDeposit));
    }

    /**
     * 删除保证金记录
     */
    @RequiresPermissions("zy:deposit:remove")
    @Log(title = "保证金记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(bUserDepositService.deleteBUserDepositByIds(ids));
    }
}
