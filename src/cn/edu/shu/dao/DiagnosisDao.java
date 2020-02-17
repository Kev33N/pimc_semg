package cn.edu.shu.dao;

import java.util.List;

import cn.edu.shu.domain.Diagnosis;

public interface DiagnosisDao extends BaseDao<Diagnosis> {

	List<String> findIEMGByPatientAndAction(Long patient_id, Long action_id);

	List<String> findRMSByPatientAndAction(Long patient_id, Long action_id);

	List<String> findMPFByPatientAndAction(Long patient_id, Long action_id);

	List<String> findMFByPatientAndAction(Long patient_id, Long action_id);

}
