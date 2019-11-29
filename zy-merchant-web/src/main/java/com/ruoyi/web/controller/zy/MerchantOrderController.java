package com.ruoyi.web.controller.zy;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.zy.domain.MerchantOrder;
import com.ruoyi.zy.service.IMerchantOrderService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 商户订单记录Controller
 * 
 * @author zy
 * @date 2019-11-20
 */
@Controller
@RequestMapping("/zy/merchantOrder")
public class MerchantOrderController extends BaseController
{
    private String prefix = "zy/merchantOrder";

    @Autowired
    private IMerchantOrderService merchantOrderService;

    @RequiresPermissions("zy:merchantOrder:view")
    @GetMapping()
    public String merchantOrder()
    {
        return prefix + "/merchantOrder";
    }

    /**
     * 查询商户订单记录列表
     */
    @RequiresPermissions("zy:merchantOrder:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MerchantOrder merchantOrder)
    {
        startPage();
        List<MerchantOrder> list = merchantOrderService.selectMerchantOrderList(merchantOrder);
        return getDataTable(list);
    }

    /**
     * 导出商户订单记录列表
     */
    @RequiresPermissions("zy:merchantOrder:export")
    @Log(title = "商户订单记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MerchantOrder merchantOrder)
    {
        List<MerchantOrder> list = merchantOrderService.selectMerchantOrderList(merchantOrder);
        ExcelUtil<MerchantOrder> util = new ExcelUtil<MerchantOrder>(MerchantOrder.class);
        return util.exportExcel(list, "merchantOrder");
    }

    /**
     * 新增商户订单记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存商户订单记录
     */
    @RequiresPermissions("zy:merchantOrder:add")
    @Log(title = "商户订单记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MerchantOrder merchantOrder)
    {
        return toAjax(merchantOrderService.insertMerchantOrder(merchantOrder));
    }

    /**
     * 修改商户订单记录
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MerchantOrder merchantOrder = merchantOrderService.selectMerchantOrderById(id);
        mmap.put("merchantOrder", merchantOrder);
        return prefix + "/edit";
    }

    /**
     * 修改保存商户订单记录
     */
    @RequiresPermissions("zy:merchantOrder:edit")
    @Log(title = "商户订单记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MerchantOrder merchantOrder)
    {
        return toAjax(merchantOrderService.updateMerchantOrder(merchantOrder));
    }

    /**
     * 删除商户订单记录
     */
    @RequiresPermissions("zy:merchantOrder:remove")
    @Log(title = "商户订单记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(merchantOrderService.deleteMerchantOrderByIds(ids));
    }
}
