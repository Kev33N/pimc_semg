package cn.edu.shu.dao;

import java.util.List;

import cn.edu.shu.domain.Record;

public interface RecordDao extends BaseDao<Record> {

	int findTotalNumber();

	int findNumByDeviceId(String dict_id);

	List<String> findAccuracysByPatient(Long patient_id);

	List<Double> findAllAccuracy();

//	String findRecordFilepathOffline(Long id);
//
//	String findRecordFilepathOnline(Long id);

	List<Record> findRankingScore();

}
