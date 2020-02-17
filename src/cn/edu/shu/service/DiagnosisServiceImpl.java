package cn.edu.shu.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.shu.dao.DiagnosisDao;
import cn.edu.shu.domain.Diagnosis;
import cn.edu.shu.domain.PageBean;

@Transactional
public class DiagnosisServiceImpl implements DiagnosisService {
	
	private DiagnosisDao diagnosisDao;

	public void setDiagnosisDao(DiagnosisDao diagnosisDao) {
		this.diagnosisDao = diagnosisDao;
	}

	@Override
	public PageBean<Diagnosis> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		return diagnosisDao.findByPage(pageCode, pageSize, criteria);
	}

	@Override
	public Diagnosis findById(Long diagnosis_id) {
		return diagnosisDao.findById(diagnosis_id);
	}

	@Override
	public void update(Diagnosis diagnosis) {
		diagnosisDao.update(diagnosis);
	}

	@Override
	public void save(Diagnosis diagnosis) {
		diagnosisDao.save(diagnosis);
	}

	@Override
	public void delete(Diagnosis diagnosis) {
		diagnosisDao.delete(diagnosis);
	}

	@Override
	public List<String> findIEMGByPatientAndAction(Long patient_id, Long action_id) {
		return diagnosisDao.findIEMGByPatientAndAction(patient_id,action_id);
	}

	@Override
	public List<String> findRMSByPatientAndAction(Long patient_id, Long action_id) {
		return diagnosisDao.findRMSByPatientAndAction(patient_id,action_id);
	}

	@Override
	public List<String> findMPFByPatientAndAction(Long patient_id, Long action_id) {
		return diagnosisDao.findMPFByPatientAndAction(patient_id,action_id);
	}

	@Override
	public List<String> findMFByPatientAndAction(Long patient_id, Long action_id) {
		return diagnosisDao.findMFByPatientAndAction(patient_id,action_id);
	}

}
