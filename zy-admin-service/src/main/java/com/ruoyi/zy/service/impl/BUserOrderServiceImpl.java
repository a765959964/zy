package com.ruoyi.zy.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.zy.domain.BUserOrder;
import com.ruoyi.zy.mapper.BUserOrderMapper;
import com.ruoyi.zy.service.IBUserOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 用户订单记录Service业务层处理
 * 
 * @author zy
 * @date 2020-02-02
 */
@Service
public class BUserOrderServiceImpl implements IBUserOrderService 
{
    @Autowired
    private BUserOrderMapper bUserOrderMapper;

    
    /**
     * 查询用户订单记录
     * 
     * @param orderNo
     * @return 用户订单记录
     */
    @Override
    public BUserOrder selectBUserOrderByOrderNo(String orderNo)
    {
        return bUserOrderMapper.selectBUserOrderByOrderNo(orderNo);
    }
    
    /**
     * 查询用户订单记录
     * 
     * @param id 用户订单记录ID
     * @return 用户订单记录
     */
    @Override
    public BUserOrder selectBUserOrderById(Long id)
    {
        return bUserOrderMapper.selectBUserOrderById(id);
    }

    /**
     * 查询用户订单记录列表
     * 
     * @param bUserOrder 用户订单记录
     * @return 用户订单记录
     */
    @Override
    public List<BUserOrder> selectBUserOrderList(BUserOrder bUserOrder)
    {
        return bUserOrderMapper.selectBUserOrderList(bUserOrder);
    }

    @Override
    public List getOrderMoneyList(Map params) {
        return bUserOrderMapper.getOrderMoneyList(params);
    }

    /**
     * 新增用户订单记录
     * 
     * @param bUserOrder 用户订单记录
     * @return 结果
     */
    @Override
    public int insertBUserOrder(BUserOrder bUserOrder)
    {
        bUserOrder.setCreateTime(DateUtils.getNowDate());
        return bUserOrderMapper.insertBUserOrder(bUserOrder);
    }

    /**
     * 修改用户订单记录
     * 
     * @param bUserOrder 用户订单记录
     * @return 结果
     */
    @Override
    public int updateBUserOrder(BUserOrder bUserOrder)
    {
        return bUserOrderMapper.updateBUserOrder(bUserOrder);
    }

    /**
     * 删除用户订单记录对象
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
     * 删除用户订单记录信息
     * 
     * @param id 用户订单记录ID
     * @return 结果
     */
    @Override
    public int deleteBUserOrderById(Long id)
    {
        return bUserOrderMapper.deleteBUserOrderById(id);
    }
}
