package com.ruoyi.web.controller.zy;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.zy.domain.ReceiptBank;
import com.ruoyi.zy.service.IReceiptBankService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 银行收据Controller
 * 
 * @author zf
 * @date 2019-11-28
 */
@Controller
@RequestMapping("/zy/receiptBank")
public class ReceiptBankController extends BaseController
{
    private String prefix = "zy/receiptBank";

    @Autowired
    private IReceiptBankService receiptBankService;

    @RequiresPermissions("zy:receiptBank:view")
    @GetMapping()
    public String receiptBank()
    {
        return prefix + "/receiptBank";
    }

    /**
     * 查询银行收据列表
     */
    @RequiresPermissions("zy:receiptBank:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(ReceiptBank receiptBank)
    {
        startPage();
        List<ReceiptBank> list = receiptBankService.selectReceiptBankList(receiptBank);
        return getDataTable(list);
    }

    /**
     * 导出银行收据列表
     */
    @RequiresPermissions("zy:receiptBank:export")
    @Log(title = "银行收据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(ReceiptBank receiptBank)
    {
        List<ReceiptBank> list = receiptBankService.selectReceiptBankList(receiptBank);
        ExcelUtil<ReceiptBank> util = new ExcelUtil<ReceiptBank>(ReceiptBank.class);
        return util.exportExcel(list, "receiptBank");
    }

    /**
     * 新增银行收据
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存银行收据
     */
    @RequiresPermissions("zy:receiptBank:add")
    @Log(title = "银行收据", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(ReceiptBank receiptBank)
    {
        return toAjax(receiptBankService.insertReceiptBank(receiptBank));
    }

    /**
     * 修改银行收据
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        ReceiptBank receiptBank = receiptBankService.selectReceiptBankById(id);
        mmap.put("receiptBank", receiptBank);
        return prefix + "/edit";
    }

    /**
     * 修改保存银行收据
     */
    @RequiresPermissions("zy:receiptBank:edit")
    @Log(title = "银行收据", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(ReceiptBank receiptBank)
    {
        return toAjax(receiptBankService.updateReceiptBank(receiptBank));
    }

    /**
     * 删除银行收据
     */
    @RequiresPermissions("zy:receiptBank:remove")
    @Log(title = "银行收据", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(receiptBankService.deleteReceiptBankByIds(ids));
    }
}
