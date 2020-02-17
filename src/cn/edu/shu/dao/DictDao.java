package cn.edu.shu.dao;

import java.util.List;

import cn.edu.shu.domain.Dict;

public interface DictDao extends BaseDao<Dict> {

	List<Dict> findByCode(String dict_type_code);

	Dict findDictByDictId(String dict_id);

	List<Dict> findAllDevice(String string);

}
