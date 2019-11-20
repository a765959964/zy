package com.ruoyi.zy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.zy.domain.BReceiptBank;
import com.ruoyi.zy.mapper.BReceiptBankMapper;
import com.ruoyi.zy.service.IBReceiptBankService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
@Service
public class BReceiptBankServiceImpl implements IBReceiptBankService 
{
    @Autowired
    private BReceiptBankMapper bReceiptBankMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    @Override
    public BReceiptBank selectBReceiptBankById(Long id)
    {
        return bReceiptBankMapper.selectBReceiptBankById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param bReceiptBank 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<BReceiptBank> selectBReceiptBankList(BReceiptBank bReceiptBank)
    {
        return bReceiptBankMapper.selectBReceiptBankList(bReceiptBank);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param bReceiptBank 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertBReceiptBank(BReceiptBank bReceiptBank)
    {
        bReceiptBank.setCreateTime(DateUtils.getNowDate());
        return bReceiptBankMapper.insertBReceiptBank(bReceiptBank);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param bReceiptBank 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateBReceiptBank(BReceiptBank bReceiptBank)
    {
        bReceiptBank.setUpdateTime(DateUtils.getNowDate());
        return bReceiptBankMapper.updateBReceiptBank(bReceiptBank);
    }

    /**
     * 删除【请填写功能名称】对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBReceiptBankByIds(String ids)
    {
        return bReceiptBankMapper.deleteBReceiptBankByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    @Override
    public int deleteBReceiptBankById(Long id)
    {
        return bReceiptBankMapper.deleteBReceiptBankById(id);
    }
}
