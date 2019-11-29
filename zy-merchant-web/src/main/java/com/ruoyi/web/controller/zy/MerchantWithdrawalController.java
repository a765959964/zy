package com.ruoyi.web.controller.zy;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.zy.domain.MerchantWithdrawal;
import com.ruoyi.zy.service.IMerchantWithdrawalService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 提款记录Controller
 * 
 * @author zy
 * @date 2019-11-20
 */
@Controller
@RequestMapping("/zy/merchantWithdrawal")
public class MerchantWithdrawalController extends BaseController
{
    private String prefix = "zy/merchantWithdrawal";

    @Autowired
    private IMerchantWithdrawalService merchantWithdrawalService;

    @RequiresPermissions("zy:merchantWithdrawal:view")
    @GetMapping()
    public String merchantWithdrawal()
    {
        return prefix + "/merchantWithdrawal";
    }

    /**
     * 查询提款记录列表
     */
    @RequiresPermissions("zy:merchantWithdrawal:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MerchantWithdrawal merchantWithdrawal)
    {
        startPage();
        List<MerchantWithdrawal> list = merchantWithdrawalService.selectMerchantWithdrawalList(merchantWithdrawal);
        return getDataTable(list);
    }

    /**
     * 导出提款记录列表
     */
    @RequiresPermissions("zy:merchantWithdrawal:export")
    @Log(title = "提款记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MerchantWithdrawal merchantWithdrawal)
    {
        List<MerchantWithdrawal> list = merchantWithdrawalService.selectMerchantWithdrawalList(merchantWithdrawal);
        ExcelUtil<MerchantWithdrawal> util = new ExcelUtil<MerchantWithdrawal>(MerchantWithdrawal.class);
        return util.exportExcel(list, "merchantWithdrawal");
    }

    /**
     * 新增提款记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存提款记录
     */
    @RequiresPermissions("zy:merchantWithdrawal:add")
    @Log(title = "提款记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MerchantWithdrawal merchantWithdrawal)
    {
        return toAjax(merchantWithdrawalService.insertMerchantWithdrawal(merchantWithdrawal));
    }

    /**
     * 修改提款记录
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MerchantWithdrawal merchantWithdrawal = merchantWithdrawalService.selectMerchantWithdrawalById(id);
        mmap.put("merchantWithdrawal", merchantWithdrawal);
        return prefix + "/edit";
    }

    /**
     * 修改保存提款记录
     */
    @RequiresPermissions("zy:merchantWithdrawal:edit")
    @Log(title = "提款记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MerchantWithdrawal merchantWithdrawal)
    {
        return toAjax(merchantWithdrawalService.updateMerchantWithdrawal(merchantWithdrawal));
    }

    /**
     * 删除提款记录
     */
    @RequiresPermissions("zy:merchantWithdrawal:remove")
    @Log(title = "提款记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(merchantWithdrawalService.deleteMerchantWithdrawalByIds(ids));
    }
}
