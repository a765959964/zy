package com.ruoyi.zy.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.ReceiptBankMapper;
import com.ruoyi.zy.domain.ReceiptBank;
import com.ruoyi.zy.service.IReceiptBankService;
import com.ruoyi.common.core.text.Convert;

/**
 * 银行收据Service业务层处理
 * 
 * @author zf
 * @date 2019-11-28
 */
@Service
public class ReceiptBankServiceImpl implements IReceiptBankService 
{
    @Autowired
    private ReceiptBankMapper receiptBankMapper;

    /**
     * 查询银行收据
     * 
     * @param id 银行收据ID
     * @return 银行收据
     */
    @Override
    public ReceiptBank selectReceiptBankById(Long id)
    {
        return receiptBankMapper.selectReceiptBankById(id);
    }

    /**
     * 查询银行收据列表
     * 
     * @param receiptBank 银行收据
     * @return 银行收据
     */
    @Override
    public List<ReceiptBank> selectReceiptBankList(ReceiptBank receiptBank)
    {
        return receiptBankMapper.selectReceiptBankList(receiptBank);
    }

    /**
     * 新增银行收据
     * 
     * @param receiptBank 银行收据
     * @return 结果
     */
    @Override
    public int insertReceiptBank(ReceiptBank receiptBank)
    {
        receiptBank.setCreateTime(DateUtils.getNowDate());
        return receiptBankMapper.insertReceiptBank(receiptBank);
    }

    /**
     * 修改银行收据
     * 
     * @param receiptBank 银行收据
     * @return 结果
     */
    @Override
    public int updateReceiptBank(ReceiptBank receiptBank)
    {
        receiptBank.setUpdateTime(DateUtils.getNowDate());
        return receiptBankMapper.updateReceiptBank(receiptBank);
    }

    /**
     * 删除银行收据对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteReceiptBankByIds(String ids)
    {
        return receiptBankMapper.deleteReceiptBankByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除银行收据信息
     * 
     * @param id 银行收据ID
     * @return 结果
     */
    @Override
    public int deleteReceiptBankById(Long id)
    {
        return receiptBankMapper.deleteReceiptBankById(id);
    }
}
