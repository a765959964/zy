package com.ruoyi.zy.mapper;

import com.ruoyi.zy.domain.BUserOrder;
import java.util.List;

/**
 * 交易记录Mapper接口
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
public interface BUserOrderMapper 
{
    /**
     * 查询交易记录
     * 
     * @param id 交易记录ID
     * @return 交易记录
     */
    public BUserOrder selectBUserOrderById(Long id);

    /**
     * 查询交易记录列表
     * 
     * @param bUserOrder 交易记录
     * @return 交易记录集合
     */
    public List<BUserOrder> selectBUserOrderList(BUserOrder bUserOrder);

    /**
     * 新增交易记录
     * 
     * @param bUserOrder 交易记录
     * @return 结果
     */
    public int insertBUserOrder(BUserOrder bUserOrder);

    /**
     * 修改交易记录
     * 
     * @param bUserOrder 交易记录
     * @return 结果
     */
    public int updateBUserOrder(BUserOrder bUserOrder);

    /**
     * 删除交易记录
     * 
     * @param id 交易记录ID
     * @return 结果
     */
    public int deleteBUserOrderById(Long id);

    /**
     * 批量删除交易记录
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBUserOrderByIds(String[] ids);
}
