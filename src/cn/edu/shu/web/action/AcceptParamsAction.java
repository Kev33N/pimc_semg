package cn.edu.shu.web.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts2.ServletActionContext;

import cn.edu.shu.domain.Diagnosis;
import cn.edu.shu.domain.Patient;
import cn.edu.shu.domain.Record;

public class AcceptParamsAction extends BaseAction {

	private static final long serialVersionUID = 6036146778457758560L;
	
	public String accept() {
		//接受Qt客户端发送的所有数据
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String, String[]> map = request.getParameterMap();
		
		Patient tempPatient = new Patient();
		Record tempRecord = new Record();
		String deviceName = request.getParameter("deviceName");
		String profileName = request.getParameter("profileName");
		
		try {
			BeanUtils.populate(tempPatient, map);
			BeanUtils.populate(tempRecord, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//将患者、记录、设备名和配置名放入session
		HttpSession session = request.getSession();
		session.setAttribute("tempPatient", tempPatient);
		session.setAttribute("tempRecord", tempRecord);
		session.setAttribute("deviceName", deviceName);
		session.setAttribute("profileName", profileName);
		
		return "accept";
	}
	
	/**
	 * 接收评估数据
	 * @return
	 */
	public String acceptDiagnosis() {
		//接受Qt客户端发送的所有数据
		HttpServletRequest request = ServletActionContext.getRequest();
		Map<String, String[]> map = request.getParameterMap();
		
		Patient tempPatient = new Patient();
		Diagnosis tempDiagnosis = new Diagnosis();
		
		String deviceName = request.getParameter("deviceName");
		String profileName = request.getParameter("profileName");
		String actionName = request.getParameter("actionName");
		
		try {
			BeanUtils.populate(tempPatient, map);
			BeanUtils.populate(tempDiagnosis, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//将患者、记录、设备名和配置名放入session
		HttpSession session = request.getSession();
		session.setAttribute("tempPatient", tempPatient);
		session.setAttribute("tempDiagnosis", tempDiagnosis);
		session.setAttribute("deviceName", deviceName);
		session.setAttribute("profileName", profileName);
		session.setAttribute("actionName", actionName);
		
		return "acceptDiagnosis";
	}
	
	
}
