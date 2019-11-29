package com.ruoyi.zy.mapper;

import com.ruoyi.zy.domain.ReceiptBank;
import java.util.List;

/**
 * 银行收据Mapper接口
 * 
 * @author zf
 * @date 2019-11-28
 */
public interface ReceiptBankMapper 
{
    /**
     * 查询银行收据
     * 
     * @param id 银行收据ID
     * @return 银行收据
     */
    public ReceiptBank selectReceiptBankById(Long id);

    /**
     * 查询银行收据列表
     * 
     * @param receiptBank 银行收据
     * @return 银行收据集合
     */
    public List<ReceiptBank> selectReceiptBankList(ReceiptBank receiptBank);

    /**
     * 新增银行收据
     * 
     * @param receiptBank 银行收据
     * @return 结果
     */
    public int insertReceiptBank(ReceiptBank receiptBank);

    /**
     * 修改银行收据
     * 
     * @param receiptBank 银行收据
     * @return 结果
     */
    public int updateReceiptBank(ReceiptBank receiptBank);

    /**
     * 删除银行收据
     * 
     * @param id 银行收据ID
     * @return 结果
     */
    public int deleteReceiptBankById(Long id);

    /**
     * 批量删除银行收据
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteReceiptBankByIds(String[] ids);
}
