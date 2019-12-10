package com.ruoyi.web.controller.zy;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.zy.domain.TKitchen;
import com.ruoyi.zy.service.ITKitchenService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
 
import java.util.List;

/**
 * 门店Controller
 * 
 * @author zy
 * @date 2019-11-19
 */
@Controller
@RequestMapping("/zy/kitchen")
public class TKitchenController extends BaseController
{
    private String prefix = "zy/kitchen";

    @Autowired
    private ITKitchenService tKitchenService;

    @RequiresPermissions("zy:kitchen:view")
    @GetMapping()
    public String kitchen()
    {
        return prefix + "/kitchen";
    }

    /**
     * 查询门店列表
     */
    @RequiresPermissions("zy:kitchen:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(TKitchen tKitchen)
    {
        startPage();
        List<TKitchen> list = tKitchenService.selectTKitchenList(tKitchen);
        return getDataTable(list);
    }

    /**
     * 导出门店列表
     */
    @RequiresPermissions("zy:kitchen:export")
    @Log(title = "门店", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(TKitchen tKitchen)
    {
        List<TKitchen> list = tKitchenService.selectTKitchenList(tKitchen);
        ExcelUtil<TKitchen> util = new ExcelUtil<TKitchen>(TKitchen.class);
        return util.exportExcel(list, "kitchen");
    }

    /**
     * 新增门店
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存门店
     */
    @RequiresPermissions("zy:kitchen:add")
    @Log(title = "门店", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(TKitchen tKitchen)
    {
        return toAjax(tKitchenService.insertTKitchen(tKitchen));
    }

    /**
     * 修改门店
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        TKitchen tKitchen = tKitchenService.selectTKitchenById(id);
        mmap.put("tKitchen", tKitchen);
        return prefix + "/edit";
    }

    /**
     * 修改保存门店
     */
    @RequiresPermissions("zy:kitchen:edit")
    @Log(title = "门店", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(TKitchen tKitchen)
    {
        return toAjax(tKitchenService.updateTKitchen(tKitchen));
    }

    /**
     * 删除门店
     */
    @RequiresPermissions("zy:kitchen:remove")
    @Log(title = "门店", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(tKitchenService.deleteTKitchenByIds(ids));
    }
}
