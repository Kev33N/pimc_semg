package cn.edu.shu.service;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import cn.edu.shu.domain.PageBean;
import cn.edu.shu.domain.Record;

public interface RecordService {

	//保存record
	void save(Record record);

	//按条件分页查询
	PageBean<Record> findByPage(Integer pageCode, Integer pageSize, DetachedCriteria criteria);

	//按照id查找记录
	Record findById(Long record_id);

	//更新实验记录
	void update(Record record);

	//删除试验记录
	void delete(Record record);

	//查询总record数
	int findTotalNumber();

	//根据设备id查询record数
	int findNumByDeviceId(String dict_id);

	//根据id查询被试所做所有实验的结果
	List<String> findAccuracysByPatient(Long patient_id);

	//查询所有记录识别率
	List<Double> findAllAccuracy();

	//获取离线数据的路径
	//String findRecordFilepathOffline(Long id);

	//获取在线数据的路径
	//String findRecordFilepathOnline(Long id);

	//获取离线排名前十
	List<Record> findRankingScore();

}
