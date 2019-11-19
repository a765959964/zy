package com.ruoyi.zy.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.TKitchenMapper;
import com.ruoyi.zy.domain.TKitchen;
import com.ruoyi.zy.service.ITKitchenService;
import com.ruoyi.common.core.text.Convert;

/**
 * 门店Service业务层处理
 * 
 * @author zy
 * @date 2019-11-19
 */
@Service
public class TKitchenServiceImpl implements ITKitchenService 
{
    @Autowired
    private TKitchenMapper tKitchenMapper;

    /**
     * 查询门店
     * 
     * @param id 门店ID
     * @return 门店
     */
    @Override
    public TKitchen selectTKitchenById(Long id)
    {
        return tKitchenMapper.selectTKitchenById(id);
    }

    /**
     * 查询门店列表
     * 
     * @param tKitchen 门店
     * @return 门店
     */
    @Override
    public List<TKitchen> selectTKitchenList(TKitchen tKitchen)
    {
        return tKitchenMapper.selectTKitchenList(tKitchen);
    }

    /**
     * 新增门店
     * 
     * @param tKitchen 门店
     * @return 结果
     */
    @Override
    public int insertTKitchen(TKitchen tKitchen)
    {
        tKitchen.setCreateTime(DateUtils.getNowDate());
        return tKitchenMapper.insertTKitchen(tKitchen);
    }

    /**
     * 修改门店
     * 
     * @param tKitchen 门店
     * @return 结果
     */
    @Override
    public int updateTKitchen(TKitchen tKitchen)
    {
        return tKitchenMapper.updateTKitchen(tKitchen);
    }

    /**
     * 删除门店对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteTKitchenByIds(String ids)
    {
        return tKitchenMapper.deleteTKitchenByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除门店信息
     * 
     * @param id 门店ID
     * @return 结果
     */
    @Override
    public int deleteTKitchenById(Long id)
    {
        return tKitchenMapper.deleteTKitchenById(id);
    }
}
