package com.ruoyi.zy.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.BUserDepositMapper;
import com.ruoyi.zy.domain.BUserDeposit;
import com.ruoyi.zy.service.IBUserDepositService;
import com.ruoyi.common.core.text.Convert;

/**
 * 保证金记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
@Service
public class BUserDepositServiceImpl implements IBUserDepositService 
{
    @Autowired
    private BUserDepositMapper bUserDepositMapper;

    /**
     * 查询保证金记录
     * 
     * @param id 保证金记录ID
     * @return 保证金记录
     */
    @Override
    public BUserDeposit selectBUserDepositById(Long id)
    {
        return bUserDepositMapper.selectBUserDepositById(id);
    }

    /**
     * 查询保证金记录列表
     * 
     * @param bUserDeposit 保证金记录
     * @return 保证金记录
     */
    @Override
    public List<BUserDeposit> selectBUserDepositList(BUserDeposit bUserDeposit)
    {
        return bUserDepositMapper.selectBUserDepositList(bUserDeposit);
    }

    /**
     * 新增保证金记录
     * 
     * @param bUserDeposit 保证金记录
     * @return 结果
     */
    @Override
    public int insertBUserDeposit(BUserDeposit bUserDeposit)
    {
        bUserDeposit.setCreateTime(DateUtils.getNowDate());
        return bUserDepositMapper.insertBUserDeposit(bUserDeposit);
    }

    /**
     * 修改保证金记录
     * 
     * @param bUserDeposit 保证金记录
     * @return 结果
     */
    @Override
    public int updateBUserDeposit(BUserDeposit bUserDeposit)
    {
        return bUserDepositMapper.updateBUserDeposit(bUserDeposit);
    }

    /**
     * 删除保证金记录对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBUserDepositByIds(String ids)
    {
        return bUserDepositMapper.deleteBUserDepositByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除保证金记录信息
     * 
     * @param id 保证金记录ID
     * @return 结果
     */
    @Override
    public int deleteBUserDepositById(Long id)
    {
        return bUserDepositMapper.deleteBUserDepositById(id);
    }
}
