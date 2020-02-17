package cn.edu.shu.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.shu.dao.RecordDao;
import cn.edu.shu.domain.PageBean;
import cn.edu.shu.domain.Record;

@Transactional
public class RecordServiceImpl implements RecordService {
	
	private RecordDao recordDao;

	public void setRecordDao(RecordDao recordDao) {
		this.recordDao = recordDao;
	}

	/**
	 * 保存当前record
	 */
	public void save(Record record) {
		recordDao.save(record);
	}

	/**
	 * 按条件分页查询record
	 */
	public PageBean<Record> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria) {
		PageBean<Record> page = recordDao.findByPage(pageCode, pageSize, criteria);
		return page;
	}

	@Override
	public Record findById(Long record_id) {
		return recordDao.findById(record_id);
	}

	@Override
	public void update(Record record) {
		recordDao.update(record);
	}

	@Override
	public void delete(Record record) {
		recordDao.delete(record);
	}

	@Override
	public int findTotalNumber() {
		return recordDao.findTotalNumber();
	}

	@Override
	public int findNumByDeviceId(String dict_id) {
		return recordDao.findNumByDeviceId(dict_id);
	}

	@Override
	public List<String> findAccuracysByPatient(Long patient_id) {
		return recordDao.findAccuracysByPatient(patient_id);
	}

	@Override
	public List<Double> findAllAccuracy() {
		return recordDao.findAllAccuracy();
	}

//	@Override
//	public String findRecordFilepathOffline(Long id) {
//		return recordDao.findRecordFilepathOffline(id);
//	}
//
//	@Override
//	public String findRecordFilepathOnline(Long id) {
//		return recordDao.findRecordFilepathOnline(id);
//	}

	@Override
	public List<Record> findRankingScore() {
		return recordDao.findRankingScore();
	}
	

}
