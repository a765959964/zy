package com.ruoyi.zy.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.BMerchantMapper;
import com.ruoyi.zy.domain.BMerchant;
import com.ruoyi.zy.service.IBMerchantService;
import com.ruoyi.common.core.text.Convert;

/**
 * 商户信息Service业务层处理
 * 
 * @author zy
 * @date 2019-11-21
 */
@Service
public class BMerchantServiceImpl implements IBMerchantService 
{
    @Autowired
    private BMerchantMapper bMerchantMapper;

    /**
     * 查询商户信息
     * 
     * @param id 商户信息ID
     * @return 商户信息
     */
    @Override
    public BMerchant selectBMerchantById(Long id)
    {
        return bMerchantMapper.selectBMerchantById(id);
    }

    /**
     * 查询商户信息列表
     * 
     * @param bMerchant 商户信息
     * @return 商户信息
     */
    @Override
    public List<BMerchant> selectBMerchantList(BMerchant bMerchant)
    {
        return bMerchantMapper.selectBMerchantList(bMerchant);
    }

    /**
     * 新增商户信息
     * 
     * @param bMerchant 商户信息
     * @return 结果
     */
    @Override
    public int insertBMerchant(BMerchant bMerchant)
    {
        bMerchant.setCreateTime(DateUtils.getNowDate());
        return bMerchantMapper.insertBMerchant(bMerchant);
    }

    /**
     * 修改商户信息
     * 
     * @param bMerchant 商户信息
     * @return 结果
     */
    @Override
    public int updateBMerchant(BMerchant bMerchant)
    {
        return bMerchantMapper.updateBMerchant(bMerchant);
    }

    /**
     * 删除商户信息对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBMerchantByIds(String ids)
    {
        return bMerchantMapper.deleteBMerchantByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除商户信息信息
     * 
     * @param id 商户信息ID
     * @return 结果
     */
    @Override
    public int deleteBMerchantById(Long id)
    {
        return bMerchantMapper.deleteBMerchantById(id);
    }
}
