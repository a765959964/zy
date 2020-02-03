package com.ruoyi.zy.service;

import com.ruoyi.zy.domain.MerchantWithdrawal;
import java.util.List;

/**
 * 提款记录Service接口
 * 
 * @author zy
 * @date 2020-02-04
 */
public interface IMerchantWithdrawalService 
{
    /**
     * 查询提款记录
     * 
     * @param id 提款记录ID
     * @return 提款记录
     */
    public MerchantWithdrawal selectMerchantWithdrawalById(Long id);

    /**
     * 查询提款记录列表
     * 
     * @param merchantWithdrawal 提款记录
     * @return 提款记录集合
     */
    public List<MerchantWithdrawal> selectMerchantWithdrawalList(MerchantWithdrawal merchantWithdrawal);

    /**
     * 新增提款记录
     * 
     * @param merchantWithdrawal 提款记录
     * @return 结果
     */
    public int insertMerchantWithdrawal(MerchantWithdrawal merchantWithdrawal);

    /**
     * 修改提款记录
     * 
     * @param merchantWithdrawal 提款记录
     * @return 结果
     */
    public int updateMerchantWithdrawal(MerchantWithdrawal merchantWithdrawal);

    /**
     * 批量删除提款记录
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMerchantWithdrawalByIds(String ids);

    /**
     * 删除提款记录信息
     * 
     * @param id 提款记录ID
     * @return 结果
     */
    public int deleteMerchantWithdrawalById(Long id);
}
