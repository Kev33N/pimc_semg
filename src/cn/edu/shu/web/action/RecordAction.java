package cn.edu.shu.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import com.opensymphony.xwork2.ModelDriven;

import cn.edu.shu.domain.Dict;
import cn.edu.shu.domain.PageBean;
import cn.edu.shu.domain.Patient;
import cn.edu.shu.domain.Record;
import cn.edu.shu.service.PatientService;
import cn.edu.shu.service.RecordService;

public class RecordAction extends BaseAction implements ModelDriven<Record> {
	
	private static final long serialVersionUID = -1694605328847598908L;
	
	private Record record = new Record();
	@Override
	public Record getModel() {
		return record;
	}
	
	//保存文件类型
	private String contentType;
	//保存时的文件名
	private String filename;
	
	private String downloadPath;

	public String getDownloadPath() {
		return downloadPath;
	}

	public void setDownloadPath(String downloadPath) {
		this.downloadPath = downloadPath;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public String getFilename() {
		try {
			filename = new String(filename.getBytes(),"ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public InputStream getInputStream() {
		InputStream in = null;
		try {
			in = new FileInputStream(new File(getDownloadPath()));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return in;
	}

	private RecordService recordService;
	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}
	
	private PatientService patientService;
	public void setPatientService(PatientService patientService) {
		this.patientService = patientService;
	}

	//上传的离线和在线文件
	private List<File> upload;
	//上传文件的文件名
	private List<String> uploadFileName;
	//上传文件的类型
	private List<String> uploadContentType;
	
	public void setUpload(List<File> upload) {
		this.upload = upload;
	}

	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public void setUploadContentType(List<String> uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	/**
	 * 保存用户记录并且接受上传的文件(FromQt)
	 * @return
	 * @throws IOException 
	 */
	public String save() throws IOException {
		//从session中取出上传的patient
		Patient patient = (Patient) ServletActionContext.getRequest().getSession().getAttribute("tempPatient");
		//把patient封装入record中
		record.setPatient(patient);
		//保存上传的数据
		if(uploadFileName != null) {
			//把文件上传到
			String pathData = "F:\\PIMC_SEMG\\"+patient.getPatient_name()+"\\data\\";
			//创建file对象
			File fileData = new File(pathData+uploadFileName.get(0));
			
			//把在线文件上传到
			String pathLabel = "F:\\PIMC_SEMG\\"+patient.getPatient_name()+"\\label\\";
			//创建file对象
			File fileLabel = new File(pathLabel+uploadFileName.get(1));
			
			FileUtils.copyFile(upload.get(0), fileData);
			FileUtils.copyFile(upload.get(1), fileLabel);
			//把数据保存的路径封装到record中
			record.setRecord_filepath(pathData+uploadFileName.get(0));
			record.setRecord_labelpath(pathLabel+uploadFileName.get(1));
		}
		//保存当前record
		recordService.save(record);
		return "tosuccess";
	}
	
	/**
	 * 修改试验记录功能
	 * @return
	 */
	public String update() throws Exception {
		Patient patient = patientService.findById(record.getPatient().getPatient_id());
		record.setPatient(patient);
		//说明上传了新的实验数据
		if(uploadFileName != null) {
			//先删除旧的数据
			String oldfilePath = record.getRecord_filepath();
			String oldlabelPath = record.getRecord_labelpath();
			File data = null;
			File label = null;
			//删除离线数据
			if(oldfilePath != null && !oldfilePath.trim().isEmpty()) {
				data = new File(oldfilePath);
			}
			if(data != null && data.exists()) {
				data.delete();
			}
			//删除在线数据
			if(oldlabelPath != null && !oldlabelPath.trim().isEmpty()) {
				label = new File(oldlabelPath);
			}
			if(label != null && label.exists()) {
				label.delete();
			}
			
			//上传的新的数据
			//把离线文件上传到
			String pathData = "F:\\PIMC_SEMG\\"+record.getPatient().getPatient_name()+"\\data\\";
			//创建file对象
			data = new File(pathData+uploadFileName.get(0));
			
			//把在线文件上传到
			String pathLabel = "F:\\PIMC_SEMG\\"+record.getPatient().getPatient_name()+"\\label\\";
			//创建file对象
			label = new File(pathLabel+uploadFileName.get(1));
			
			FileUtils.copyFile(upload.get(0), data);
			FileUtils.copyFile(upload.get(1), label);
			
			System.out.println();
			//把数据保存的路径封装到record中
			record.setRecord_filepath(pathData+uploadFileName.get(0));
			record.setRecord_labelpath(pathLabel+uploadFileName.get(1));
		}
		recordService.update(record);
		return "update";
	}
	
	/**
	 * 删除试验记录
	 * @return
	 */
	public String delete() {
		record = recordService.findById(record.getRecord_id());
		String dataPath = record.getRecord_filepath();
		String labelPath = record.getRecord_labelpath();
		//删除记录
		recordService.delete(record);
		//删除数据
		File data = null;
		File label = null;
		if(dataPath != null) {
			data = new File(dataPath);
		}
		if(data != null && data.exists()) {
			data.delete();
		}
		if(labelPath != null) {
			label = new File(labelPath);
		}
		if(label != null && label.exists()) {
			label.delete();
		}
		
		return "delete";
	}
	
	/**
	 * 按条件分页查询record
	 * @return
	 */
	public String findByPage() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Record.class);
		//获取patient
		Patient p = record.getPatient();
		if(p != null && p.getPatient_id() != null) {
			criteria.add(Restrictions.eq("patient.patient_id", p.getPatient_id()));
		}
		//拼接设备信息
		Dict device = record.getDevice();
		if(device != null && !device.getDict_id().trim().isEmpty()) {
			criteria.add(Restrictions.eq("device.dict_id", device.getDict_id()));
		}
		
		//拼接配置信息
		Dict profile = record.getProfile();
		if(profile != null && !profile.getDict_id().trim().isEmpty()) {
			criteria.add(Restrictions.eq("profile.dict_id", profile.getDict_id()));
		}
		PageBean<Record> page = recordService.findByPage(this.getPageCode(),this.getPageSize(),criteria);
		//压栈
		List<Record> beanList = page.getBeanList();
		for(Record r : beanList) {
			String newDate = r.getRecord_date().replace('T', ' ');
			r.setRecord_date(newDate);
		}
		this.setVs("page", page);
		return "page";
	}
	
	/**
	 * 按条件分页查询record并初始化到下载页面
	 * @return
	 */
	public String findByPageAndDownload() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Record.class);
		//获取patient
		Patient p = record.getPatient();
		if(p != null && p.getPatient_id() != null) {
			criteria.add(Restrictions.eq("patient.patient_id", p.getPatient_id()));
		}
		//拼接设备信息
		Dict device = record.getDevice();
		if(device != null && !device.getDict_id().trim().isEmpty()) {
			criteria.add(Restrictions.eq("device.dict_id", device.getDict_id()));
		}
		
		//拼接配置信息
		Dict profile = record.getProfile();
		if(profile != null && !profile.getDict_id().trim().isEmpty()) {
			criteria.add(Restrictions.eq("profile.dict_id", profile.getDict_id()));
		}
		PageBean<Record> page = recordService.findByPage(this.getPageCode(),this.getPageSize(),criteria);
		//压栈
		this.setVs("page", page);
		List<Record> beanList = page.getBeanList();
		for(Record r : beanList) {
			String newDate = r.getRecord_date().replace('T', ' ');
			r.setRecord_date(newDate);
		}
		return "downloadPage";
	}
	
	//数据下载
	public String downloadData() {
		String filepath = record.getRecord_filepath();
		setDownloadPath(filepath);
		filename = filepath.substring(filepath.lastIndexOf("\\")+1);
//		contentType = "application/x-msdownload";
		contentType = "application/octet-stream;charset=ISO8859-1";
		
		return SUCCESS;
	}
	
	//label数据下载
	public String downloadLabel() {
		String labelpath = record.getRecord_labelpath();
		setDownloadPath(labelpath);
		filename = labelpath.substring(labelpath.lastIndexOf("\\")+1);
//		contentType = "application/x-msdownload";
		contentType = "application/octet-stream;charset=ISO8859-1";
		
		return SUCCESS;
	}
	
	/**
	 * 初始化详情界面
	 * @return
	 */
	public String initDetail() {
		this.setVs("currPageCode", this.getPageCode());
		record = recordService.findById(record.getRecord_id());
		String newDate = record.getRecord_date().replace('T', ' ');
		record.setRecord_date(newDate);
		return "initDetail";
	}
	
	/**
	 * 初始化更新界面
	 * @return
	 */
	public String initUpdate() {
		record = recordService.findById(record.getRecord_id());
		String newDate = record.getRecord_date().replace(' ', 'T');
		record.setRecord_date(newDate);
		return "initUpdate";
	}
	
	/**
	 * 初始化添加界面
	 * @return
	 */
	public String initAddUI() {
		return "initAddUI";
	}
	
	/**
	 * PRM添加实验记录
	 * @return
	 * @throws IOException 
	 */
	public String add() throws IOException {
		if(record.getPatient().getPatient_id() == null) {
			this.setVs("msg", "添加试验记录失败");
			return "addFail";
		}else {
			Patient currentPatient = patientService.findById(record.getPatient().getPatient_id());
			//把patient封装入record中
			record.setPatient(currentPatient);
			//保存上传的数据
			if(uploadFileName != null) {
				//把data上传到
				String datapath = "F:\\PIMC_SEMG\\"+currentPatient.getPatient_name()+"\\data\\";
				//创建data
				File data = new File(datapath+uploadFileName.get(0));
				
				//把label上传到
				String labelpath = "F:\\PIMC_SEMG\\"+currentPatient.getPatient_name()+"\\label\\";
				//创建label
				File label = new File(labelpath+uploadFileName.get(1));
				
				FileUtils.copyFile(upload.get(0), data);
				FileUtils.copyFile(upload.get(1), label);
				//把数据保存的路径封装到record中
				record.setRecord_filepath(datapath+uploadFileName.get(0));
				record.setRecord_labelpath(labelpath+uploadFileName.get(1));
			}
			String newDate = record.getRecord_date().replace('T', ' ');
			record.setRecord_date(newDate);
			//保存当前record
			recordService.save(record);
			return "addsuccess";
		}	
	}
	
	/**
	 * 统计record分布情况
	 * @return
	 */
	public String recordPercent() {
		//查询每条记录的识别率，统计出每个区间概率
		List<Double> accuracyList = recordService.findAllAccuracy();
		System.out.println(accuracyList+"---------------------------");
		Map<String, Integer> map = new LinkedHashMap<>();
		map.put("<40%", 0);
		map.put("40%-50%", 0);
		map.put("50%-60%", 0);
		map.put("60%-70%", 0);
		map.put("70%-80%", 0);
		map.put("80%-90%", 0);
		map.put("90%-100%", 0);
		for(Double acc : accuracyList) {
			if(acc<40) {
				Integer num = map.get("<40%");
				map.put("<40%", ++num);
			}
			if(acc>=40&&acc<50) {
				Integer num = map.get("40%-50%");
				map.put("40%-50%", ++num);
			}
			if(acc>=50&&acc<60) {
				Integer num = map.get("50%-60%");
				map.put("50%-60%", ++num);
			}
			if(acc>=60&&acc<70) {
				Integer num = map.get("60%-70%");
				map.put("60%-70%", ++num);
			}
			if(acc>=70&&acc<80) {
				Integer num = map.get("70%-80%");
				map.put("70%-80%", ++num);
			}
			if(acc>=80&&acc<90) {
				Integer num = map.get("80%-90%");
				map.put("80%-90%", ++num);
			}
			if(acc>=90&&acc<100) {
				Integer num = map.get("90%-100%");
				map.put("90%-100%", ++num);
			}
		}
		System.out.println(map.values());
		this.setVs("res", map.values());
		return "recordPercent";
	}
	
	/**
	 * 初始化治疗结果走势图
	 * @return
	 */
	public String resultChartUI() {
		return "resultChartTrend";
	}
	
	/**
	 * 查询被试的治疗结果走势图
	 * @return
	 */
	public String checkResultByPatient() {
		//前端未选择查询哪个被试，跳转到初始化走势图
		if(record.getPatient().getPatient_id()==null) {
			return "resultChartTrendWrong";
		}
		//1.获取被试姓名
		Patient currPatient = patientService.findById(record.getPatient().getPatient_id());
		String patient_name = currPatient.getPatient_name();
		//2.拼接横纵坐标
		List<String> accuracyList = recordService.findAccuracysByPatient(record.getPatient().getPatient_id());
		String xAxis = "[";
		for(int i=1;i<accuracyList.size();i++) {
			xAxis+="'第"+i+"次',";
		}
		xAxis+="'第"+accuracyList.size()+"次']";
		//3.压栈
		this.setVs("patient_name", patient_name);
		this.setVs("xAxis", xAxis);
		this.setVs("yAxis", accuracyList);
		return "resultChartTrend";
	}
	
	/**
	 * 离线结果排行
	 * @return
	 */
	public String recordRanking() {
		List<Record> rankingList = recordService.findRankingScore();
		
		if(rankingList==null || rankingList.size()==0) {
			this.setVs("msg", "暂未查询到治疗记录");
			return "rankingFail";
		}
		
		String xAxis = "[";
		String yAxis = "[";
		for(int i=0;i<rankingList.size()-1;i++) {
			xAxis+= rankingList.get(i).getRecord_score()+",";
			yAxis+="'"+rankingList.get(i).getPatient().getPatient_name()+"',";
		}
		xAxis+=""+rankingList.get(rankingList.size()-1).getRecord_score()+"]";
		yAxis+="'"+rankingList.get(rankingList.size()-1).getPatient().getPatient_name()+"']";
		this.setVs("accracy", xAxis);
		this.setVs("names", yAxis);
		return "recordRanking";
	}
}
