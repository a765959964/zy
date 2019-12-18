package com.ruoyi.zy.service;

import com.ruoyi.zy.domain.BUserDeposit;
import java.util.List;
import java.util.Map;

/**
 * 保证金记录Service接口
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
public interface IBUserDepositService 
{
	
	public List<BUserDeposit> available(Map<String, Object> paramMap);
	
	public List<BUserDeposit> findList(Map<String, Object> paramMap);
	
    /**
     * 查询保证金记录
     * 
     * @param id 保证金记录ID
     * @return 保证金记录
     */
    public BUserDeposit selectBUserDepositById(Long id);

    /**
     * 查询保证金记录列表
     * 
     * @param bUserDeposit 保证金记录
     * @return 保证金记录集合
     */
    public List<BUserDeposit> selectBUserDepositList(BUserDeposit bUserDeposit);

    /**
     * 新增保证金记录
     * 
     * @param bUserDeposit 保证金记录
     * @return 结果
     */
    public int insertBUserDeposit(BUserDeposit bUserDeposit);

    /**
     * 修改保证金记录
     * 
     * @param bUserDeposit 保证金记录
     * @return 结果
     */
    public int updateBUserDeposit(BUserDeposit bUserDeposit);

    /**
     * 批量删除保证金记录
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBUserDepositByIds(String ids);

    /**
     * 删除保证金记录信息
     * 
     * @param id 保证金记录ID
     * @return 结果
     */
    public int deleteBUserDepositById(Long id);
}
