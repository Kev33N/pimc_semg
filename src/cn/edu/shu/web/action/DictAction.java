package cn.edu.shu.web.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.ModelDriven;

import cn.edu.shu.domain.Dict;
import cn.edu.shu.domain.PageBean;
import cn.edu.shu.domain.User;
import cn.edu.shu.service.DictService;
import cn.edu.shu.service.RecordService;
import cn.edu.shu.utils.FastJsonUtil;

public class DictAction extends BaseAction implements ModelDriven<Dict> {

	private static final long serialVersionUID = -396231576899162858L;
	
	private Dict dict = new Dict();
	@Override
	public Dict getModel() {
		return dict;
	}
	
	private DictService dictService;
	public void setDictService(DictService dictService) {
		this.dictService = dictService;
	}
	
	private RecordService recordService;
	public void setRecordService(RecordService recordService) {
		this.recordService = recordService;
	}

	/**
	 * 通过字段的type_code查询设备信息或配置信息
	 * @return
	 */
	public String findByCodeByAjax() {
		//调用业务层
		List<Dict> list = dictService.findByCode(dict.getDict_type_code());
//		List<Dict> list = dictService.findByCode("001");
		//使用fastjson吧list转换为json字符串
		String jsonString = FastJsonUtil.toJSONString(list);
		//把json字符串写回浏览器
		HttpServletResponse response = ServletActionContext.getResponse();
		FastJsonUtil.write_json(response, jsonString);
		
		return NONE;
	}
	
	/**
	 * 按条件分页查询dict(device)
	 * @return
	 */
	public String findDeviceByPage() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Dict.class);
		String dict_item_name = dict.getDict_item_name();
		if(dict_item_name != null && !dict_item_name.trim().isEmpty()) {
			criteria.add(Restrictions.like("dict_item_name", "%"+dict_item_name+"%"));
		}
		criteria.add(Restrictions.eq("dict_type_code", "001"));
		//调用业务层
		PageBean<Dict> pageDevice = dictService.findByPage(this.getPageCode(),this.getPageSize(),criteria);
		//压栈
		this.setVs("page", pageDevice);
		return "pageDevice";
	}
	/**
	 * 按条件分页查询dict(profile)
	 * @return
	 */
	public String findProfileByPage() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Dict.class);
		String dict_item_name = dict.getDict_item_name();
		if(dict_item_name != null && !dict_item_name.trim().isEmpty()) {
			criteria.add(Restrictions.like("dict_item_name", "%"+dict_item_name+"%"));
		}
		criteria.add(Restrictions.eq("dict_type_code", "002"));
		//调用业务层
		PageBean<Dict> pageProfile = dictService.findByPage(this.getPageCode(),this.getPageSize(),criteria);
		//压栈
		this.setVs("page", pageProfile);
		return "pageProfile";
	}
	
	/**
	 * 初始化修改页面(Device)
	 * @return
	 */
	public String initEditDeviceUI() {
		dict = dictService.findDictByDictId(dict.getDict_id());
		return "editDevice";
	}
	
	/**
	 * 修改device
	 * @return
	 */
	public String updateDevice() {
		dictService.update(dict);
		return "updateDeviceOk";
	}
	
	/**
	 * 初始化新增设备
	 * @return
	 */
	public String initAddNewDeviceUI() {
		return "addNewDeviceUI";
	}
	
	/**
	 * 新增device
	 * @return
	 */
	public String saveDevice() {
		dictService.saveDict(dict);
		return "saveDeviceOk";
	}
	
	/**
	 * 初始化修改页面(Profile)
	 * @return
	 */
	public String initEditProfileUI() {
		dict = dictService.findDictByDictId(dict.getDict_id());
		return "editProfile";
	}
	
	/**
	 * 修改profile
	 * @return
	 */
	public String updateProfile() {
		dictService.update(dict);
		return "updateProfileOk";
	}
	
	/**
	 * 初始化新增设备
	 * @return
	 */
	public String initAddNewProfileUI() {
		return "addNewProfileUI";
	}
	
	/**
	 * 新增device
	 * @return
	 */
	public String saveProfile() {
		dictService.saveDict(dict);
		return "saveProfileOk";
	}
	
	
	/**
	 * 查询设备所占份额
	 * @return
	 */
	public String devicePercent() {
		//查询总record数
		int recordsNumber = recordService.findTotalNumber();
		//查询所有设备
		List<Dict> devices = dictService.findAllDevice();
		Map<String,Double> percent = new HashMap<>();
		String key = null;
		//num为一种设备所做实验数目
		int num = 1;
		//value为所占份额
		Double value = null;
		for(Dict device : devices) {
			key = device.getDict_item_name();
			num = recordService.findNumByDeviceId(device.getDict_id());
			value = num*1.0/recordsNumber;
			percent.put(key, value);
		}
		String res = FastJsonUtil.toHighChartJsonString(percent);
		this.setVs("res", res);
		return "devicePercent";
	}
}
