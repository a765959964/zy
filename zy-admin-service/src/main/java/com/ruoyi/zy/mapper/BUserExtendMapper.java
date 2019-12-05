package com.ruoyi.zy.mapper;

import com.ruoyi.zy.domain.BUserExtend;
import java.util.List;

/**
 * 收款码管理Mapper接口
 * 
 * @author ruoyi
 * @date 2019-11-21
 */
public interface BUserExtendMapper 
{
    /**
     * 查询收款码管理
     * 
     * @param id 收款码管理ID
     * @return 收款码管理
     */
    public BUserExtend selectBUserExtendById(Long id);

    /**
     * 查询收款码管理列表
     * 
     * @param bUserExtend 收款码管理
     * @return 收款码管理集合
     */
    public List<BUserExtend> selectBUserExtendList(BUserExtend bUserExtend);

    /**
     * 新增收款码管理
     * 
     * @param bUserExtend 收款码管理
     * @return 结果
     */
    public int insertBUserExtend(BUserExtend bUserExtend);

    /**
     * 修改收款码管理
     * 
     * @param bUserExtend 收款码管理
     * @return 结果
     */
    public int updateBUserExtend(BUserExtend bUserExtend);

    /**
     * 删除收款码管理
     * 
     * @param id 收款码管理ID
     * @return 结果
     */
    public int deleteBUserExtendById(Long id);

    /**
     * 批量删除收款码管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBUserExtendByIds(String[] ids);
}
