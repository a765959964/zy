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
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.zy.domain.BReceiptBank;
import com.ruoyi.zy.service.IBReceiptBankService;

/**
 * 账户管理Controller
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
@Controller
@RequestMapping("/zy/bank")
public class BReceiptBankController extends BaseController
{
    private String prefix = "zy/bank";

    @Autowired
    private IBReceiptBankService bReceiptBankService;

    @RequiresPermissions("zy:bank:view")
    @GetMapping()
    public String bank()
    {
        return prefix + "/bank";
    }

    /**
     * 查询账户管理列表
     */
    @RequiresPermissions("zy:bank:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BReceiptBank bReceiptBank)
    {
        startPage();
        List<BReceiptBank> list = bReceiptBankService.selectBReceiptBankList(bReceiptBank);
        return getDataTable(list);
    }

    /**
     * 导出账户管理列表
     */
    @RequiresPermissions("zy:bank:export")
    @Log(title = "账户管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BReceiptBank bReceiptBank)
    {
        List<BReceiptBank> list = bReceiptBankService.selectBReceiptBankList(bReceiptBank);
        ExcelUtil<BReceiptBank> util = new ExcelUtil<BReceiptBank>(BReceiptBank.class);
        return util.exportExcel(list, "bank");
    }

    /**
     * 新增账户管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存账户管理
     */
    @RequiresPermissions("zy:bank:add")
    @Log(title = "账户管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BReceiptBank bReceiptBank)
    {
        return toAjax(bReceiptBankService.insertBReceiptBank(bReceiptBank));
    }

    /**
     * 修改账户管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        BReceiptBank bReceiptBank = bReceiptBankService.selectBReceiptBankById(id);
        mmap.put("bReceiptBank", bReceiptBank);
        return prefix + "/edit";
    }

    /**
     * 修改保存账户管理
     */
    @RequiresPermissions("zy:bank:edit")
    @Log(title = "账户管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BReceiptBank bReceiptBank)
    {
        return toAjax(bReceiptBankService.updateBReceiptBank(bReceiptBank));
    }

    /**
     * 删除账户管理
     */
    @RequiresPermissions("zy:bank:remove")
    @Log(title = "账户管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(bReceiptBankService.deleteBReceiptBankByIds(ids));
    }
}
