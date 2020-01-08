package com.ruoyi.zy.mapper;

import com.ruoyi.zy.domain.UserQrCodeone;
import java.util.List;

/**
 * 收款码管理Mapper接口
 * 
 * @author zy
 * @date 2020-01-08
 */
public interface UserQrCodeoneMapper 
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
     * 删除收款码管理
     * 
     * @param id 收款码管理ID
     * @return 结果
     */
    public int deleteUserQrCodeoneById(Long id);

    /**
     * 批量删除收款码管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserQrCodeoneByIds(String[] ids);
}
