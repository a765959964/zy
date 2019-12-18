package com.ruoyi.web.controller.zy;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.zy.domain.MerchantBank;
import com.ruoyi.zy.service.IMerchantBankService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 商户银行卡Controller
 * 
 * @author zy
 * @date 2019-12-18
 */
@Controller
@RequestMapping("/zy/merchantBank")
public class MerchantBankController extends BaseController
{
    private String prefix = "zy/merchantBank";

    @Autowired
    private IMerchantBankService merchantBankService;

    @RequiresPermissions("zy:merchantBank:view")
    @GetMapping()
    public String merchantBank()
    {
        return prefix + "/merchantBank";
    }

    /**
     * 查询商户银行卡列表
     */
    @RequiresPermissions("zy:merchantBank:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MerchantBank merchantBank)
    {
        startPage();
        List<MerchantBank> list = merchantBankService.selectMerchantBankList(merchantBank);
        return getDataTable(list);
    }

    /**
     * 导出商户银行卡列表
     */
    @RequiresPermissions("zy:merchantBank:export")
    @Log(title = "商户银行卡", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MerchantBank merchantBank)
    {
        List<MerchantBank> list = merchantBankService.selectMerchantBankList(merchantBank);
        ExcelUtil<MerchantBank> util = new ExcelUtil<MerchantBank>(MerchantBank.class);
        return util.exportExcel(list, "merchantBank");
    }

    /**
     * 新增商户银行卡
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存商户银行卡
     */
    @RequiresPermissions("zy:merchantBank:add")
    @Log(title = "账户", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MerchantBank merchantBank)
    {
        return toAjax(merchantBankService.insertMerchantBank(merchantBank));
    }

    /**
     * 修改商户银行卡
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MerchantBank merchantBank = merchantBankService.selectMerchantBankById(id);
        mmap.put("merchantBank", merchantBank);
        return prefix + "/edit";
    }

    /**
     * 修改保存商户银行卡
     */
    @RequiresPermissions("zy:merchantBank:edit")
    @Log(title = "商户银行卡", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MerchantBank merchantBank)
    {
        return toAjax(merchantBankService.updateMerchantBank(merchantBank));
    }

    /**
     * 删除商户银行卡
     */
    @RequiresPermissions("zy:merchantBank:remove")
    @Log(title = "商户银行卡", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(merchantBankService.deleteMerchantBankByIds(ids));
    }
}
