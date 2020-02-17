package cn.edu.shu.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.shu.dao.DictDao;
import cn.edu.shu.domain.Dict;
import cn.edu.shu.domain.PageBean;
import cn.edu.shu.domain.User;

@Transactional
public class DictServiceImpl implements DictService {
	
	private DictDao dictDao;

	public void setDictDao(DictDao dictDao) {
		this.dictDao = dictDao;
	}

	/**
	 * 根据客户类别编码查询字段
	 */
	public List<Dict> findByCode(String dict_type_code) {
		return dictDao.findByCode(dict_type_code);
	}

	@Override
	public PageBean<Dict> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		return dictDao.findByPage(pageCode, pageSize, criteria);
	}

	@Override
	public Dict findDictByDictId(String dict_id) {
		return dictDao.findDictByDictId(dict_id);
	}

	@Override
	public List<Dict> findAllDevice() {
		return dictDao.findAllDevice("001");
	}

	@Override
	public void update(Dict dict) {
		dictDao.update(dict);
	}

	@Override
	public void saveDict(Dict dict) {
		dictDao.save(dict);
	}
	

}
