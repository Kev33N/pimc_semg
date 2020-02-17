package cn.edu.shu.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.edu.shu.domain.Dict;
import cn.edu.shu.domain.PageBean;

public interface DictService {

	List<Dict> findByCode(String dict_type_code);

	PageBean<Dict> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

	Dict findDictByDictId(String id);

	List<Dict> findAllDevice();

	void update(Dict dict);

	void saveDict(Dict dict);

}
