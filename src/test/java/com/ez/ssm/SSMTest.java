package com.ez.ssm;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ez.commons.json.Entity;
import com.ez.commons.scheduled.Syslogdeletetask;
import com.ez.commons.support.PropertyUtils;
import com.ez.commons.util.HttpRequestUtil;
import com.ez.modules.cms.entity.CmsInfo;
import com.ez.modules.cms.service.CmsInfoService;
import com.ez.modules.system.entity.SysMenu;
import com.ez.modules.system.service.SysMenuService;
import com.ez.modules.system.service.SysUserService;
import com.ez.commons.util.RightsHelper;
import com.ez.commons.util.Tools;
import org.apache.commons.lang3.StringUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:spring/applicationContext*.xml"})
public class SSMTest {
	
	
	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private SysMenuService sysMenuService;

	@Autowired
	private Syslogdeletetask syslogdeletetask;
	@Autowired
	private CmsInfoService cmsInfoService;

	@Test
	public void testquery() throws Exception {
		List<SysMenu> allmenuList =sysMenuService.findAll();
		if (allmenuList!=null && allmenuList.size()>0){
			for (int i = 0; i <allmenuList.size() ; i++) {
				System.out.println("allmenuList = " + allmenuList.get(i).toString());
			}
		}
	}

	//测试定时任务
	@Test
	public void testtask() {
		syslogdeletetask.deletelog();
	}
	

	//权限和计算
	@Test
	public void qxh(){
		//前台传过来的sys_menu中的MENU_ID值
		//String menuIds="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,20,21";
		String menuIds="9,10,11,12,13,14,15,16,17,18,20,21";
		//Tools.str2StrArray(menuIds)用默认的分隔符(,)将字符串转换为字符串数组
		//sumRights利用BigInteger对权限进行2的权的和计算
		BigInteger rights = RightsHelper.sumRights(Tools.str2StrArray(menuIds));
		System.out.println("RightsHelper.sumRights====>"+rights.toString());
	}
	//权限分计算
	@Test
	public void qxf(){
		//menuIds可以获取数据库中全部值
		List<String> findmenuids=sysMenuService.findmenuids();
		System.out.println("findmenuids = " + findmenuids.toString());
		String[] menuIds=(String[])findmenuids.toArray(new String[0]);
		/*String[] menuIds={"1","2","3","4","5","6","7","8","9","10"};*/
		System.out.println("menuIds = " + menuIds.toString());
		//"1022"是权限和计算的值，判断是否有值
		if(Tools.notEmpty("37777760927054076575232")){
			for(int i=0;i<menuIds.length;i++) {
				//进行比较，有为true，否则为false
				if (RightsHelper.testRights("37777760927054076575232", menuIds[i])) {
					System.out.println("存在");
				} else {
					System.out.println("不存在");
				}
			}
		}else{
			System.out.println("为空");
		}
	}

	/**
	 * 从配置文件取参数
	 */
	@Test
	public void getparmbyfile(){
		String url=PropertyUtils.getProperty("data_source_url");
		//String url= ConfigUtils.getPropertyValue("data_source_url");
		System.out.println("url ======================================== " + url+"=============================");

	}

	/**
	 * @auther chenez
	 * @description 测试json 请求参数格式
	 * @date 2017/9/25  13:47
	 *
	 * {"articles":[{"content":"测试亚运会即将在中国开幕","title":"亚运会即将在中国开幕"},{"content":"测试八","title":"测试八"},{"content":"测试士大夫","title":"【商务部】日本公布基准地价 京都因外国游客增加涨幅位居首位"}]}
	 */
	@Test
	public void jsonobject(){

		String url="http://172.17.20.131:8098/api/data/similar";
		JSONObject jsonObject1=new JSONObject();
		JSONArray JsonArray = new JSONArray();
		for (int i = 1; i < 4; i++) {
			CmsInfo cmsInfo=cmsInfoService.getById(i+"");
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("title",cmsInfo.getCmsInfoTitle());
			jsonObject.put("content",cmsInfo.getCmsInfoDes());
			JsonArray.add(jsonObject);
		}
		jsonObject1.put("articles",JsonArray);
		String parms=jsonObject1.toJSONString();
		System.out.println("jsonObject1 = " + jsonObject1.toJSONString());
		String result= HttpRequestUtil.httpClientPostByShortTime(url,parms);
		JSONObject resultJson=JSONObject.parseObject(result);
		System.out.println("resultJson = " + resultJson);
	}
	@Test
	public void testtrf(){
		List<Entity> entityList=new ArrayList<Entity>();
		for (int i = 1; i < 4; i++) {
			Entity entity = new Entity();
			entity.setId(i);
			if (i == 1){
				entity.setText("中国人");
			}else if (i == 2){
				entity.setText("美国人");
			}else {
				entity.setText("英国人");
			}
			entityList.add(entity);
		}
		String jsonString = JSON.toJSONString(entityList);
		System.out.println("jsonString = " + jsonString);
	}
	@Test
	public void parse(){
		Map<String, Object> map = new HashMap<String, Object>();
		String result=null;
		map = (Map) JSON.parse(result);
		System.out.println("map = " + map);

	}
	@Test
	public void Stringlength(){
		String chargeFlag="19";
		System.out.println("chargeFlag = " + chargeFlag.length());
	}
	@Test
	public void objecttojson(){
		Student stu=new Student();
		stu.setName("JSON");
		stu.setAge("张三\\李四");
		stu.setAddress("北京市西城区");

		net.sf.json.JSONObject jsonObject=new net.sf.json.JSONObject();
		//1、使用JSONObject
		net.sf.json.JSONObject json = net.sf.json.JSONObject.fromObject(stu);
		//2、使用JSONArray
		net.sf.json.JSONArray array= net.sf.json.JSONArray.fromObject(stu);

		String strJson=json.toString();
		String strArray=array.toString();
		System.out.println("strArray.toString() = " + strArray);
		System.out.println("strJson.toString() = " + strJson);

		jsonObject.put("jsonObject",json);
		System.out.println("jsonObject.toString() = " + jsonObject.toString());
		System.out.println("jsonObject= " + jsonObject);

		net.sf.json.JSONObject json1=jsonObject.getJSONObject("jsonObject");
		System.out.println("json1 = " + json1);

	}
	@Test
	public void test12(){
		String ext="";
		ext.replace("123","1");
	}
	@Test
	public void test1(){
		String[] a=new String[]{"","11"};
		System.out.println("a = " + a.length);
		if (a != null && a.length>1){
			System.out.println("a我不是空 = " + a);
		}else {
			System.out.println("a我是空空空空空空 = " + a);

		}
		String[] b=new String[]{"",""};
		System.out.println("b = " + b.length);
		if (b != null && b.length>1){
			System.out.println("b我不是空 = " + b);
		}else {
			System.out.println("b我是空空空空空空 = " + b);
		}
		String[] c=new String[]{""};
		System.out.println("c = " + c.length);
		if (c != null && c.length>1){
			System.out.println("c我不是空 = " + c);
		}else {
			System.out.println("c我是空空空空空空 = " + c);
		}
	}


	public static class Student{
		private  String name;
		private String age;
		private  String address;

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getAge() {
			return age;
		}

		public void setAge(String age) {
			this.age = age;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}
	}
}
