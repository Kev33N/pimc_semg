package cn.edu.shu.dao;

import java.util.List;

import cn.edu.shu.domain.Patient;

public class PatientDaoImpl extends BaseDaoImpl<Patient> implements PatientDao {

	/**
	 * 查找要插入的用户是否已经存在
	 */
	public Patient findByNameAndCode(Patient patient) {
		List<Patient> list = (List<Patient>) this.getHibernateTemplate().find("from Patient where patient_name = ? and patient_code = ?", patient.getPatient_name(),patient.getPatient_code());
		if(list != null && list.size()>0)
			return list.get(0);
		return null;
	}

}
