package com.ez.commons.util;

import com.ez.modules.system.entity.SysMenu;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 权限处理
 * @author:fh
*/
public class Jurisdiction {

	/**
	 * 访问权限及初始化按钮权限(控制按钮的显示)
	 * @param menuUrl  菜单路径
	 * @return
	 */
	public static boolean hasJurisdiction(String menuUrl,HttpSession session){
		//判断是否拥有当前点击菜单的权限（内部过滤,防止通过url进入跳过菜单权限）
		/**
		 * 根据点击的菜单的xxx.do去菜单中的URL去匹配，当匹配到了此菜单，判断是否有此菜单的权限，没有的话跳转到404页面
		 * 根据按钮权限，授权按钮(当前点的菜单和角色中各按钮的权限匹对)
		 */
		Boolean b = true;
		List<SysMenu> menuList = (List)session.getAttribute(PubConstants.SESSION_MENULIST); //获取菜单列表
		
		for(int i=0;i<menuList.size();i++){
			if(menuList.get(i).getMenuUrl().split(".do")[0].equals(menuUrl.split(".do")[0])){
				if(!menuList.get(i).isHasMenu()){				//判断有无此菜单权限
					return false;
				}
			}
		}
		return true;
	}
	
}
