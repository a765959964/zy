package com.ruoyi.zy.service;

import com.ruoyi.zy.domain.UserQrCodeone;
import java.util.List;

/**
 * 收款码管理Service接口
 * 
 * @author zy
 * @date 2020-01-08
 */
public interface IUserQrCodeoneService 
{
    /**
     * 查询收款码管理
     * 
     * @param id 收款码管理ID
     * @return 收款码管理
     */
    public UserQrCodeone selectUserQrCodeoneById(Long id);

    /**
     * 查询收款码管理列表
     * 
     * @param userQrCodeone 收款码管理
     * @return 收款码管理集合
     */
    public List<UserQrCodeone> selectUserQrCodeoneList(UserQrCodeone userQrCodeone);

    /**
     * 新增收款码管理
     * 
     * @param userQrCodeone 收款码管理
     * @return 结果
     */
    public int insertUserQrCodeone(UserQrCodeone userQrCodeone);

    /**
     * 修改收款码管理
     * 
     * @param userQrCodeone 收款码管理
     * @return 结果
     */
    public int updateUserQrCodeone(UserQrCodeone userQrCodeone);

    /**
     * 批量删除收款码管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserQrCodeoneByIds(String ids);

    /**
     * 删除收款码管理信息
     * 
     * @param id 收款码管理ID
     * @return 结果
     */
    public int deleteUserQrCodeoneById(Long id);
}
