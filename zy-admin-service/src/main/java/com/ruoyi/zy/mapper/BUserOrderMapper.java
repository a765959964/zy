package com.ruoyi.zy.mapper;

import com.ruoyi.zy.domain.BUserOrder;
import java.util.List;

/**
 * 用户订单记录Mapper接口
 * 
 * @author zy
 * @date 2020-02-02
 */
public interface BUserOrderMapper 
{
    /**
     * 查询用户订单记录
     * 
     * @param id 用户订单记录ID
     * @return 用户订单记录
     */
    public BUserOrder selectBUserOrderById(Long id);

    /**
     * 查询用户订单记录列表
     * 
     * @param bUserOrder 用户订单记录
     * @return 用户订单记录集合
     */
    public List<BUserOrder> selectBUserOrderList(BUserOrder bUserOrder);

    /**
     * 新增用户订单记录
     * 
     * @param bUserOrder 用户订单记录
     * @return 结果
     */
    public int insertBUserOrder(BUserOrder bUserOrder);

    /**
     * 修改用户订单记录
     * 
     * @param bUserOrder 用户订单记录
     * @return 结果
     */
    public int updateBUserOrder(BUserOrder bUserOrder);

    /**
     * 删除用户订单记录
     * 
     * @param id 用户订单记录ID
     * @return 结果
     */
    public int deleteBUserOrderById(Long id);

    /**
     * 批量删除用户订单记录
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBUserOrderByIds(String[] ids);
}
