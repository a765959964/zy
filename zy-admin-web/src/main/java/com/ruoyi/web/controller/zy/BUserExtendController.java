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
import com.ruoyi.zy.domain.BUserExtend;
import com.ruoyi.zy.service.IBUserExtendService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 收款码管理Controller
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
@Controller
@RequestMapping("/zy/extend")
public class BUserExtendController extends BaseController
{
    private String prefix = "zy/extend";

    @Autowired
    private IBUserExtendService bUserExtendService;

    @RequiresPermissions("zy:extend:view")
    @GetMapping()
    public String extend()
    {
        return prefix + "/extend";
    }

    /**
     * 查询收款码管理列表
     */
    @RequiresPermissions("zy:extend:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BUserExtend bUserExtend)
    {
        startPage();
        List<BUserExtend> list = bUserExtendService.selectBUserExtendList(bUserExtend);
        return getDataTable(list);
    }

    /**
     * 导出收款码管理列表
     */
    @RequiresPermissions("zy:extend:export")
    @Log(title = "收款码管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BUserExtend bUserExtend)
    {
        List<BUserExtend> list = bUserExtendService.selectBUserExtendList(bUserExtend);
        ExcelUtil<BUserExtend> util = new ExcelUtil<BUserExtend>(BUserExtend.class);
        return util.exportExcel(list, "extend");
    }

    /**
     * 新增收款码管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存收款码管理
     */
    @RequiresPermissions("zy:extend:add")
    @Log(title = "收款码管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BUserExtend bUserExtend)
    {
        return toAjax(bUserExtendService.insertBUserExtend(bUserExtend));
    }

    /**
     * 修改收款码管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        BUserExtend bUserExtend = bUserExtendService.selectBUserExtendById(id);
        mmap.put("bUserExtend", bUserExtend);
        return prefix + "/edit";
    }

    /**
     * 修改保存收款码管理
     */
    @RequiresPermissions("zy:extend:edit")
    @Log(title = "收款码管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BUserExtend bUserExtend)
    {
        return toAjax(bUserExtendService.updateBUserExtend(bUserExtend));
    }

    /**
     * 删除收款码管理
     */
    @RequiresPermissions("zy:extend:remove")
    @Log(title = "收款码管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(bUserExtendService.deleteBUserExtendByIds(ids));
    }
}
