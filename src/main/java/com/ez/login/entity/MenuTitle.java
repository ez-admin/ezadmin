package com.ez.login.entity;

import java.util.List;

/**
 * Created by chenez on 2017/1/1.
 */
public class MenuTitle implements java.io.Serializable{

    private static final long serialVersionUID = 1991034812125555220L;
    private Integer id;
    private String title;
    private Integer parentid;
    private String icon;
    private boolean spread = false;
    private String href;

    private List<MenuTitle> children;
    private boolean hasMenu = false;

    public MenuTitle() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getParentid() {
        return parentid;
    }

    public void setParentid(Integer parentid) {
        this.parentid = parentid;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public boolean isSpread() {
        return spread;
    }

    public void setSpread(boolean spread) {
        this.spread = spread;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public List<MenuTitle> getChildren() {
        return children;
    }

    public void setChildren(List<MenuTitle> children) {
        this.children = children;
    }

    public boolean isHasMenu() {
        return hasMenu;
    }

    public void setHasMenu(boolean hasMenu) {
        this.hasMenu = hasMenu;
    }
}
