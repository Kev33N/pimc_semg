package cn.edu.shu.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.shu.dao.PatientDao;
import cn.edu.shu.domain.PageBean;
import cn.edu.shu.domain.Patient;

@Transactional
public class PatientServiceImpl implements PatientService {
	
	private PatientDao patientDao;

	public void setPatientDao(PatientDao patientDao) {
		this.patientDao = patientDao;
	}

	/**
	 * 查找要插入的用户是否已经存在
	 */
	public Patient findByNameAndCode(Patient patient) {
		return patientDao.findByNameAndCode(patient);
	}

	/*
	 * 插入新的patient
	 */
	public void save(Patient patient) {
		patientDao.save(patient);
	}

	/**
	 * 按条件分页查询
	 */
	public PageBean<Patient> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		return patientDao.findByPage(pageCode, pageSize, criteria);
	}

	@Override
	public List<Patient> findAll() {
		return patientDao.findAll();
	}

	@Override
	public Patient findById(Long patient_id) {
		return patientDao.findById(patient_id);
	}

	@Override
	public void update(Patient patient) {
		patientDao.update(patient);
	}

	@Override
	public void delete(Patient patient) {
		patientDao.delete(patient);
	}
	

}
