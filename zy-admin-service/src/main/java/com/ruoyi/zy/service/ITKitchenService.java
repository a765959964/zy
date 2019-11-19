package com.ruoyi.zy.service;

import com.ruoyi.zy.domain.TKitchen;
import java.util.List;

/**
 * 门店Service接口
 * 
 * @author zy
 * @date 2019-11-19
 */
public interface ITKitchenService 
{
    /**
     * 查询门店
     * 
     * @param id 门店ID
     * @return 门店
     */
    public TKitchen selectTKitchenById(Long id);

    /**
     * 查询门店列表
     * 
     * @param tKitchen 门店
     * @return 门店集合
     */
    public List<TKitchen> selectTKitchenList(TKitchen tKitchen);

    /**
     * 新增门店
     * 
     * @param tKitchen 门店
     * @return 结果
     */
    public int insertTKitchen(TKitchen tKitchen);

    /**
     * 修改门店
     * 
     * @param tKitchen 门店
     * @return 结果
     */
    public int updateTKitchen(TKitchen tKitchen);

    /**
     * 批量删除门店
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTKitchenByIds(String ids);

    /**
     * 删除门店信息
     * 
     * @param id 门店ID
     * @return 结果
     */
    public int deleteTKitchenById(Long id);
}
