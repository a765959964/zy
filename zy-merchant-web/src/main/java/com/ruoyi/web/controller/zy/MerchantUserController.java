package com.ruoyi.web.controller.zy;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.zy.domain.MerchantUser;
import com.ruoyi.zy.service.IMerchantUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 商户用户信息Controller
 * 
 * @author zy
 * @date 2019-11-20
 */
@Controller
@RequestMapping("/zy/merchantUser")
public class MerchantUserController extends BaseController
{
    private String prefix = "zy/merchantUser";

    @Autowired
    private IMerchantUserService merchantUserService;

    @RequiresPermissions("zy:merchantUser:view")
    @GetMapping()
    public String merchantUser()
    {
        return prefix + "/merchantUser";
    }

    /**
     * 查询商户用户信息列表
     */
    @RequiresPermissions("zy:merchantUser:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MerchantUser merchantUser)
    {
        startPage();
        List<MerchantUser> list = merchantUserService.selectMerchantUserList(merchantUser);
        return getDataTable(list);
    }

    /**
     * 导出商户用户信息列表
     */
    @RequiresPermissions("zy:merchantUser:export")
    @Log(title = "商户用户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MerchantUser merchantUser)
    {
        List<MerchantUser> list = merchantUserService.selectMerchantUserList(merchantUser);
        ExcelUtil<MerchantUser> util = new ExcelUtil<MerchantUser>(MerchantUser.class);
        return util.exportExcel(list, "merchantUser");
    }

    /**
     * 新增商户用户信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存商户用户信息
     */
    @RequiresPermissions("zy:merchantUser:add")
    @Log(title = "商户用户信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MerchantUser merchantUser)
    {
        return toAjax(merchantUserService.insertMerchantUser(merchantUser));
    }

    /**
     * 修改商户用户信息
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        MerchantUser merchantUser = merchantUserService.selectMerchantUserById(id);
        mmap.put("merchantUser", merchantUser);
        return prefix + "/edit";
    }

    /**
     * 修改保存商户用户信息
     */
    @RequiresPermissions("zy:merchantUser:edit")
    @Log(title = "商户用户信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MerchantUser merchantUser)
    {
        return toAjax(merchantUserService.updateMerchantUser(merchantUser));
    }

    /**
     * 删除商户用户信息
     */
    @RequiresPermissions("zy:merchantUser:remove")
    @Log(title = "商户用户信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(merchantUserService.deleteMerchantUserByIds(ids));
    }
}
