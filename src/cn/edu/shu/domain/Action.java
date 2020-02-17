package cn.edu.shu.domain;

public class Action {
	
	private Long action_id;
	private String action_name;
	private String action_muscle;
	private String action_type;
	private String action_additional;
	
	public Long getAction_id() {
		return action_id;
	}
	public void setAction_id(Long action_id) {
		this.action_id = action_id;
	}
	public String getAction_name() {
		return action_name;
	}
	public void setAction_name(String action_name) {
		this.action_name = action_name;
	}
	public String getAction_muscle() {
		return action_muscle;
	}
	public void setAction_muscle(String action_muscle) {
		this.action_muscle = action_muscle;
	}
	public String getAction_type() {
		return action_type;
	}
	public void setAction_type(String action_type) {
		this.action_type = action_type;
	}
	public String getAction_additional() {
		return action_additional;
	}
	public void setAction_additional(String action_additional) {
		this.action_additional = action_additional;
	}
	@Override
	public String toString() {
		return "Action [action_id=" + action_id + ", action_name=" + action_name + ", action_muscle=" + action_muscle
				+ ", action_type=" + action_type + ", action_additional=" + action_additional + "]";
	}
	
}
