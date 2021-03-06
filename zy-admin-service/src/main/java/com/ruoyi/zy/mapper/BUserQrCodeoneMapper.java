package com.ruoyi.zy.mapper;

import com.ruoyi.zy.domain.BUserQrCodeone;
import java.util.List;
import java.util.Map;

/**
 * 收款码管理Mapper接口
 * 
 * @author ruoyi
 * @date 2019-12-12
 */
public interface BUserQrCodeoneMapper 
{
	
	public BUserQrCodeone get(Map<String, Object> paramMap);
	
    /**
     * 查询收款码管理
     * 
     * @param id 收款码管理ID
     * @return 收款码管理
     */
    public BUserQrCodeone selectBUserQrCodeoneById(Long id);

    /**
     * 查询收款码管理列表
     * 
     * @param bUserQrCodeone 收款码管理
     * @return 收款码管理集合
     */
    public List<BUserQrCodeone> selectBUserQrCodeoneList(BUserQrCodeone bUserQrCodeone);

    /**
     * 新增收款码管理
     * 
     * @param bUserQrCodeone 收款码管理
     * @return 结果
     */
    public int insertBUserQrCodeone(BUserQrCodeone bUserQrCodeone);

    /**
     * 修改收款码管理
     * 
     * @param bUserQrCodeone 收款码管理
     * @return 结果
     */
    public int updateBUserQrCodeone(BUserQrCodeone bUserQrCodeone);

    /**
     * 校验用户名称是否唯一
     *
     * @param username 用户名
     * @return 结果
     */
    public BUserQrCodeone checkUserNameUnique(String username);


    /**
     * 删除收款码管理
     * 
     * @param id 收款码管理ID
     * @return 结果
     */
    public int deleteBUserQrCodeoneById(Long id);

    /**
     * 批量删除收款码管理
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteBUserQrCodeoneByIds(String[] ids);
}
