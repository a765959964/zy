package com.ruoyi.zy.service;

import com.ruoyi.zy.domain.BMerchant;
import java.util.List;

/**
 * 商户信息Service接口
 * 
 * @author zy
 * @date 2019-11-21
 */
public interface IBMerchantService 
{
	
	/**
     * 查询商户信息
     * 
     * @param merchant_no
     * @return 商户信息
     */
    public BMerchant selectByMerchatNo(String merchantNo);
	
    /**
     * 查询商户信息
     * 
     * @param id 商户信息ID
     * @return 商户信息
     */
    public BMerchant selectBMerchantById(Long id);

    /**
     * 查询商户信息列表
     * 
     * @param bMerchant 商户信息
     * @return 商户信息集合
     */
    public List<BMerchant> selectBMerchantList(BMerchant bMerchant);

    /**
     * 新增商户信息
     * 
     * @param bMerchant 商户信息
     * @return 结果
     */
    public int insertBMerchant(BMerchant bMerchant);

    /**
     * 修改商户信息
     * 
     * @param bMerchant 商户信息
     * @return 结果
     */
    public int updateBMerchant(BMerchant bMerchant);

    /**
     * 批量删除商户信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBMerchantByIds(String ids);

    /**
     * 删除商户信息信息
     * 
     * @param id 商户信息ID
     * @return 结果
     */
    public int deleteBMerchantById(Long id);
}
