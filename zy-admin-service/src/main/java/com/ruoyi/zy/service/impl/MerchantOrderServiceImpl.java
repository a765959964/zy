package com.ruoyi.zy.service.impl;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.zy.domain.MerchantOrder;
import com.ruoyi.zy.mapper.MerchantOrderMapper;
import com.ruoyi.zy.service.IMerchantOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 商户订单记录Service业务层处理
 * 
 * @author zy
 * @date 2019-11-20
 */
@Service
public class MerchantOrderServiceImpl implements IMerchantOrderService 
{
    @Autowired
    private MerchantOrderMapper merchantOrderMapper;

    /**
     * 查询商户订单记录
     * 
     * @param id 商户订单记录ID
     * @return 商户订单记录
     */
    @Override
    public MerchantOrder selectMerchantOrderById(Long id)
    {
        return merchantOrderMapper.selectMerchantOrderById(id);
    }

    /**
     * 查询商户订单记录列表
     * 
     * @param merchantOrder 商户订单记录
     * @return 商户订单记录
     */
    @Override
    public List<MerchantOrder> selectMerchantOrderList(MerchantOrder merchantOrder)
    {

        return merchantOrderMapper.selectMerchantOrderList(merchantOrder);
    }

    /**
     * 新增商户订单记录
     * 
     * @param merchantOrder 商户订单记录
     * @return 结果
     */
    @Override
    public int insertMerchantOrder(MerchantOrder merchantOrder)
    {
        merchantOrder.setCreateTime(DateUtils.getNowDate());
        return merchantOrderMapper.insertMerchantOrder(merchantOrder);
    }

    /**
     * 修改商户订单记录
     * 
     * @param merchantOrder 商户订单记录
     * @return 结果
     */
    @Override
    public int updateMerchantOrder(MerchantOrder merchantOrder)
    {
        merchantOrder.setUpdateTime(DateUtils.getNowDate());
        return merchantOrderMapper.updateMerchantOrder(merchantOrder);
    }

    /**
     * 删除商户订单记录对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMerchantOrderByIds(String ids)
    {
        return merchantOrderMapper.deleteMerchantOrderByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除商户订单记录信息
     * 
     * @param id 商户订单记录ID
     * @return 结果
     */
    @Override
    public int deleteMerchantOrderById(Long id)
    {
        return merchantOrderMapper.deleteMerchantOrderById(id);
    }
}
