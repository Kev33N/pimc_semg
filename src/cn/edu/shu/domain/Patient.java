package cn.edu.shu.domain;

import java.util.HashSet;
import java.util.Set;

import com.alibaba.fastjson.annotation.JSONField;

public class Patient {

	private Long patient_id;

	private String patient_code;

	private String patient_name;

	private String patient_gender;

	private String patient_age;

	private String patient_birthday;

	private String patient_phone;

	private String patient_email;

	private String patient_address;

	private String patient_additional;

	@JSONField(serialize = false)
	private Set<Record> records = new HashSet<Record>();
	
	@JSONField(serialize = false)
	private Set<Diagnosis> diagnosis = new HashSet<Diagnosis>();

	public Long getPatient_id() {
		return patient_id;
	}

	public void setPatient_id(Long patient_id) {
		this.patient_id = patient_id;
	}

	public String getPatient_code() {
		return patient_code;
	}

	public void setPatient_code(String patient_code) {
		this.patient_code = patient_code;
	}

	public String getPatient_name() {
		return patient_name;
	}

	public void setPatient_name(String patient_name) {
		this.patient_name = patient_name;
	}

	public String getPatient_gender() {
		return patient_gender;
	}

	public void setPatient_gender(String patient_gender) {
		this.patient_gender = patient_gender;
	}

	public String getPatient_age() {
		return patient_age;
	}

	public void setPatient_age(String patient_age) {
		this.patient_age = patient_age;
	}

	public String getPatient_birthday() {
		return patient_birthday;
	}

	public void setPatient_birthday(String patient_birthday) {
		this.patient_birthday = patient_birthday;
	}

	public String getPatient_phone() {
		return patient_phone;
	}

	public void setPatient_phone(String patient_phone) {
		this.patient_phone = patient_phone;
	}

	public String getPatient_email() {
		return patient_email;
	}

	public void setPatient_email(String patient_email) {
		this.patient_email = patient_email;
	}

	public String getPatient_address() {
		return patient_address;
	}

	public void setPatient_address(String patient_address) {
		this.patient_address = patient_address;
	}

	public String getPatient_additional() {
		return patient_additional;
	}

	public void setPatient_additional(String patient_additional) {
		this.patient_additional = patient_additional;
	}

	public Set<Record> getRecords() {
		return records;
	}

	public void setRecords(Set<Record> records) {
		this.records = records;
	}

	public Set<Diagnosis> getDiagnosis() {
		return diagnosis;
	}

	public void setDiagnosis(Set<Diagnosis> diagnosis) {
		this.diagnosis = diagnosis;
	}

	@Override
	public String toString() {
		return "Patient [patient_id=" + patient_id + ", patient_code=" + patient_code + ", patient_name=" + patient_name
				+ ", patient_gender=" + patient_gender + ", patient_age=" + patient_age + ", patient_birthday="
				+ patient_birthday + ", patient_phone=" + patient_phone + ", patient_email=" + patient_email
				+ ", patient_address=" + patient_address + ", patient_additional=" + patient_additional + "]";
	}

}
