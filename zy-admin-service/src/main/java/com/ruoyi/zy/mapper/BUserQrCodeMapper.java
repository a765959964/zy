package com.ruoyi.zy.mapper;

import com.ruoyi.zy.domain.BUserQrCode;
import java.util.List;

/**
 * 用户收款码表Mapper接口
 * 
 * @author ruoyi
 * @date 2019-12-12
 */
public interface BUserQrCodeMapper 
{
    /**
     * 查询用户收款码表
     * 
     * @param id 用户收款码表ID
     * @return 用户收款码表
     */
    public BUserQrCode selectBUserQrCodeById(Long id);

    /**
     * 查询用户收款码表列表
     * 
     * @param bUserQrCode 用户收款码表
     * @return 用户收款码表集合
     */
    public List<BUserQrCode> selectBUserQrCodeList(BUserQrCode bUserQrCode);

    /**
     * 新增用户收款码表
     * 
     * @param bUserQrCode 用户收款码表
     * @return 结果
     */
    public int insertBUserQrCode(BUserQrCode bUserQrCode);

    /**
     * 修改用户收款码表
     * 
     * @param bUserQrCode 用户收款码表
     * @return 结果
     */
    public int updateBUserQrCode(BUserQrCode bUserQrCode);

    /**
     * 删除用户收款码表
     * 
     * @param id 用户收款码表ID
     * @return 结果
     */
    public int deleteBUserQrCodeById(Long id);

    /**
     * 批量删除用户收款码表
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBUserQrCodeByIds(String[] ids);
}
