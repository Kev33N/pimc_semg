package cn.edu.shu.dao;

import cn.edu.shu.domain.Patient;

public interface PatientDao extends BaseDao<Patient> {

	/**
	 * 查找要插入的用户是否已经存在
	 */
	Patient findByNameAndCode(Patient patient);

}
