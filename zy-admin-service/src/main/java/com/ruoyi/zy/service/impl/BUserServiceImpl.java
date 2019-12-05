package com.ruoyi.zy.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.BUserMapper;
import com.ruoyi.zy.domain.BUser;
import com.ruoyi.zy.service.IBUserService;
import com.ruoyi.common.core.text.Convert;

/**
 * 用户管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
@Service
public class BUserServiceImpl implements IBUserService 
{
    @Autowired
    private BUserMapper bUserMapper;

    /**
     * 查询用户管理
     * 
     * @param id 用户管理ID
     * @return 用户管理
     */
    @Override
    public BUser selectBUserById(Long id)
    {
        return bUserMapper.selectBUserById(id);
    }

    /**
     * 查询用户管理列表
     * 
     * @param bUser 用户管理
     * @return 用户管理
     */
    @Override
    public List<BUser> selectBUserList(BUser bUser)
    {
        return bUserMapper.selectBUserList(bUser);
    }

    /**
     * 新增用户管理
     * 
     * @param bUser 用户管理
     * @return 结果
     */
    @Override
    public int insertBUser(BUser bUser)
    {
        return bUserMapper.insertBUser(bUser);
    }

    /**
     * 修改用户管理
     * 
     * @param bUser 用户管理
     * @return 结果
     */
    @Override
    public int updateBUser(BUser bUser)
    {
        return bUserMapper.updateBUser(bUser);
    }

    /**
     * 删除用户管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBUserByIds(String ids)
    {
        return bUserMapper.deleteBUserByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除用户管理信息
     * 
     * @param id 用户管理ID
     * @return 结果
     */
    @Override
    public int deleteBUserById(Long id)
    {
        return bUserMapper.deleteBUserById(id);
    }
}
