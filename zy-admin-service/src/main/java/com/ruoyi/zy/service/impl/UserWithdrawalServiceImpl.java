package com.ruoyi.zy.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.UserWithdrawalMapper;
import com.ruoyi.zy.domain.UserWithdrawal;
import com.ruoyi.zy.service.IUserWithdrawalService;
import com.ruoyi.common.core.text.Convert;

/**
 * 用户提款记录Service业务层处理
 * 
 * @author zf
 * @date 2019-11-28
 */
@Service
public class UserWithdrawalServiceImpl implements IUserWithdrawalService 
{
    @Autowired
    private UserWithdrawalMapper userWithdrawalMapper;

    /**
     * 查询用户提款记录
     * 
     * @param id 用户提款记录ID
     * @return 用户提款记录
     */
    @Override
    public UserWithdrawal selectUserWithdrawalById(Long id)
    {
        return userWithdrawalMapper.selectUserWithdrawalById(id);
    }

    /**
     * 查询用户提款记录列表
     * 
     * @param userWithdrawal 用户提款记录
     * @return 用户提款记录
     */
    @Override
    public List<UserWithdrawal> selectUserWithdrawalList(UserWithdrawal userWithdrawal)
    {
        return userWithdrawalMapper.selectUserWithdrawalList(userWithdrawal);
    }

    /**
     * 新增用户提款记录
     * 
     * @param userWithdrawal 用户提款记录
     * @return 结果
     */
    @Override
    public int insertUserWithdrawal(UserWithdrawal userWithdrawal)
    {
        userWithdrawal.setCreateTime(DateUtils.getNowDate());
        return userWithdrawalMapper.insertUserWithdrawal(userWithdrawal);
    }

    /**
     * 修改用户提款记录
     * 
     * @param userWithdrawal 用户提款记录
     * @return 结果
     */
    @Override
    public int updateUserWithdrawal(UserWithdrawal userWithdrawal)
    {
        return userWithdrawalMapper.updateUserWithdrawal(userWithdrawal);
    }

    /**
     * 删除用户提款记录对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteUserWithdrawalByIds(String ids)
    {
        return userWithdrawalMapper.deleteUserWithdrawalByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除用户提款记录信息
     * 
     * @param id 用户提款记录ID
     * @return 结果
     */
    @Override
    public int deleteUserWithdrawalById(Long id)
    {
        return userWithdrawalMapper.deleteUserWithdrawalById(id);
    }
}
