package com.ruoyi.web.controller.zy;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.zy.domain.BMerchant;
import com.ruoyi.zy.service.IBMerchantService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 商户信息Controller
 * 
 * @author zy
 * @date 2019-11-21
 */
@Controller
@RequestMapping("/zy/merchant")
public class BMerchantController extends BaseController
{
    private String prefix = "zy/merchant";

    @Autowired
    private IBMerchantService bMerchantService;

    @RequiresPermissions("zy:merchant:view")
    @GetMapping()
    public String merchant()
    {
        return prefix + "/merchant";
    }

    /**
     * 查询商户信息列表
     */
    @RequiresPermissions("zy:merchant:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BMerchant bMerchant)
    {
        startPage();

        // 取身份信息
        SysUser user = ShiroUtils.getSysUser();
        if(!user.isAdmin()){    // 不是管理员 取当前账户
            bMerchant.setMerchantNo(user.getLoginName());
        }

        List<BMerchant> list = bMerchantService.selectBMerchantList(bMerchant);
        return getDataTable(list);
    }

    /**
     * 导出商户信息列表
     */
    @RequiresPermissions("zy:merchant:export")
    @Log(title = "商户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BMerchant bMerchant)
    {
        List<BMerchant> list = bMerchantService.selectBMerchantList(bMerchant);
        ExcelUtil<BMerchant> util = new ExcelUtil<BMerchant>(BMerchant.class);
        return util.exportExcel(list, "merchant");
    }

    /**
     * 新增商户信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存商户信息
     */
    @RequiresPermissions("zy:merchant:add")
    @Log(title = "商户信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(BMerchant bMerchant)
    {
        return toAjax(bMerchantService.insertBMerchant(bMerchant));
    }

    /**
     * 修改商户信息
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        BMerchant bMerchant = bMerchantService.selectBMerchantById(id);
        mmap.put("bMerchant", bMerchant);
        return prefix + "/edit";
    }

    /**
     * 修改保存商户信息
     */
    @RequiresPermissions("zy:merchant:edit")
    @Log(title = "商户信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(BMerchant bMerchant)
    {
        return toAjax(bMerchantService.updateBMerchant(bMerchant));
    }

    /**
     * 删除商户信息
     */
    @RequiresPermissions("zy:merchant:remove")
    @Log(title = "商户信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(bMerchantService.deleteBMerchantByIds(ids));
    }
}
