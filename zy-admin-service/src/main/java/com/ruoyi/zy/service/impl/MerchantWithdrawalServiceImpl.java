package com.ruoyi.zy.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.MerchantWithdrawalMapper;
import com.ruoyi.zy.domain.MerchantWithdrawal;
import com.ruoyi.zy.service.IMerchantWithdrawalService;
import com.ruoyi.common.core.text.Convert;

/**
 * 提款记录Service业务层处理
 * 
 * @author zy
 * @date 2020-02-04
 */
@Service
public class MerchantWithdrawalServiceImpl implements IMerchantWithdrawalService 
{
    @Autowired
    private MerchantWithdrawalMapper merchantWithdrawalMapper;

    /**
     * 查询提款记录
     * 
     * @param id 提款记录ID
     * @return 提款记录
     */
    @Override
    public MerchantWithdrawal selectMerchantWithdrawalById(Long id)
    {
        return merchantWithdrawalMapper.selectMerchantWithdrawalById(id);
    }

    /**
     * 查询提款记录列表
     * 
     * @param merchantWithdrawal 提款记录
     * @return 提款记录
     */
    @Override
    public List<MerchantWithdrawal> selectMerchantWithdrawalList(MerchantWithdrawal merchantWithdrawal)
    {
        return merchantWithdrawalMapper.selectMerchantWithdrawalList(merchantWithdrawal);
    }

    /**
     * 新增提款记录
     * 
     * @param merchantWithdrawal 提款记录
     * @return 结果
     */
    @Override
    public int insertMerchantWithdrawal(MerchantWithdrawal merchantWithdrawal)
    {
        merchantWithdrawal.setCreateTime(DateUtils.getNowDate());
        return merchantWithdrawalMapper.insertMerchantWithdrawal(merchantWithdrawal);
    }

    /**
     * 修改提款记录
     * 
     * @param merchantWithdrawal 提款记录
     * @return 结果
     */
    @Override
    public int updateMerchantWithdrawal(MerchantWithdrawal merchantWithdrawal)
    {
        return merchantWithdrawalMapper.updateMerchantWithdrawal(merchantWithdrawal);
    }

    /**
     * 删除提款记录对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMerchantWithdrawalByIds(String ids)
    {
        return merchantWithdrawalMapper.deleteMerchantWithdrawalByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除提款记录信息
     * 
     * @param id 提款记录ID
     * @return 结果
     */
    @Override
    public int deleteMerchantWithdrawalById(Long id)
    {
        return merchantWithdrawalMapper.deleteMerchantWithdrawalById(id);
    }
}
