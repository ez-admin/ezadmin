package com.ez.ssm;

import com.ez.commons.scheduled.Syslogdeletetask;
import com.ez.commons.support.PropertyUtils;
import com.ez.modules.system.entity.SysMenu;
import com.ez.modules.system.service.SysMenuService;
import com.ez.modules.system.service.SysUserService;
import com.ez.commons.util.RightsHelper;
import com.ez.commons.util.Tools;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigInteger;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:spring/applicationContext*.xml"})
public class SSMTest {
	
	
	@Autowired
	private SysUserService sysUserService;

	@Autowired
	private SysMenuService sysMenuService;

	@Autowired
	private Syslogdeletetask syslogdeletetask;

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
}
