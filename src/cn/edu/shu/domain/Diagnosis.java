package cn.edu.shu.domain;

public class Diagnosis {
	
	private Long diagnosis_id;
	private String diagnosis_iEMG;
	private String diagnosis_RMS;
	private String diagnosis_MPF;
	private String diagnosis_MF;
	private String diagnosis_date;
	
	private Patient patient;
	private Action action;
	private Dict device;
	private Dict profile;
	public Long getDiagnosis_id() {
		return diagnosis_id;
	}
	public void setDiagnosis_id(Long diagnosis_id) {
		this.diagnosis_id = diagnosis_id;
	}
	public String getDiagnosis_iEMG() {
		return diagnosis_iEMG;
	}
	public void setDiagnosis_iEMG(String diagnosis_iEMG) {
		this.diagnosis_iEMG = diagnosis_iEMG;
	}
	public String getDiagnosis_RMS() {
		return diagnosis_RMS;
	}
	public void setDiagnosis_RMS(String diagnosis_RMS) {
		this.diagnosis_RMS = diagnosis_RMS;
	}
	public String getDiagnosis_MPF() {
		return diagnosis_MPF;
	}
	public void setDiagnosis_MPF(String diagnosis_MPF) {
		this.diagnosis_MPF = diagnosis_MPF;
	}
	public String getDiagnosis_MF() {
		return diagnosis_MF;
	}
	public void setDiagnosis_MF(String diagnosis_MF) {
		this.diagnosis_MF = diagnosis_MF;
	}
	public String getDiagnosis_date() {
		return diagnosis_date;
	}
	public void setDiagnosis_date(String diagnosis_date) {
		this.diagnosis_date = diagnosis_date;
	}
	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	public Action getAction() {
		return action;
	}
	public void setAction(Action action) {
		this.action = action;
	}
	public Dict getDevice() {
		return device;
	}
	public void setDevice(Dict device) {
		this.device = device;
	}
	public Dict getProfile() {
		return profile;
	}
	public void setProfile(Dict profile) {
		this.profile = profile;
	}

}
