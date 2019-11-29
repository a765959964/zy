package com.ruoyi.zy.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.UserDepositMapper;
import com.ruoyi.zy.domain.UserDeposit;
import com.ruoyi.zy.service.IUserDepositService;
import com.ruoyi.common.core.text.Convert;

/**
 * 缴纳保证金记录Service业务层处理
 * 
 * @author zf
 * @date 2019-11-28
 */
@Service
public class UserDepositServiceImpl implements IUserDepositService 
{
    @Autowired
    private UserDepositMapper userDepositMapper;

    /**
     * 查询缴纳保证金记录
     * 
     * @param id 缴纳保证金记录ID
     * @return 缴纳保证金记录
     */
    @Override
    public UserDeposit selectUserDepositById(Long id)
    {
        return userDepositMapper.selectUserDepositById(id);
    }

    /**
     * 查询缴纳保证金记录列表
     * 
     * @param userDeposit 缴纳保证金记录
     * @return 缴纳保证金记录
     */
    @Override
    public List<UserDeposit> selectUserDepositList(UserDeposit userDeposit)
    {
        return userDepositMapper.selectUserDepositList(userDeposit);
    }

    /**
     * 新增缴纳保证金记录
     * 
     * @param userDeposit 缴纳保证金记录
     * @return 结果
     */
    @Override
    public int insertUserDeposit(UserDeposit userDeposit)
    {
        userDeposit.setCreateTime(DateUtils.getNowDate());
        return userDepositMapper.insertUserDeposit(userDeposit);
    }

    /**
     * 修改缴纳保证金记录
     * 
     * @param userDeposit 缴纳保证金记录
     * @return 结果
     */
    @Override
    public int updateUserDeposit(UserDeposit userDeposit)
    {
        return userDepositMapper.updateUserDeposit(userDeposit);
    }

    /**
     * 删除缴纳保证金记录对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteUserDepositByIds(String ids)
    {
        return userDepositMapper.deleteUserDepositByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除缴纳保证金记录信息
     * 
     * @param id 缴纳保证金记录ID
     * @return 结果
     */
    @Override
    public int deleteUserDepositById(Long id)
    {
        return userDepositMapper.deleteUserDepositById(id);
    }
}
