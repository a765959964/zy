package com.ruoyi.zy.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.UserQrCodeoneMapper;
import com.ruoyi.zy.domain.UserQrCodeone;
import com.ruoyi.zy.service.IUserQrCodeoneService;
import com.ruoyi.common.core.text.Convert;

/**
 * 收款码管理Service业务层处理
 * 
 * @author zy
 * @date 2020-01-08
 */
@Service
public class UserQrCodeoneServiceImpl implements IUserQrCodeoneService 
{
    @Autowired
    private UserQrCodeoneMapper userQrCodeoneMapper;

    /**
     * 查询收款码管理
     * 
     * @param id 收款码管理ID
     * @return 收款码管理
     */
    @Override
    public UserQrCodeone selectUserQrCodeoneById(Long id)
    {
        return userQrCodeoneMapper.selectUserQrCodeoneById(id);
    }

    /**
     * 查询收款码管理列表
     * 
     * @param userQrCodeone 收款码管理
     * @return 收款码管理
     */
    @Override
    public List<UserQrCodeone> selectUserQrCodeoneList(UserQrCodeone userQrCodeone)
    {
        return userQrCodeoneMapper.selectUserQrCodeoneList(userQrCodeone);
    }

    /**
     * 新增收款码管理
     * 
     * @param userQrCodeone 收款码管理
     * @return 结果
     */
    @Override
    public int insertUserQrCodeone(UserQrCodeone userQrCodeone)
    {
        userQrCodeone.setCreateTime(DateUtils.getNowDate());
        return userQrCodeoneMapper.insertUserQrCodeone(userQrCodeone);
    }

    /**
     * 修改收款码管理
     * 
     * @param userQrCodeone 收款码管理
     * @return 结果
     */
    @Override
    public int updateUserQrCodeone(UserQrCodeone userQrCodeone)
    {
        return userQrCodeoneMapper.updateUserQrCodeone(userQrCodeone);
    }

    /**
     * 删除收款码管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteUserQrCodeoneByIds(String ids)
    {
        return userQrCodeoneMapper.deleteUserQrCodeoneByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除收款码管理信息
     * 
     * @param id 收款码管理ID
     * @return 结果
     */
    @Override
    public int deleteUserQrCodeoneById(Long id)
    {
        return userQrCodeoneMapper.deleteUserQrCodeoneById(id);
    }
}
