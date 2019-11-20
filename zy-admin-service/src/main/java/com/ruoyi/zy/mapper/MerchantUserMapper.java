package com.ruoyi.zy.mapper;

import com.ruoyi.zy.domain.MerchantUser;
import java.util.List;

/**
 * 商户用户信息Mapper接口
 * 
 * @author zy
 * @date 2019-11-20
 */
public interface MerchantUserMapper 
{
    /**
     * 查询商户用户信息
     * 
     * @param id 商户用户信息ID
     * @return 商户用户信息
     */
    public MerchantUser selectMerchantUserById(Long id);

    /**
     * 查询商户用户信息列表
     * 
     * @param merchantUser 商户用户信息
     * @return 商户用户信息集合
     */
    public List<MerchantUser> selectMerchantUserList(MerchantUser merchantUser);

    /**
     * 新增商户用户信息
     * 
     * @param merchantUser 商户用户信息
     * @return 结果
     */
    public int insertMerchantUser(MerchantUser merchantUser);

    /**
     * 修改商户用户信息
     * 
     * @param merchantUser 商户用户信息
     * @return 结果
     */
    public int updateMerchantUser(MerchantUser merchantUser);

    /**
     * 删除商户用户信息
     * 
     * @param id 商户用户信息ID
     * @return 结果
     */
    public int deleteMerchantUserById(Long id);

    /**
     * 批量删除商户用户信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteMerchantUserByIds(String[] ids);
}
