package com.ruoyi.zy.service;

import com.ruoyi.zy.domain.BUserWithdrawal;
import java.util.List;

/**
 * 用户提款记录Service接口
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
public interface IBUserWithdrawalService 
{
    /**
     * 查询用户提款记录
     * 
     * @param id 用户提款记录ID
     * @return 用户提款记录
     */
    public BUserWithdrawal selectBUserWithdrawalById(Long id);

    /**
     * 查询用户提款记录列表
     * 
     * @param bUserWithdrawal 用户提款记录
     * @return 用户提款记录集合
     */
    public List<BUserWithdrawal> selectBUserWithdrawalList(BUserWithdrawal bUserWithdrawal);

    /**
     * 新增用户提款记录
     * 
     * @param bUserWithdrawal 用户提款记录
     * @return 结果
     */
    public int insertBUserWithdrawal(BUserWithdrawal bUserWithdrawal);

    /**
     * 修改用户提款记录
     * 
     * @param bUserWithdrawal 用户提款记录
     * @return 结果
     */
    public int updateBUserWithdrawal(BUserWithdrawal bUserWithdrawal);

    /**
     * 批量删除用户提款记录
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBUserWithdrawalByIds(String ids);

    /**
     * 删除用户提款记录信息
     * 
     * @param id 用户提款记录ID
     * @return 结果
     */
    public int deleteBUserWithdrawalById(Long id);
}
