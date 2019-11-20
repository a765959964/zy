package com.ruoyi.zy.service;

import com.ruoyi.zy.domain.MerchantOrder;
import java.util.List;

/**
 * 商户订单记录Service接口
 * 
 * @author zy
 * @date 2019-11-20
 */
public interface IMerchantOrderService 
{
    /**
     * 查询商户订单记录
     * 
     * @param id 商户订单记录ID
     * @return 商户订单记录
     */
    public MerchantOrder selectMerchantOrderById(Long id);

    /**
     * 查询商户订单记录列表
     * 
     * @param merchantOrder 商户订单记录
     * @return 商户订单记录集合
     */
    public List<MerchantOrder> selectMerchantOrderList(MerchantOrder merchantOrder);

    /**
     * 新增商户订单记录
     * 
     * @param merchantOrder 商户订单记录
     * @return 结果
     */
    public int insertMerchantOrder(MerchantOrder merchantOrder);

    /**
     * 修改商户订单记录
     * 
     * @param merchantOrder 商户订单记录
     * @return 结果
     */
    public int updateMerchantOrder(MerchantOrder merchantOrder);

    /**
     * 批量删除商户订单记录
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMerchantOrderByIds(String ids);

    /**
     * 删除商户订单记录信息
     * 
     * @param id 商户订单记录ID
     * @return 结果
     */
    public int deleteMerchantOrderById(Long id);
}
