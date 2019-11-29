package com.ruoyi.zy.service;

import com.ruoyi.zy.domain.UserDeposit;
import java.util.List;

/**
 * 缴纳保证金记录Service接口
 * 
 * @author zf
 * @date 2019-11-28
 */
public interface IUserDepositService 
{
    /**
     * 查询缴纳保证金记录
     * 
     * @param id 缴纳保证金记录ID
     * @return 缴纳保证金记录
     */
    public UserDeposit selectUserDepositById(Long id);

    /**
     * 查询缴纳保证金记录列表
     * 
     * @param userDeposit 缴纳保证金记录
     * @return 缴纳保证金记录集合
     */
    public List<UserDeposit> selectUserDepositList(UserDeposit userDeposit);

    /**
     * 新增缴纳保证金记录
     * 
     * @param userDeposit 缴纳保证金记录
     * @return 结果
     */
    public int insertUserDeposit(UserDeposit userDeposit);

    /**
     * 修改缴纳保证金记录
     * 
     * @param userDeposit 缴纳保证金记录
     * @return 结果
     */
    public int updateUserDeposit(UserDeposit userDeposit);

    /**
     * 批量删除缴纳保证金记录
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteUserDepositByIds(String ids);

    /**
     * 删除缴纳保证金记录信息
     * 
     * @param id 缴纳保证金记录ID
     * @return 结果
     */
    public int deleteUserDepositById(Long id);
}
