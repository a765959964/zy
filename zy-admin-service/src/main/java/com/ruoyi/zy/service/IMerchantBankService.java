package com.ruoyi.zy.service;

import com.ruoyi.zy.domain.MerchantBank;
import java.util.List;

/**
 * 商户银行卡Service接口
 * 
 * @author zy
 * @date 2019-12-18
 */
public interface IMerchantBankService 
{
    /**
     * 查询商户银行卡
     * 
     * @param id 商户银行卡ID
     * @return 商户银行卡
     */
    public MerchantBank selectMerchantBankById(Long id);

    /**
     * 查询商户银行卡列表
     * 
     * @param merchantBank 商户银行卡
     * @return 商户银行卡集合
     */
    public List<MerchantBank> selectMerchantBankList(MerchantBank merchantBank);

    /**
     * 新增商户银行卡
     * 
     * @param merchantBank 商户银行卡
     * @return 结果
     */
    public int insertMerchantBank(MerchantBank merchantBank);

    /**
     * 修改商户银行卡
     * 
     * @param merchantBank 商户银行卡
     * @return 结果
     */
    public int updateMerchantBank(MerchantBank merchantBank);

    /**
     * 批量删除商户银行卡
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMerchantBankByIds(String ids);

    /**
     * 删除商户银行卡信息
     * 
     * @param id 商户银行卡ID
     * @return 结果
     */
    public int deleteMerchantBankById(Long id);
}
