package com.ruoyi.web.controller.zy;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.zy.domain.BUserOrder;
import com.ruoyi.zy.service.IBUserOrderService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户订单记录Controller
 * 
 * @author zy
 * @date 2020-02-02
 */
@Controller
@RequestMapping("/zy/userorder")
public class BUserOrderController extends BaseController
{
    private String prefix = "zy/userorder";

    @Autowired
    private IBUserOrderService bUserOrderService;

    @RequiresPermissions("zy:userorder:view")
    @GetMapping()
    public String userorder()
    {
        return prefix + "/userorder";
    }


    /**
     * 收款金额
     * @return
     */
    @RequiresPermissions("zy:userorder:view")
    @GetMapping("/ordermoney")
    public String ordermoney()
    {
        return prefix + "/ordermoney";
    }


    /**
     * 查询用户订单记录列表
     */
    @RequiresPermissions("zy:userorder:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BUserOrder bUserOrder)
    {
        startPage();
        List<BUserOrder> list = bUserOrderService.selectBUserOrderList(bUserOrder);
        return getDataTable(list);
    }


    /**
     * 查询用户订单记录列表
     */
    @RequiresPermissions("zy:userorder:list")
    @PostMapping("/getOrderMoneyList")
    @ResponseBody
    public TableDataInfo getOrderMoneyList(BUserOrder bUserOrder)
    {
        Map params = new HashMap();

        if(bUserOrder.getUsername() !=null ){
            params.put("username",bUserOrder.getUsername());
        }

        if(bUserOrder.getPayType() != null){
            params.put("payType",bUserOrder.getPayType());
        }

        startPage();
        List list = bUserOrderService.getOrderMoneyList(params);
        return getDataTable(list);
    }



    /**
     * 导出用户订单记录列表
     */
    @RequiresPermissions("zy:userorder:export")
    @Log(title = "用户订单记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BUserOrder bUserOrder)
    {
        List<BUserOrder> list = bUserOrderService.selectBUserOrderList(bUserOrder);
        ExcelUtil<BUserOrder> util = new ExcelUtil<BUserOrder>(BUserOrder.class);
        return util.exportExcel(list, "userorder");
    }

    /**
     * 新增用户订单记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存用户订单记录
     */
    @RequiresPermissions("zy:userorder:add")
    @Log(title = "用户订单记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BUserOrder bUserOrder)
    {
        return toAjax(bUserOrderService.insertBUserOrder(bUserOrder));
    }

    /**
     * 修改用户订单记录
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        BUserOrder bUserOrder = bUserOrderService.selectBUserOrderById(id);
        mmap.put("bUserOrder", bUserOrder);
        return prefix + "/edit";
    }

    /**
     * 修改保存用户订单记录
     */
    @RequiresPermissions("zy:userorder:edit")
    @Log(title = "用户订单记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BUserOrder bUserOrder)
    {
        return toAjax(bUserOrderService.updateBUserOrder(bUserOrder));
    }

    /**
     * 删除用户订单记录
     */
    @RequiresPermissions("zy:userorder:remove")
    @Log(title = "用户订单记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(bUserOrderService.deleteBUserOrderByIds(ids));
    }
}
