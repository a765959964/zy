package com.ruoyi.zy.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.BUserOrderMapper;
import com.ruoyi.zy.domain.BUserOrder;
import com.ruoyi.zy.service.IBUserOrderService;
import com.ruoyi.common.core.text.Convert;

/**
 * 交易记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
@Service
public class BUserOrderServiceImpl implements IBUserOrderService 
{
    @Autowired
    private BUserOrderMapper bUserOrderMapper;

    /**
     * 查询交易记录
     * 
     * @param id 交易记录ID
     * @return 交易记录
     */
    @Override
    public BUserOrder selectBUserOrderById(Long id)
    {
        return bUserOrderMapper.selectBUserOrderById(id);
    }

    /**
     * 查询交易记录列表
     * 
     * @param bUserOrder 交易记录
     * @return 交易记录
     */
    @Override
    public List<BUserOrder> selectBUserOrderList(BUserOrder bUserOrder)
    {
        return bUserOrderMapper.selectBUserOrderList(bUserOrder);
    }

    /**
     * 新增交易记录
     * 
     * @param bUserOrder 交易记录
     * @return 结果
     */
    @Override
    public int insertBUserOrder(BUserOrder bUserOrder)
    {
        bUserOrder.setCreateTime(DateUtils.getNowDate());
        return bUserOrderMapper.insertBUserOrder(bUserOrder);
    }

    /**
     * 修改交易记录
     * 
     * @param bUserOrder 交易记录
     * @return 结果
     */
    @Override
    public int updateBUserOrder(BUserOrder bUserOrder)
    {
        return bUserOrderMapper.updateBUserOrder(bUserOrder);
    }

    /**
     * 删除交易记录对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBUserOrderByIds(String ids)
    {
        return bUserOrderMapper.deleteBUserOrderByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除交易记录信息
     * 
     * @param id 交易记录ID
     * @return 结果
     */
    @Override
    public int deleteBUserOrderById(Long id)
    {
        return bUserOrderMapper.deleteBUserOrderById(id);
    }
}
