package com.ruoyi.zy.service;

import com.ruoyi.zy.domain.BUserReceipt;
import java.util.List;

/**
 * 收款次数Service接口
 * 
 * @author ruoyi
 * @date 2019-12-17
 */
public interface IBUserReceiptService 
{
    /**
     * 查询收款次数
     * 
     * @param id 收款次数ID
     * @return 收款次数
     */
    public BUserReceipt selectBUserReceiptById(Long id);

    /**
     * 查询收款次数列表
     * 
     * @param bUserReceipt 收款次数
     * @return 收款次数集合
     */
    public List<BUserReceipt> selectBUserReceiptList(BUserReceipt bUserReceipt);

    /**
     * 新增收款次数
     * 
     * @param bUserReceipt 收款次数
     * @return 结果
     */
    public int insertBUserReceipt(BUserReceipt bUserReceipt);

    /**
     * 修改收款次数
     * 
     * @param bUserReceipt 收款次数
     * @return 结果
     */
    public int updateBUserReceipt(BUserReceipt bUserReceipt);

    /**
     * 批量删除收款次数
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBUserReceiptByIds(String ids);

    /**
     * 删除收款次数信息
     * 
     * @param id 收款次数ID
     * @return 结果
     */
    public int deleteBUserReceiptById(Long id);
}
