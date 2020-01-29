package com.ruoyi.web.controller.zy;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.Global;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.zy.domain.BUserDeposit;
import com.ruoyi.zy.service.IBUserDepositService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

/**
 * 缴纳保证金记录Controller
 * 
 * @author zf
 * @date 2019-11-28
 */
@Controller
@RequestMapping("/zy/userDeposit")
public class UserDepositController extends BaseController
{
    private String prefix = "zy/userDeposit";

    @Autowired
    private IBUserDepositService userDepositService;

    @RequiresPermissions("zy:userDeposit:view")
    @GetMapping()
    public String userDeposit()
    {
        return prefix + "/userDeposit";
    }

    /**
     * 查询缴纳保证金记录列表
     */
    @RequiresPermissions("zy:userDeposit:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(BUserDeposit userDeposit)
    {
        startPage();
        List<BUserDeposit> list = userDepositService.selectBUserDepositList(userDeposit);
        return getDataTable(list);
    }

    /**
     * 导出缴纳保证金记录列表
     */
    @RequiresPermissions("zy:userDeposit:export")
    @Log(title = "缴纳保证金记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BUserDeposit userDeposit)
    {
        List<BUserDeposit> list = userDepositService.selectBUserDepositList(userDeposit);
        ExcelUtil<BUserDeposit> util = new ExcelUtil<BUserDeposit>(BUserDeposit.class);
        return util.exportExcel(list, "userDeposit");
    }

    /**
     * 新增缴纳保证金记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存缴纳保证金记录
     */
    @RequiresPermissions("zy:userDeposit:add")
    @Log(title = "缴纳保证金记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestParam("file") MultipartFile file,BUserDeposit userDeposit)
    {
        try
        {
            if (!file.isEmpty())
            {
                String avatar = FileUploadUtils.upload(Global.getUploadPath(), file);
//                System.out.println(avatar);
                userDeposit.setAgent(ShiroUtils.getSysUser().getLoginName());
                userDeposit.setEarnestMoney(0l);
                userDeposit.setEarnestMoneyUrl(avatar);
                userDeposit.setReceiptAmount(0l);
                userDeposit.setReceiptCommissionAmount(0.0);
                userDeposit.setReviewStatus("1");
                userDeposit.setFlag("Y");
                userDeposit.setStatus("1");
                userDeposit.setCreateTime(new Date());
                return toAjax(userDepositService.insertBUserDeposit(userDeposit));
            }
            return error();
        }
        catch (Exception e)
        {
            return error(e.getMessage());
        }
    }

    /**
     * 修改缴纳保证金记录
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        BUserDeposit userDeposit = userDepositService.selectBUserDepositById(id);
        mmap.put("userDeposit", userDeposit);
        return prefix + "/edit";
    }

    /**
     * 修改保存缴纳保证金记录 @RequestParam("file")
     */
    @RequiresPermissions("zy:userDeposit:edit")
    @Log(title = "缴纳保证金记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave( MultipartFile file, BUserDeposit userDeposit)
    {

        try
        {
            if (file !=null)
            {
                String avatar = FileUploadUtils.upload(Global.getAvatarPath(), file);
                userDeposit.setEarnestMoneyUrl(avatar);
                return toAjax(userDepositService.updateBUserDeposit(userDeposit));
            }
            return toAjax(userDepositService.updateBUserDeposit(userDeposit));
        }
        catch (Exception e)
        {
            return error(e.getMessage());
        }

    }

    /**
     * 删除缴纳保证金记录
     */
    @RequiresPermissions("zy:userDeposit:remove")
    @Log(title = "缴纳保证金记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(userDepositService.deleteBUserDepositByIds(ids));
    }
}
