package com.ruoyi.zy.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.MerchantUserMapper;
import com.ruoyi.zy.domain.MerchantUser;
import com.ruoyi.zy.service.IMerchantUserService;
import com.ruoyi.common.core.text.Convert;

/**
 * 商户用户信息Service业务层处理
 * 
 * @author zy
 * @date 2019-11-20
 */
@Service
public class MerchantUserServiceImpl implements IMerchantUserService 
{
    @Autowired
    private MerchantUserMapper merchantUserMapper;

    /**
     * 查询商户用户信息
     * 
     * @param id 商户用户信息ID
     * @return 商户用户信息
     */
    @Override
    public MerchantUser selectMerchantUserById(Long id)
    {
        return merchantUserMapper.selectMerchantUserById(id);
    }

    /**
     * 查询商户用户信息列表
     * 
     * @param merchantUser 商户用户信息
     * @return 商户用户信息
     */
    @Override
    public List<MerchantUser> selectMerchantUserList(MerchantUser merchantUser)
    {
        return merchantUserMapper.selectMerchantUserList(merchantUser);
    }

    /**
     * 新增商户用户信息
     * 
     * @param merchantUser 商户用户信息
     * @return 结果
     */
    @Override
    public int insertMerchantUser(MerchantUser merchantUser)
    {
        merchantUser.setCreateTime(DateUtils.getNowDate());
        return merchantUserMapper.insertMerchantUser(merchantUser);
    }

    /**
     * 修改商户用户信息
     * 
     * @param merchantUser 商户用户信息
     * @return 结果
     */
    @Override
    public int updateMerchantUser(MerchantUser merchantUser)
    {
        return merchantUserMapper.updateMerchantUser(merchantUser);
    }

    /**
     * 删除商户用户信息对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteMerchantUserByIds(String ids)
    {
        return merchantUserMapper.deleteMerchantUserByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除商户用户信息信息
     * 
     * @param id 商户用户信息ID
     * @return 结果
     */
    @Override
    public int deleteMerchantUserById(Long id)
    {
        return merchantUserMapper.deleteMerchantUserById(id);
    }
}
