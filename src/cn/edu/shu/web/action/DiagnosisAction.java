package cn.edu.shu.web.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ModelDriven;

import cn.edu.shu.domain.Action;
import cn.edu.shu.domain.Diagnosis;
import cn.edu.shu.domain.PageBean;
import cn.edu.shu.domain.Patient;
import cn.edu.shu.service.DiagnosisService;
import cn.edu.shu.service.PatientService;

public class DiagnosisAction extends BaseAction implements ModelDriven<Diagnosis> {
	
	private static final long serialVersionUID = 1L;
	
	private Diagnosis diagnosis = new Diagnosis();
	
	private DiagnosisService diagnosisService;

	public void setDiagnosisService(DiagnosisService diagnosisService) {
		this.diagnosisService = diagnosisService;
	}
	
	private PatientService patientService;
	public void setPatientService(PatientService patientService) {
		this.patientService = patientService;
	}

	@Override
	public Diagnosis getModel() {
		return diagnosis;
	}
	
	public String save() {
		//从session中取出上传的patient
		Patient patient = (Patient) ServletActionContext.getRequest().getSession().getAttribute("tempPatient");
		//把patient封装入record中
		diagnosis.setPatient(patient);
		String newDate = diagnosis.getDiagnosis_date().replace('T', ' ');
		diagnosis.setDiagnosis_date(newDate);
		diagnosisService.save(diagnosis);
		return "tosuccess";
	}
	
	/**
	 * 按条件分页查询diagnosis
	 * @return
	 */
	public String findByPage() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Diagnosis.class);
		//获取patient
		Patient p = diagnosis.getPatient();
		if(p != null && p.getPatient_id() != null) {
			criteria.add(Restrictions.eq("patient.patient_id", p.getPatient_id()));
		}
		//拼接评估动作信息
		Action action = diagnosis.getAction();
		if(action != null&&action.getAction_id()!=null && action.getAction_id()>0) {
			criteria.add(Restrictions.eq("action.action_id", action.getAction_id()));
		}
		//调用业务层
		PageBean<Diagnosis> pageDiagnosis = diagnosisService.findByPage(this.getPageCode(), this.getPageSize(), criteria);
		//压栈
		this.setVs("page", pageDiagnosis);
		return "page";
	}
	
	/**
	 * 初始化详情界面
	 * @return
	 */
	public String initDetail() {
		this.setVs("currPageCode", this.getPageCode());
		diagnosis = diagnosisService.findById(diagnosis.getDiagnosis_id());
		return "initDetail";
	}
	
	/**
	 * 初始化更新界面
	 * @return
	 */
	public String initUpdate() {
		diagnosis = diagnosisService.findById(diagnosis.getDiagnosis_id());
		String newDate = diagnosis.getDiagnosis_date().replace(' ', 'T');
		diagnosis.setDiagnosis_date(newDate);
		return "initEdit";
	}
	
	/**
	 * 更新diagnosis
	 */
	public String update() {
		String newDate = diagnosis.getDiagnosis_date().replace('T', ' ');
		diagnosis.setDiagnosis_date(newDate);
		diagnosisService.update(diagnosis);
		return "update";
	}
	
	/**
	 * 初始化添加界面
	 * @return
	 */
	public String initAddUI() {
		return "initAddUI";
	}
		
	/**
	 * PIMC添加诊断记录
	 */
	public String add() {
		if(diagnosis.getPatient().getPatient_id() == null) {
			this.setVs("msg", "添加诊断记录失败");
			return "addFail";
		}
		String newDate = diagnosis.getDiagnosis_date().replace('T', ' ');
		diagnosis.setDiagnosis_date(newDate);
		diagnosisService.save(diagnosis);
		return "addsuccess";
	}
	
	/**
	 * 删除试验记录
	 * @return
	 */
	public String delete() {
		diagnosisService.delete(diagnosis);
		return "delete";
	}
	
	/**
	 * 初始化评估结果走势图
	 * @return
	 */
	public String diagnosisTrendInit() {
		return "diagnosisChartTrend";
	}
	
	/**
	 * 查询被试的治疗结果走势图
	 * @return
	 */
	public String findResultByPatientAndAction() {
		//前端未选择查询哪个被试，跳转到初始化走势图
		if(diagnosis.getPatient().getPatient_id()==null || diagnosis.getAction().getAction_id()==null) {
			return "diagnosisChartTrend";
		}
		//1.获取病患姓名
		Patient currPatient = patientService.findById(diagnosis.getPatient().getPatient_id());
		String patient_name = currPatient.getPatient_name();
		//2.查询指标
		//2.1根据病患和评估动作查找iEMG
		List<String> iemgList = diagnosisService.findIEMGByPatientAndAction(diagnosis.getPatient().getPatient_id(),diagnosis.getAction().getAction_id());
		//2.2根据病患和评估动作查找RMS
		List<String> rmsList = diagnosisService.findRMSByPatientAndAction(diagnosis.getPatient().getPatient_id(),diagnosis.getAction().getAction_id());
		//2.3根据病患和评估动作查找MPF
		List<String> mpfList = diagnosisService.findMPFByPatientAndAction(diagnosis.getPatient().getPatient_id(),diagnosis.getAction().getAction_id());
		//2.4根据病患和评估动作查找MF
		List<String> mfList = diagnosisService.findMFByPatientAndAction(diagnosis.getPatient().getPatient_id(),diagnosis.getAction().getAction_id());
		//3.拼接横坐标
		String xAxis = "[";
		for(int i=1;i<iemgList.size();i++) {
			xAxis+="'第"+i+"次',";
		}
		xAxis+="'第"+iemgList.size()+"次']";
		//4.压栈
		this.setVs("patient_name", patient_name);
		this.setVs("xAxis", xAxis);
		this.setVs("yAxis_iemg", iemgList);
		this.setVs("yAxis_rms", rmsList);
		this.setVs("yAxis_mpf", mpfList);
		this.setVs("yAxis_mf", mfList);
		return "diagnosisChartTrend";
	}
}
