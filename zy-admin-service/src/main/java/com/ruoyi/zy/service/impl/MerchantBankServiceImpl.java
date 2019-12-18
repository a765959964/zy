package com.ruoyi.zy.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.MerchantBankMapper;
import com.ruoyi.zy.domain.MerchantBank;
import com.ruoyi.zy.service.IMerchantBankService;
import com.ruoyi.common.core.text.Convert;

/**
 * 商户银行卡Service业务层处理
 * 
 * @author zy
 * @date 2019-12-18
 */
@Service
public class MerchantBankServiceImpl implements IMerchantBankService 
{
    @Autowired
    private MerchantBankMapper merchantBankMapper;

    /**
     * 查询商户银行卡
     * 
     * @param id 商户银行卡ID
     * @return 商户银行卡
     */
    @Override
    public MerchantBank selectMerchantBankById(Long id)
    {
        return merchantBankMapper.selectMerchantBankById(id);
    }

    /**
     * 查询商户银行卡列表
     * 
     * @param merchantBank 商户银行卡
     * @return 商户银行卡
     */
    @Override
    public List<MerchantBank> selectMerchantBankList(MerchantBank merchantBank)
    {
        return merchantBankMapper.selectMerchantBankList(merchantBank);
    }

    /**
     * 新增商户银行卡
     * 
     * @param merchantBank 商户银行卡
     * @return 结果
     */
    @Override
    public int insertMerchantBank(MerchantBank merchantBank)
    {
        merchantBank.setCreateTime(DateUtils.getNowDate());
        return merchantBankMapper.insertMerchantBank(merchantBank);
    }

    /**
     * 修改商户银行卡
     * 
     * @param merchantBank 商户银行卡
     * @return 结果
     */
    @Override
    public int updateMerchantBank(MerchantBank merchantBank)
    {
        merchantBank.setUpdateTime(DateUtils.getNowDate());
        return merchantBankMapper.updateMerchantBank(merchantBank);
    }

    /**
     * 删除商户银行卡对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMerchantBankByIds(String ids)
    {
        return merchantBankMapper.deleteMerchantBankByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除商户银行卡信息
     * 
     * @param id 商户银行卡ID
     * @return 结果
     */
    @Override
    public int deleteMerchantBankById(Long id)
    {
        return merchantBankMapper.deleteMerchantBankById(id);
    }
}
