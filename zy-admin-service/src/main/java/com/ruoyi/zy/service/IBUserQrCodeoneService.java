package com.ruoyi.zy.service;

import com.ruoyi.zy.domain.BUserQrCodeone;
import java.util.List;

/**
 * 收款码管理Service接口
 * 
 * @author ruoyi
 * @date 2019-12-12
 */
public interface IBUserQrCodeoneService 
{
    /**
     * 查询收款码管理
     * 
     * @param id 收款码管理ID
     * @return 收款码管理
     */
    public BUserQrCodeone selectBUserQrCodeoneById(Long id);

    /**
     * 查询收款码管理列表
     * 
     * @param bUserQrCodeone 收款码管理
     * @return 收款码管理集合
     */
    public List<BUserQrCodeone> selectBUserQrCodeoneList(BUserQrCodeone bUserQrCodeone);

    /**
     * 新增收款码管理
     * 
     * @param bUserQrCodeone 收款码管理
     * @return 结果
     */
    public int insertBUserQrCodeone(BUserQrCodeone bUserQrCodeone);

    /**
     * 修改收款码管理
     * 
     * @param bUserQrCodeone 收款码管理
     * @return 结果
     */
    public int updateBUserQrCodeone(BUserQrCodeone bUserQrCodeone);

    /**
     * 批量删除收款码管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBUserQrCodeoneByIds(String ids);

    /**
     * 删除收款码管理信息
     * 
     * @param id 收款码管理ID
     * @return 结果
     */
    public int deleteBUserQrCodeoneById(Long id);
}
