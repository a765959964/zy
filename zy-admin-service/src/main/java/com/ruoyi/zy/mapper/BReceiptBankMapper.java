package com.ruoyi.zy.mapper;

import java.util.List;

import com.ruoyi.zy.domain.BReceiptBank;

/**
 * 【请填写功能名称】Mapper接口
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
public interface BReceiptBankMapper 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 【请填写功能名称】
     */
    public BReceiptBank selectBReceiptBankById(Long id);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param bReceiptBank 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<BReceiptBank> selectBReceiptBankList(BReceiptBank bReceiptBank);

    /**
     * 新增【请填写功能名称】
     * 
     * @param bReceiptBank 【请填写功能名称】
     * @return 结果
     */
    public int insertBReceiptBank(BReceiptBank bReceiptBank);

    /**
     * 修改【请填写功能名称】
     * 
     * @param bReceiptBank 【请填写功能名称】
     * @return 结果
     */
    public int updateBReceiptBank(BReceiptBank bReceiptBank);

    /**
     * 删除【请填写功能名称】
     * 
     * @param id 【请填写功能名称】ID
     * @return 结果
     */
    public int deleteBReceiptBankById(Long id);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBReceiptBankByIds(String[] ids);
}
