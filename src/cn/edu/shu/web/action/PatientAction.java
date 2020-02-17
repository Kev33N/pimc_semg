package cn.edu.shu.web.action;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ModelDriven;

import cn.edu.shu.domain.PageBean;
import cn.edu.shu.domain.Patient;
import cn.edu.shu.service.PatientService;
import cn.edu.shu.utils.FastJsonUtil;

public class PatientAction extends BaseAction implements ModelDriven<Patient> {

	private static final long serialVersionUID = -7204569190158250437L;
	
	private Patient patient = new Patient();
	@Override
	public Patient getModel() {
		return patient;
	}
	
	//为Action注入Service（以接口的方式）
	private PatientService patientService;
	public void setPatientService(PatientService patientService) {
		this.patientService = patientService;
	}
	
	/**
	 * 保存用户(通过QT提交)
	 * @return
	 */
	public String save() {
		//patient的姓名和身份证号不能为空
		if(patient.getPatient_name() != null && !patient.getPatient_name().trim().isEmpty() && 
				patient.getPatient_code() != null && !patient.getPatient_code().trim().isEmpty()) {
			//判断当前patient是否存在
			Patient currentPatient = patientService.findByNameAndCode(patient);
			//若不存在则保存当前患者
			if(currentPatient == null) {
				patientService.save(patient);
			}else {
				System.out.println("当前患者已存在");
				patient = currentPatient;
			}
			ServletActionContext.getRequest().getSession().setAttribute("tempPatient", patient);
			return "toRecordInfo";
		}else {
			System.out.println("患者信息不完整");
			return "error";
		}
		
	}
	/**
	 * 保存用户(含有评估信息通过QT提交)
	 * @return
	 */
	public String saveForDiagnosis() {
		//patient的姓名和身份证号不能为空
		if(patient.getPatient_name() != null && !patient.getPatient_name().trim().isEmpty() && 
				patient.getPatient_code() != null && !patient.getPatient_code().trim().isEmpty()) {
			//判断当前patient是否存在
			Patient currentPatient = patientService.findByNameAndCode(patient);
			//若不存在则保存当前用户
			if(currentPatient == null) {
				patientService.save(patient);
			}else {
				System.out.println("当前患者已存在");
				patient = currentPatient;
			}
			ServletActionContext.getRequest().getSession().setAttribute("tempPatient", patient);
			return "toDiagnosisInfo";
		}else {
			System.out.println("患者信息不完整");
			return "error";
		}
		
	}
	/**
	 * 通过PRM管理系统保存用户
	 * @return
	 */
	public String saveFromPRM() {
		//patient的姓名和身份证号不能为空
		if(patient.getPatient_name() != null && !patient.getPatient_name().trim().isEmpty() && 
				patient.getPatient_code() != null && !patient.getPatient_code().trim().isEmpty()) {
			//判断当前patient是否存在
			Patient currentPatient = patientService.findByNameAndCode(patient);
			//若不存在则保存当前被试
			if(currentPatient == null) {
				patientService.save(patient);
				return "toList";
			}else {
				System.out.println("当前用户已存在");
				this.setVs("msg", "当前用户已存在");
				return "alreadyexist";
			}
		}else {
			System.out.println("用户信息不完整");
			this.setVs("msg", "用户信息不完整");
			return "errorFromPRM";
		}
		
	}
	
	/**
	 * 初始化到添加的页面
	 * @return
	 */
	public String initAddUI() {
		return "initAddUI";
	}
	
	/**
	 * 按条件分页查询patient
	 * @return
	 */
	public String findByPage() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Patient.class);
		//获取到用户的姓名
		String patient_name = patient.getPatient_name();
		if(patient_name != null && !patient_name.trim().isEmpty()) {
			criteria.add(Restrictions.like("patient_name", "%"+patient_name+"%"));
		}
		//调用业务层
		PageBean<Patient> page = patientService.findByPage(this.getPageCode(),this.getPageSize(),criteria);
		//压栈
		this.setVs("page", page);
		return "page";
	}

	/**
	 * 查询所有patient
	 */
	public String findAll() {
		List<Patient> list = patientService.findAll();
		
		String jsonString = FastJsonUtil.toJSONString(list);
		HttpServletResponse response = ServletActionContext.getResponse();
		FastJsonUtil.write_json(response, jsonString);
		return NONE;
	}
	
	/**
	 * 跳转到初始详情页面
	 * @return
	 */
	public String initDetail() {
		patient = patientService.findById(patient.getPatient_id());
		return "initDetail";
	}
	
	/**
	 * 跳转到初始修改页面
	 * @return
	 */
	public String initUpdate() {
		patient = patientService.findById(patient.getPatient_id());
		return "initUpdate";
	}
	
	public String update() {
		patientService.update(patient);
		return "update";
	}
	
	public String delete() {
		patient = patientService.findById(patient.getPatient_id());
		patientService.delete(patient);
		return "delete";
	}
}
