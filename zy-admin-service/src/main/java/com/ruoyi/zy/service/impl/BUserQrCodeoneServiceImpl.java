package com.ruoyi.zy.service.impl;

import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.core.text.Convert;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.zy.domain.BUserQrCodeone;
import com.ruoyi.zy.mapper.BUserQrCodeoneMapper;
import com.ruoyi.zy.service.IBUserQrCodeoneService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 收款码管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-12-12
 */
@Service
public class BUserQrCodeoneServiceImpl implements IBUserQrCodeoneService 
{
    @Autowired
    private BUserQrCodeoneMapper bUserQrCodeoneMapper;

    
	public BUserQrCodeone get(Map<String, Object> paramsMap) {
		return this.bUserQrCodeoneMapper.get(paramsMap);
	}
    
    /**
     * 查询收款码管理
     * 
     * @param id 收款码管理ID
     * @return 收款码管理
     */
    @Override
    public BUserQrCodeone selectBUserQrCodeoneById(Long id)
    {
        return bUserQrCodeoneMapper.selectBUserQrCodeoneById(id);
    }

    /**
     * 查询收款码管理列表
     * 
     * @param bUserQrCodeone 收款码管理
     * @return 收款码管理
     */
    @Override
    public List<BUserQrCodeone> selectBUserQrCodeoneList(BUserQrCodeone bUserQrCodeone)
    {
        return bUserQrCodeoneMapper.selectBUserQrCodeoneList(bUserQrCodeone);
    }

    @Override
    public String checkUserNameUnique(BUserQrCodeone bUserQrCodeone) {

        Long id = StringUtils.isNull(bUserQrCodeone.getId()) ? -1L : bUserQrCodeone.getId();
        BUserQrCodeone info =  bUserQrCodeoneMapper.checkUserNameUnique(bUserQrCodeone.getUsername());
        if (StringUtils.isNotNull(info) && info.getId() != id.longValue())
        {
            return UserConstants.USER_PHONE_NOT_UNIQUE;
        }
        return UserConstants.USER_PHONE_UNIQUE;

    }

    /**
     * 新增收款码管理
     * 
     * @param bUserQrCodeone 收款码管理
     * @return 结果
     */
    @Override
    public int insertBUserQrCodeone(BUserQrCodeone bUserQrCodeone)
    {
        bUserQrCodeone.setCreateTime(DateUtils.getNowDate());
        return bUserQrCodeoneMapper.insertBUserQrCodeone(bUserQrCodeone);
    }

    /**
     * 修改收款码管理
     * 
     * @param bUserQrCodeone 收款码管理
     * @return 结果
     */
    @Override
    public int updateBUserQrCodeone(BUserQrCodeone bUserQrCodeone)
    {
        return bUserQrCodeoneMapper.updateBUserQrCodeone(bUserQrCodeone);
    }

    /**
     * 删除收款码管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBUserQrCodeoneByIds(String ids)
    {
        return bUserQrCodeoneMapper.deleteBUserQrCodeoneByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除收款码管理信息
     * 
     * @param id 收款码管理ID
     * @return 结果
     */
    @Override
    public int deleteBUserQrCodeoneById(Long id)
    {
        return bUserQrCodeoneMapper.deleteBUserQrCodeoneById(id);
    }

    @Override
    public int changeStatus(BUserQrCodeone userQrCodeone) {
        return bUserQrCodeoneMapper.updateBUserQrCodeone(userQrCodeone);
    }
}
