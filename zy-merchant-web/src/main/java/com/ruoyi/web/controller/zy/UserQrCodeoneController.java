package com.ruoyi.web.controller.zy;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.Global;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.utils.QRCodeUtil;
import com.ruoyi.zy.domain.BUserReceipt;
import com.ruoyi.zy.domain.UserQrCodeone;
import com.ruoyi.zy.service.IBUserReceiptService;
import com.ruoyi.zy.service.IUserQrCodeoneService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 收款码管理Controller
 * 
 * @author zy
 * @date 2020-01-08
 */
@Controller
@RequestMapping("/zy/usercodeone")
public class UserQrCodeoneController extends BaseController
{
    private String prefix = "zy/usercodeone";

    @Autowired
    private IUserQrCodeoneService userQrCodeoneService;

    @Autowired
    private IBUserReceiptService userReceiptService;

    @RequiresPermissions("zy:usercodeone:view")
    @GetMapping()
    public String usercodeone()
    {
        return prefix + "/usercodeone";
    }

    /**
     * 查询收款码管理列表
     */
    @RequiresPermissions("zy:usercodeone:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(UserQrCodeone userQrCodeone)
    {
        startPage();
        List<UserQrCodeone> list = userQrCodeoneService.selectUserQrCodeoneList(userQrCodeone);
        return getDataTable(list);
    }

    /**
     * 导出收款码管理列表
     */
    @RequiresPermissions("zy:usercodeone:export")
    @Log(title = "收款码管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(UserQrCodeone userQrCodeone)
    {
        List<UserQrCodeone> list = userQrCodeoneService.selectUserQrCodeoneList(userQrCodeone);
        ExcelUtil<UserQrCodeone> util = new ExcelUtil<UserQrCodeone>(UserQrCodeone.class);
        return util.exportExcel(list, "usercodeone");
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
    @RequiresPermissions("zy:usercodeone:add")
    @Log(title = "收款码管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(@RequestParam("file") MultipartFile file, UserQrCodeone userQrCodeone)
    {
        BUserReceipt userReceipt = new BUserReceipt();
        try
        {
            if (!file.isEmpty())
            {
                String avatar = FileUploadUtils.upload(Global.getUploadPath(), file);
                String filePath =Global.getProfile() +  avatar.substring(8);
                userQrCodeone.setReceiptQrcodeUrl(avatar);
                String str =  QRCodeUtil.decode(filePath);
                userQrCodeone.setReceiptQrcodeCode(str);
                userQrCodeone.setAgent(ShiroUtils.getSysUser().getLoginName());
                userQrCodeone.setCreateTime(DateUtils.getNowDate());
                userReceipt.setUsername(userQrCodeone.getUsername());
                userReceipt.setWechatReceiptTimes(0l);
                userReceipt.setAlipayReceiptTimes(0l);
                userReceipt.setUpdateTime(DateUtils.getNowDate());
                userReceiptService.insertBUserReceipt(userReceipt);
                return toAjax(userQrCodeoneService.insertUserQrCodeone(userQrCodeone));
            }
            return error();
        }
        catch (Exception e)
        {
            return error(e.getMessage());
        }

    }

    /**
     * 修改收款码管理
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap mmap)
    {
        UserQrCodeone userQrCodeone = userQrCodeoneService.selectUserQrCodeoneById(id);
        mmap.put("userQrCodeone", userQrCodeone);
        return prefix + "/edit";
    }

    /**
     * 修改保存收款码管理
     */
    @RequiresPermissions("zy:usercodeone:edit")
    @Log(title = "收款码管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(UserQrCodeone userQrCodeone)
    {
        return toAjax(userQrCodeoneService.updateUserQrCodeone(userQrCodeone));
    }

    /**
     * 删除收款码管理
     */
    @RequiresPermissions("zy:usercodeone:remove")
    @Log(title = "收款码管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(userQrCodeoneService.deleteUserQrCodeoneByIds(ids));
    }
}
