package cn.edu.shu.dao;

import java.util.List;

import cn.edu.shu.domain.Record;

public class RecordDaoImpl extends BaseDaoImpl<Record> implements RecordDao {

	@Override
	public int findTotalNumber() {
		String res = this.getHibernateTemplate().find("select count(*) from Record as record").listIterator().next().toString();
		return Integer.parseInt(res);
	}

	@Override
	public int findNumByDeviceId(String dict_id) {
		String res = this.getHibernateTemplate().find("select count(*) from Record as record where device.dict_id = ?",dict_id).listIterator().next().toString();
		return Integer.parseInt(res);
	}

	@Override
	public List<String> findAccuracysByPatient(Long patient_id) {
		List<String> list = (List<String>) this.getHibernateTemplate().find("select record_score from Record where patient.patient_id = ?", patient_id);
		return list;
	}

	@Override
	public List<Double> findAllAccuracy() {
		List<Double> list = (List<Double>) this.getHibernateTemplate().find("select record_score from Record");
		return list;
	}

//	@Override
//	public String findRecordFilepathOffline(Long id) {
//		List<String> offline = (List<String>) this.getHibernateTemplate().find("select record_filepath from Record where record_id = ?", id);
//		return offline.get(0);
//	}
//
//	@Override
//	public String findRecordFilepathOnline(Long id) {
//		List<String> online = (List<String>) this.getHibernateTemplate().find("select record_filepath from Record where record_id = ?", id);
//		return online.get(0);
//	}

	@Override
	public List<Record> findRankingScore() {
		this.getHibernateTemplate().setMaxResults(10);
		List<Record> rankingList = (List<Record>) this.getHibernateTemplate().find("from Record GROUP BY patient.patient_id ORDER BY record_score DESC");
		this.getHibernateTemplate().setMaxResults(0);
		return rankingList!=null?rankingList:null;
	}

}
