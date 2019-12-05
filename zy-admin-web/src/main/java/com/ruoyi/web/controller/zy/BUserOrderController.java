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
import com.ruoyi.zy.domain.BUserOrder;
import com.ruoyi.zy.service.IBUserOrderService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 交易记录Controller
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
@Controller
@RequestMapping("/zy/order")
public class BUserOrderController extends BaseController
{
    private String prefix = "zy/order";

    @Autowired
    private IBUserOrderService bUserOrderService;

    @RequiresPermissions("zy:order:view")
    @GetMapping()
    public String order()
    {
        return prefix + "/order";
    }

    /**
     * 查询交易记录列表
     */
    @RequiresPermissions("zy:order:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BUserOrder bUserOrder)
    {
        startPage();
        List<BUserOrder> list = bUserOrderService.selectBUserOrderList(bUserOrder);
        return getDataTable(list);
    }

    /**
     * 导出交易记录列表
     */
    @RequiresPermissions("zy:order:export")
    @Log(title = "交易记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BUserOrder bUserOrder)
    {
        List<BUserOrder> list = bUserOrderService.selectBUserOrderList(bUserOrder);
        ExcelUtil<BUserOrder> util = new ExcelUtil<BUserOrder>(BUserOrder.class);
        return util.exportExcel(list, "order");
    }

    /**
     * 新增交易记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存交易记录
     */
    @RequiresPermissions("zy:order:add")
    @Log(title = "交易记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BUserOrder bUserOrder)
    {
        return toAjax(bUserOrderService.insertBUserOrder(bUserOrder));
    }

    /**
     * 修改交易记录
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        BUserOrder bUserOrder = bUserOrderService.selectBUserOrderById(id);
        mmap.put("bUserOrder", bUserOrder);
        return prefix + "/edit";
    }

    /**
     * 修改保存交易记录
     */
    @RequiresPermissions("zy:order:edit")
    @Log(title = "交易记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BUserOrder bUserOrder)
    {
        return toAjax(bUserOrderService.updateBUserOrder(bUserOrder));
    }

    /**
     * 删除交易记录
     */
    @RequiresPermissions("zy:order:remove")
    @Log(title = "交易记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(bUserOrderService.deleteBUserOrderByIds(ids));
    }
}
