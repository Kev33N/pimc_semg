package cn.edu.shu.dao;

import java.util.List;

import cn.edu.shu.domain.Dict;

public class DictDaoImpl extends BaseDaoImpl<Dict> implements DictDao {

	/**
	 *  根据客户类别编码查询字段
	 */
	public List<Dict> findByCode(String dict_type_code) {
		List<Dict> list = (List<Dict>) this.getHibernateTemplate().find("from Dict where dict_type_code = ?", dict_type_code);
		return list;
	}

	@Override
	public Dict findDictByDictId(String dict_id) {
		List<Dict> list = (List<Dict>) this.getHibernateTemplate().find("from Dict where dict_id = ?", dict_id);
		return list.get(0);
	}

	@Override
	public List<Dict> findAllDevice(String dict_type_code) {
		List<Dict> list = (List<Dict>) this.getHibernateTemplate().find("from Dict where dict_type_code = ?", dict_type_code);
		return list;
	}

}
