package com.ruoyi.zy.mapper;

import com.ruoyi.zy.domain.SSystemParameter;
import java.util.List;
import java.util.Map;

/**
 * 系统参数表Mapper接口
 * 
 * @author ruoyi
 * @date 2019-12-12
 */
public interface SSystemParameterMapper 
{
	
	
	public SSystemParameter get(Map<String, Object> paramMap);
	
    /**
     * 查询系统参数表
     * 
     * @param id 系统参数表ID
     * @return 系统参数表
     */
    public SSystemParameter selectSSystemParameterById(Long id);

    /**
     * 查询系统参数表列表
     * 
     * @param sSystemParameter 系统参数表
     * @return 系统参数表集合
     */
    public List<SSystemParameter> selectSSystemParameterList(SSystemParameter sSystemParameter);

    /**
     * 新增系统参数表
     * 
     * @param sSystemParameter 系统参数表
     * @return 结果
     */
    public int insertSSystemParameter(SSystemParameter sSystemParameter);

    /**
     * 修改系统参数表
     * 
     * @param sSystemParameter 系统参数表
     * @return 结果
     */
    public int updateSSystemParameter(SSystemParameter sSystemParameter);

    /**
     * 删除系统参数表
     * 
     * @param id 系统参数表ID
     * @return 结果
     */
    public int deleteSSystemParameterById(Long id);

    /**
     * 批量删除系统参数表
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSSystemParameterByIds(String[] ids);
}
