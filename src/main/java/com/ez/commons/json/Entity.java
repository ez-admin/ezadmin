package com.ez.commons.json;


import java.io.Serializable;

/**
 * @auther chenez
 * @description select2 远程请求
 * @date 2017/9/26  17:08
 */
public class Entity implements Serializable {
	private static final long serialVersionUID = -120702763584864885L;
	private Integer id;
	private String text;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
