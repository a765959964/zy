package com.ruoyi.zy.mapper;

import com.ruoyi.zy.domain.BUserReceipt;
import java.util.List;
import java.util.Map;

/**
 * 收款次数Mapper接口
 * 
 * @author ruoyi
 * @date 2019-12-17
 */
public interface BUserReceiptMapper 
{
	
	public List<BUserReceipt> findList(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> minimumTimes(Map<String, Object> paramMap);
	
    /**
     * 查询收款次数
     * 
     * @param id 收款次数ID
     * @return 收款次数
     */
    public BUserReceipt selectBUserReceiptById(Long id);
    
    /**
     * 查询收款次数
     * 
     * @param id 收款次数ID
     * @return 收款次数
     */
    public BUserReceipt selectBUserReceiptByUserName(String userName);

    /**
     * 查询收款次数列表
     * 
     * @param bUserReceipt 收款次数
     * @return 收款次数集合
     */
    public List<BUserReceipt> selectBUserReceiptList(BUserReceipt bUserReceipt);

    /**
     * 新增收款次数
     * 
     * @param bUserReceipt 收款次数
     * @return 结果
     */
    public int insertBUserReceipt(BUserReceipt bUserReceipt);

    /**
     * 修改收款次数
     * 
     * @param bUserReceipt 收款次数
     * @return 结果
     */
    public int updateBUserReceipt(BUserReceipt bUserReceipt);

    /**
     * 删除收款次数
     * 
     * @param id 收款次数ID
     * @return 结果
     */
    public int deleteBUserReceiptById(Long id);

    /**
     * 批量删除收款次数
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBUserReceiptByIds(String[] ids);
}
