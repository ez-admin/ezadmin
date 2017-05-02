package com.ez.ssm;

import com.ez.system.entity.SysMenu;
import com.ez.system.service.SysMenuService;
import com.ez.system.service.SysUserService;
import com.ez.util.RightsHelper;
import com.ez.util.Tools;
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

	@Test
	public void testquery() throws Exception {
		List<SysMenu> allmenuList =sysMenuService.findAll();
		if (allmenuList!=null && allmenuList.size()>0){
			for (int i = 0; i <allmenuList.size() ; i++) {
				System.out.println("allmenuList = " + allmenuList.get(i).toString());
			}
		}
	}

	/*
	@Test
	public void testQuery() {
		SysUser sysUser = sysUserService.getById(1L);
		SysUser sysUser2 = sysUserService.findBySysUserId(1L);
		SysUser sysUser3 = sysUserService.findBySysUserLoginName("YouMeek4");
		List<SysUser> sysUserList1 = sysUserService.findDistinctSysUserBySysUserLoginNameOrSysUserId("YouMeek5", 3L);
		System.out.println("--------------------------------" + sysUser.toString());
		System.out.println("--------------------------------" + sysUser2.toString());
		System.out.println("--------------------------------" + sysUser3.toString());
		System.out.println("--------------------------------" + sysUserList1.toString());
		
	}
	
	@Test
	public void testSave() {
		SysUser sysUser = new SysUser();
		
		sysUser.setSysUserLoginName("YouMeek88");
		sysUser.setSysUserLoginPassword("e10adc3949ba59abbe56e057f20f883e");
		sysUser.setSysUserIsDelete("N");
		sysUser.setSysUserRegisterDatetime(new Date());
		sysUser.setSysUserEmail("363379444@qq.com");
		sysUser.setSysUserMobile("15626256504");
		
		// JPA 的save 方法还支持批量插入，只要传入的参数是 List 就可以
		SysUser sysUserResult = sysUserService.saveAndUpdateSysUser(sysUser);
		System.out.println("--------------------------------" + sysUserResult.toString());
		
	}
	
	@Test
	public void testSaveSysUserToTransactionalTest() {
		SysUser sysUser = new SysUser();
		
		sysUser.setSysUserLoginName("YouMeek99");
		sysUser.setSysUserLoginPassword("e10adc3949ba59abbe56e057f20f883e");
		sysUser.setSysUserIsDelete("N");
		sysUser.setSysUserRegisterDatetime(new Date());
		sysUser.setSysUserEmail("363379444@qq.com");
		sysUser.setSysUserMobile("15626256504");
		
		//在 Service 中有异常抛出，所以这条记录应该不会被插入到数据库
		SysUser sysUserResult = sysUserService.saveAndUpdateSysUserToTransactionalTest(sysUser);
		System.out.println("--------------------------------" + sysUserResult.toString());
		
	}
	
	@Test
	public void testUpdate() {
		SysUser sysUser = new SysUser();
		
		//只要对象中含有主键，它会自动判断进行更新还是新增
		sysUser.setSysUserId(6L);
		sysUser.setSysUserLoginName("YouMeek66");
		sysUser.setSysUserLoginPassword("e10adc3949ba59abbe56e057f20f883e");
		sysUser.setSysUserIsDelete("N");
		sysUser.setSysUserRegisterDatetime(new Date());
		sysUser.setSysUserEmail("363379444@qq.com");
		sysUser.setSysUserMobile("15626256504");
		
		SysUser sysUserResult = sysUserService.saveAndUpdateSysUser(sysUser);
		System.out.println("--------------------------------" + sysUserResult.toString());
		
	}
	
	@Test
	public void testDelete() {
		sysUserService.deleteBySysUserId(6L);
	}
	
	@Test
	public void testBatchDelete() {
		List<SysUser> sysUserList = new ArrayList<>();
		
		SysUser sysUser1 = new SysUser();
		sysUser1.setSysUserId(10L);
		
		SysUser sysUser2 = new SysUser();
		sysUser2.setSysUserId(11L);
		
		sysUserList.add(sysUser1);
		sysUserList.add(sysUser2);
		
		sysUserService.deleteInBatch(sysUserList);
	}
	
	
	@Test
	public void testQueryPage() {
		
		//当前页的下标是从0开始的，这个要特别注意
		//也可以在查询前设置排序规则：
		//Sort sort = new Sort(Direction.DESC, "id");
		//Pageable pageable = new PageRequest(currentPageNum, perPageSize, sort);
		Pageable pageable = new PageRequest(1, 2);
		Page<SysUser> pageResult = sysUserService.findBySysUserIsDeleteOrderBySysUserIdDesc("N", pageable);
		
		//表示满足条件的所有元素有多少个，跟分页返回结果集数没有关系
		System.out.println("--------------------------------一共有多少元素：" + pageResult.getTotalElements());
		
		//所有结果集可以被分成几页
		System.out.println("--------------------------------被分成多少页：" + pageResult.getTotalPages());
		
		//查询的当前页结果集，这是一个 List 对象
		System.out.println("--------------------------------当前页的所有结果集(List)：" + pageResult.getContent());
		
		//当前是第几页(0，表示第一页)
		System.out.println("--------------------------------当前是第几页(0，表示第一页)：" + pageResult.getNumber());
		
		//当前页有多少个元素
		System.out.println("--------------------------------当前页有多少个元素：" + pageResult.getNumberOfElements());
		
		//是否有结果集返回，有是 true
		System.out.println("--------------------------------是否有结果集返回：" + pageResult.hasContent());
		
		//是否是第一页
		System.out.println("--------------------------------是否是第一页：" + pageResult.isFirst());
		
		//是否是最后一页
		System.out.println("--------------------------------是否是最后一页：" + pageResult.isLast());
		
		//是否有下一页，有是 true
		System.out.println("--------------------------------是否有下一页：" + pageResult.hasNext());
		
		//是否有上一页，有是 true
		System.out.println("--------------------------------是否有上一页：" + pageResult.hasPrevious());
	}*/

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
}
