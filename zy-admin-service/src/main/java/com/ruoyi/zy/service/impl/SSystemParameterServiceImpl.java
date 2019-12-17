package com.ruoyi.zy.service.impl;

import java.util.List;
import java.util.Map;

import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.zy.mapper.SSystemParameterMapper;
import com.ruoyi.zy.domain.SSystemParameter;
import com.ruoyi.zy.service.ISSystemParameterService;
import com.ruoyi.common.core.text.Convert;

/**
 * 系统参数表Service业务层处理
 * 
 * @author ruoyi
 * @date 2019-12-12
 */
@Service
public class SSystemParameterServiceImpl implements ISSystemParameterService 
{
    @Autowired
    private SSystemParameterMapper sSystemParameterMapper;

    /**
     * 查询系统参数表
     * 
     * @param id 系统参数表ID
     * @return 系统参数表
     */
    @Override
    public SSystemParameter selectSSystemParameterById(Long id)
    {
        return sSystemParameterMapper.selectSSystemParameterById(id);
    }

    /**
     * 查询系统参数表列表
     * 
     * @param sSystemParameter 系统参数表
     * @return 系统参数表
     */
    @Override
    public List<SSystemParameter> selectSSystemParameterList(SSystemParameter sSystemParameter)
    {
        return sSystemParameterMapper.selectSSystemParameterList(sSystemParameter);
    }

    /**
     * 新增系统参数表
     * 
     * @param sSystemParameter 系统参数表
     * @return 结果
     */
    @Override
    public int insertSSystemParameter(SSystemParameter sSystemParameter)
    {
        sSystemParameter.setCreateTime(DateUtils.getNowDate());
        return sSystemParameterMapper.insertSSystemParameter(sSystemParameter);
    }

    /**
     * 修改系统参数表
     * 
     * @param sSystemParameter 系统参数表
     * @return 结果
     */
    @Override
    public int updateSSystemParameter(SSystemParameter sSystemParameter)
    {
        sSystemParameter.setUpdateTime(DateUtils.getNowDate());
        return sSystemParameterMapper.updateSSystemParameter(sSystemParameter);
    }

    /**
     * 删除系统参数表对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSSystemParameterByIds(String ids)
    {
        return sSystemParameterMapper.deleteSSystemParameterByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除系统参数表信息
     * 
     * @param id 系统参数表ID
     * @return 结果
     */
    @Override
    public int deleteSSystemParameterById(Long id)
    {
        return sSystemParameterMapper.deleteSSystemParameterById(id);
    }

	@Override
	public SSystemParameter get(Map<String, Object> paramMap) {
		return sSystemParameterMapper.get(paramMap);
	};
}
