package com.ruoyi.zy.service;

import com.ruoyi.zy.domain.UserWithdrawal;
import java.util.List;

/**
 * 用户提款记录Service接口
 * 
 * @author zf
 * @date 2019-11-28
 */
public interface IUserWithdrawalService 
{
    /**
     * 查询用户提款记录
     * 
     * @param id 用户提款记录ID
     * @return 用户提款记录
     */
    public UserWithdrawal selectUserWithdrawalById(Long id);

    /**
     * 查询用户提款记录列表
     * 
     * @param userWithdrawal 用户提款记录
     * @return 用户提款记录集合
     */
    public List<UserWithdrawal> selectUserWithdrawalList(UserWithdrawal userWithdrawal);

    /**
     * 新增用户提款记录
     * 
     * @param userWithdrawal 用户提款记录
     * @return 结果
     */
    public int insertUserWithdrawal(UserWithdrawal userWithdrawal);

    /**
     * 修改用户提款记录
     * 
     * @param userWithdrawal 用户提款记录
     * @return 结果
     */
    public int updateUserWithdrawal(UserWithdrawal userWithdrawal);

    /**
     * 批量删除用户提款记录
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserWithdrawalByIds(String ids);

    /**
     * 删除用户提款记录信息
     * 
     * @param id 用户提款记录ID
     * @return 结果
     */
    public int deleteUserWithdrawalById(Long id);
}
