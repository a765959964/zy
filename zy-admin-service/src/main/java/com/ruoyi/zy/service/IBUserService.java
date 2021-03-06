package com.ruoyi.zy.service;

import com.ruoyi.zy.domain.BUser;
import java.util.List;

/**
 * 用户管理Service接口
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
public interface IBUserService 
{
	
	public BUser get(String paramString);
	
    /**
     * 查询用户管理
     * 
     * @param id 用户管理ID
     * @return 用户管理
     */
    public BUser selectBUserById(Long id);

    /**
     * 查询用户管理列表
     * 
     * @param bUser 用户管理
     * @return 用户管理集合
     */
    public List<BUser> selectBUserList(BUser bUser);

    /**
     * 新增用户管理
     * 
     * @param bUser 用户管理
     * @return 结果
     */
    public int insertBUser(BUser bUser);

    /**
     * 修改用户管理
     * 
     * @param bUser 用户管理
     * @return 结果
     */
    public int updateBUser(BUser bUser);

    /**
     * 批量删除用户管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBUserByIds(String ids);

    /**
     * 删除用户管理信息
     * 
     * @param id 用户管理ID
     * @return 结果
     */
    public int deleteBUserById(Long id);
}
