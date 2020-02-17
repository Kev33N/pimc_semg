package cn.edu.shu.domain;

public class Record {

	private Long record_id;

	private String record_date;

	private String record_duration;

	private String record_filepath;

	private String record_labelpath;

	private Double record_score;

	private Patient patient;

	private Dict device;

	private Dict profile;

	public Long getRecord_id() {
		return record_id;
	}

	public void setRecord_id(Long record_id) {
		this.record_id = record_id;
	}

	public String getRecord_date() {
		return record_date;
	}

	public void setRecord_date(String record_date) {
		this.record_date = record_date;
	}

	public String getRecord_duration() {
		return record_duration;
	}

	public void setRecord_duration(String record_duration) {
		this.record_duration = record_duration;
	}

	public String getRecord_filepath() {
		return record_filepath;
	}

	public void setRecord_filepath(String record_filepath) {
		this.record_filepath = record_filepath;
	}

	public String getRecord_labelpath() {
		return record_labelpath;
	}

	public void setRecord_labelpath(String record_labelpath) {
		this.record_labelpath = record_labelpath;
	}

	public Double getRecord_score() {
		return record_score;
	}

	public void setRecord_score(Double record_score) {
		this.record_score = record_score;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
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

	@Override
	public String toString() {
		return "Record [record_id=" + record_id + ", record_date=" + record_date + ", record_duration="
				+ record_duration + ", record_filepath=" + record_filepath + ", record_labelpath=" + record_labelpath
				+ ", record_score=" + record_score + "]";
	}

}
