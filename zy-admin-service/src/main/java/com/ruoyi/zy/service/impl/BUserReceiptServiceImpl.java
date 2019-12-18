package com.ruoyi.zy.service.impl;

import java.util.List;
import java.util.Map;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.BUserReceiptMapper;
import com.ruoyi.zy.domain.BUserReceipt;
import com.ruoyi.zy.service.IBUserReceiptService;
import com.ruoyi.common.core.text.Convert;

/**
 * 收款次数Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-12-17
 */
@Service
public class BUserReceiptServiceImpl implements IBUserReceiptService 
{
    @Autowired
    private BUserReceiptMapper bUserReceiptMapper;

    
	public List<BUserReceipt> findList(Map<String, Object> paramsMap) {
		return this.bUserReceiptMapper.findList(paramsMap);
	}
    
    public List<Map<String, Object>> minimumTimes(Map<String, Object> paramsMap) {
		return this.bUserReceiptMapper.minimumTimes(paramsMap);
	}
    
    /**
     * 查询收款次数
     * 
     * @param id 收款次数ID
     * @return 收款次数
     */
    @Override
    public BUserReceipt selectBUserReceiptById(Long id)
    {
        return bUserReceiptMapper.selectBUserReceiptById(id);
    }

    /**
     * 查询收款次数列表
     * 
     * @param bUserReceipt 收款次数
     * @return 收款次数
     */
    @Override
    public List<BUserReceipt> selectBUserReceiptList(BUserReceipt bUserReceipt)
    {
        return bUserReceiptMapper.selectBUserReceiptList(bUserReceipt);
    }

    /**
     * 新增收款次数
     * 
     * @param bUserReceipt 收款次数
     * @return 结果
     */
    @Override
    public int insertBUserReceipt(BUserReceipt bUserReceipt)
    {
        return bUserReceiptMapper.insertBUserReceipt(bUserReceipt);
    }

    /**
     * 修改收款次数
     * 
     * @param bUserReceipt 收款次数
     * @return 结果
     */
    @Override
    public int updateBUserReceipt(BUserReceipt bUserReceipt)
    {
        bUserReceipt.setUpdateTime(DateUtils.getNowDate());
        return bUserReceiptMapper.updateBUserReceipt(bUserReceipt);
    }

    /**
     * 删除收款次数对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBUserReceiptByIds(String ids)
    {
        return bUserReceiptMapper.deleteBUserReceiptByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除收款次数信息
     * 
     * @param id 收款次数ID
     * @return 结果
     */
    @Override
    public int deleteBUserReceiptById(Long id)
    {
        return bUserReceiptMapper.deleteBUserReceiptById(id);
    }
}
