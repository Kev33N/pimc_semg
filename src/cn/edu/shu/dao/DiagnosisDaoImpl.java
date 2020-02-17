package cn.edu.shu.dao;

import java.util.List;

import cn.edu.shu.domain.Diagnosis;

public class DiagnosisDaoImpl extends BaseDaoImpl<Diagnosis> implements DiagnosisDao {

	@Override
	public List<String> findIEMGByPatientAndAction(Long patient_id, Long action_id) {
		List<String> list = (List<String>) this.getHibernateTemplate().find("select diagnosis_iEMG from Diagnosis where patient.patient_id = ? and action.action_id = ?", patient_id,action_id);
		return list;
	}

	@Override
	public List<String> findRMSByPatientAndAction(Long patient_id, Long action_id) {
		List<String> list = (List<String>) this.getHibernateTemplate().find("select diagnosis_RMS from Diagnosis where patient.patient_id = ? and action.action_id = ?", patient_id,action_id);
		return list;
	}

	@Override
	public List<String> findMPFByPatientAndAction(Long patient_id, Long action_id) {
		List<String> list = (List<String>) this.getHibernateTemplate().find("select diagnosis_MPF from Diagnosis where patient.patient_id = ? and action.action_id = ?", patient_id,action_id);
		return list;
	}

	@Override
	public List<String> findMFByPatientAndAction(Long patient_id, Long action_id) {
		List<String> list = (List<String>) this.getHibernateTemplate().find("select diagnosis_MF from Diagnosis where patient.patient_id = ? and action.action_id = ?", patient_id,action_id);
		return list;
	}

}
