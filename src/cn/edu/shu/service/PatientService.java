package cn.edu.shu.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.edu.shu.domain.PageBean;
import cn.edu.shu.domain.Patient;

public interface PatientService {

	// 查找要插入的用户是否已经存在
	Patient findByNameAndCode(Patient patient);

	//插入新patient
	void save(Patient patient);

	//按条件分页查询
	PageBean<Patient> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

	//查询所有patient
	List<Patient> findAll();

	//根据id值查询被试
	Patient findById(Long patient_id);

	//跟新被试信息
	void update(Patient patient);

	//删除被试信息
	void delete(Patient patient);

}
