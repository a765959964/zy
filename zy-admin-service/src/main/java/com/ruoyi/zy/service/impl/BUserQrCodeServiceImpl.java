package com.ruoyi.zy.service.impl;

import java.util.List;
import java.util.Map;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.BUserQrCodeMapper;
import com.ruoyi.zy.domain.BUserQrCode;
import com.ruoyi.zy.service.IBUserQrCodeService;
import com.ruoyi.common.core.text.Convert;

/**
 * 用户收款码表Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-12-12
 */
@Service
public class BUserQrCodeServiceImpl implements IBUserQrCodeService 
{
    @Autowired
    private BUserQrCodeMapper bUserQrCodeMapper;

    @Override
	public List<BUserQrCode> findList(Map<String, Object> paramMap) {
    	return bUserQrCodeMapper.findList(paramMap);
	}

	@Override
	public Map<String, Object> minimumTimes(Map<String, Object> paramMap) {
		return bUserQrCodeMapper.minimumTimes(paramMap);
	}
    
    
    /**
     * 查询用户收款码表
     * 
     * @param id 用户收款码表ID
     * @return 用户收款码表
     */
    @Override
    public BUserQrCode selectBUserQrCodeById(Long id)
    {
        return bUserQrCodeMapper.selectBUserQrCodeById(id);
    }

    /**
     * 查询用户收款码表列表
     * 
     * @param bUserQrCode 用户收款码表
     * @return 用户收款码表
     */
    @Override
    public List<BUserQrCode> selectBUserQrCodeList(BUserQrCode bUserQrCode)
    {
        return bUserQrCodeMapper.selectBUserQrCodeList(bUserQrCode);
    }

    /**
     * 新增用户收款码表
     * 
     * @param bUserQrCode 用户收款码表
     * @return 结果
     */
    @Override
    public int insertBUserQrCode(BUserQrCode bUserQrCode)
    {
        bUserQrCode.setCreateTime(DateUtils.getNowDate());
        return bUserQrCodeMapper.insertBUserQrCode(bUserQrCode);
    }

    /**
     * 修改用户收款码表
     * 
     * @param bUserQrCode 用户收款码表
     * @return 结果
     */
    @Override
    public int updateBUserQrCode(BUserQrCode bUserQrCode)
    {
        return bUserQrCodeMapper.updateBUserQrCode(bUserQrCode);
    }

    /**
     * 删除用户收款码表对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBUserQrCodeByIds(String ids)
    {
        return bUserQrCodeMapper.deleteBUserQrCodeByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除用户收款码表信息
     * 
     * @param id 用户收款码表ID
     * @return 结果
     */
    @Override
    public int deleteBUserQrCodeById(Long id)
    {
        return bUserQrCodeMapper.deleteBUserQrCodeById(id);
    }

}
