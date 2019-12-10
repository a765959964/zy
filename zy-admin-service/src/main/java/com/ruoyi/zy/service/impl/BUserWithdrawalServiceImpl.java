package com.ruoyi.zy.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.BUserWithdrawalMapper;
import com.ruoyi.zy.domain.BUserWithdrawal;
import com.ruoyi.zy.service.IBUserWithdrawalService;
import com.ruoyi.common.core.text.Convert;

/**
 * 用户提款记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
@Service
public class BUserWithdrawalServiceImpl implements IBUserWithdrawalService 
{
    @Autowired
    private BUserWithdrawalMapper bUserWithdrawalMapper;

    /**
     * 查询用户提款记录
     * 
     * @param id 用户提款记录ID
     * @return 用户提款记录
     */
    @Override
    public BUserWithdrawal selectBUserWithdrawalById(Long id)
    {
        return bUserWithdrawalMapper.selectBUserWithdrawalById(id);
    }

    /**
     * 查询用户提款记录列表
     * 
     * @param bUserWithdrawal 用户提款记录
     * @return 用户提款记录
     */
    @Override
    public List<BUserWithdrawal> selectBUserWithdrawalList(BUserWithdrawal bUserWithdrawal)
    {
        return bUserWithdrawalMapper.selectBUserWithdrawalList(bUserWithdrawal);
    }

    /**
     * 新增用户提款记录
     * 
     * @param bUserWithdrawal 用户提款记录
     * @return 结果
     */
    @Override
    public int insertBUserWithdrawal(BUserWithdrawal bUserWithdrawal)
    {
        bUserWithdrawal.setCreateTime(DateUtils.getNowDate());
        return bUserWithdrawalMapper.insertBUserWithdrawal(bUserWithdrawal);
    }

    /**
     * 修改用户提款记录
     * 
     * @param bUserWithdrawal 用户提款记录
     * @return 结果
     */
    @Override
    public int updateBUserWithdrawal(BUserWithdrawal bUserWithdrawal)
    {
        return bUserWithdrawalMapper.updateBUserWithdrawal(bUserWithdrawal);
    }

    /**
     * 删除用户提款记录对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBUserWithdrawalByIds(String ids)
    {
        return bUserWithdrawalMapper.deleteBUserWithdrawalByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除用户提款记录信息
     * 
     * @param id 用户提款记录ID
     * @return 结果
     */
    @Override
    public int deleteBUserWithdrawalById(Long id)
    {
        return bUserWithdrawalMapper.deleteBUserWithdrawalById(id);
    }
}
