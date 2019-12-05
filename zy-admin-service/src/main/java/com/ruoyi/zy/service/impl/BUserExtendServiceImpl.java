package com.ruoyi.zy.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.BUserExtendMapper;
import com.ruoyi.zy.domain.BUserExtend;
import com.ruoyi.zy.service.IBUserExtendService;
import com.ruoyi.common.core.text.Convert;

/**
 * 收款码管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
@Service
public class BUserExtendServiceImpl implements IBUserExtendService 
{
    @Autowired
    private BUserExtendMapper bUserExtendMapper;

    /**
     * 查询收款码管理
     * 
     * @param id 收款码管理ID
     * @return 收款码管理
     */
    @Override
    public BUserExtend selectBUserExtendById(Long id)
    {
        return bUserExtendMapper.selectBUserExtendById(id);
    }

    /**
     * 查询收款码管理列表
     * 
     * @param bUserExtend 收款码管理
     * @return 收款码管理
     */
    @Override
    public List<BUserExtend> selectBUserExtendList(BUserExtend bUserExtend)
    {
        return bUserExtendMapper.selectBUserExtendList(bUserExtend);
    }

    /**
     * 新增收款码管理
     * 
     * @param bUserExtend 收款码管理
     * @return 结果
     */
    @Override
    public int insertBUserExtend(BUserExtend bUserExtend)
    {
        bUserExtend.setCreateTime(DateUtils.getNowDate());
        return bUserExtendMapper.insertBUserExtend(bUserExtend);
    }

    /**
     * 修改收款码管理
     * 
     * @param bUserExtend 收款码管理
     * @return 结果
     */
    @Override
    public int updateBUserExtend(BUserExtend bUserExtend)
    {
        bUserExtend.setUpdateTime(DateUtils.getNowDate());
        return bUserExtendMapper.updateBUserExtend(bUserExtend);
    }

    /**
     * 删除收款码管理对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteBUserExtendByIds(String ids)
    {
        return bUserExtendMapper.deleteBUserExtendByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除收款码管理信息
     * 
     * @param id 收款码管理ID
     * @return 结果
     */
    @Override
    public int deleteBUserExtendById(Long id)
    {
        return bUserExtendMapper.deleteBUserExtendById(id);
    }
}
