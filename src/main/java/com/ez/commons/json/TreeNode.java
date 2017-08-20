package com.ez.commons.json;

import java.util.Comparator;
import java.util.Map;

@SuppressWarnings("rawtypes")
public class TreeNode implements Comparator {
	private String id = null;

	private String parentId = null;
	
	private String pId;

	private String oldParentId = null;

	private Boolean isParent = null;

	private String name = null;

	private Boolean open = Boolean.valueOf(false);

	private String url = null;

	private String target = null;

	private String iconClose = null;

	private String iconOpen = null;

	private String icon = null;

	private String menuType = null;

	private String desc = null;

	private String manager = null;

	private String phone = null;

	private Boolean existed = null;
	
	private String resKey;
	
	private Integer resLevel;

	private Map<Object, Object> infoMap = null;
	private Boolean checked;
	private Boolean nocheck;
	private Boolean chkDisabled;
	private Boolean drag;
	private Boolean drop;
	private Boolean clickExpand;
	private String click;
	private int level;
	
	private String path;

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getParentId() {
		return this.parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getOldParentId() {
		return this.oldParentId;
	}

	public void setOldParentId(String oldParentId) {
		this.oldParentId = oldParentId;
	}

	public Boolean getIsParent() {
		return this.isParent;
	}

	public void setIsParent(Boolean isParent) {
		this.isParent = isParent;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getOpen() {
		return this.open;
	}

	public void setOpen(Boolean open) {
		this.open = open;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTarget() {
		return this.target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getIconClose() {
		return this.iconClose;
	}

	public void setIconClose(String iconClose) {
		this.iconClose = iconClose;
	}

	public String getIconOpen() {
		return this.iconOpen;
	}

	public void setIconOpen(String iconOpen) {
		this.iconOpen = iconOpen;
	}

	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getMenuType() {
		return this.menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	public Map<Object, Object> getInfoMap() {
		return this.infoMap;
	}

	public void setInfoMap(Map<Object, Object> infoMap) {
		this.infoMap = infoMap;
	}

	public Boolean getChecked() {
		return this.checked;
	}

	public void setChecked(Boolean checked) {
		this.checked = checked;
	}

	public Boolean getNocheck() {
		return this.nocheck;
	}

	public void setNocheck(Boolean nocheck) {
		this.nocheck = nocheck;
	}

	public Boolean getChkDisabled() {
		return this.chkDisabled;
	}

	public void setChkDisabled(Boolean chkDisabled) {
		this.chkDisabled = chkDisabled;
	}

	public Boolean getDrag() {
		return this.drag;
	}

	public void setDrag(Boolean drag) {
		this.drag = drag;
	}

	public Boolean getDrop() {
		return this.drop;
	}

	public void setDrop(Boolean drop) {
		this.drop = drop;
	}

	public Boolean getClickExpand() {
		return this.clickExpand;
	}

	public void setClickExpand(Boolean clickExpand) {
		this.clickExpand = clickExpand;
	}

	public String getClick() {
		return this.click;
	}

	public void setClick(String click) {
		this.click = click;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Boolean getExisted() {
		return existed;
	}

	public void setExisted(Boolean existed) {
		this.existed = existed;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}
	
	

	public String getResKey() {
		return resKey;
	}

	public void setResKey(String resKey) {
		this.resKey = resKey;
	}
	

	public Integer getResLevel() {
		return resLevel;
	}

	public void setResLevel(Integer resLevel) {
		this.resLevel = resLevel;
	}
	
	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public int compareTo(Object obj) {
		TreeNode p = (TreeNode) obj;
		if (p.level > this.level) {
			return 1;
		} else if (p.level < this.level) {
			return -1;
		} else {
			return 0;
		}
	}

	public int compare(Object o1, Object o2) {
		TreeNode p = (TreeNode) o1;
		TreeNode p2 = (TreeNode) o2;
		if (p.level > p2.level) {
			return 1;
		} else if (p.level < p2.level) {
			return -1;
		} else {
			return 0;
		}
	}
}
