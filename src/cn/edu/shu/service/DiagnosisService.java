package cn.edu.shu.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.edu.shu.domain.Diagnosis;
import cn.edu.shu.domain.PageBean;

public interface DiagnosisService {

	PageBean<Diagnosis> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

	Diagnosis findById(Long diagnosis_id);

	void update(Diagnosis diagnosis);

	void save(Diagnosis diagnosis);

	void delete(Diagnosis diagnosis);

	List<String> findIEMGByPatientAndAction(Long patient_id, Long action_id);

	List<String> findRMSByPatientAndAction(Long patient_id, Long action_id);

	List<String> findMPFByPatientAndAction(Long patient_id, Long action_id);

	List<String> findMFByPatientAndAction(Long patient_id, Long action_id);

}
