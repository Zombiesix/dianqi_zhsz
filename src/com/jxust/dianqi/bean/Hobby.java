package com.jxust.dianqi.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Hobby implements Serializable{

	private static final long serialVersionUID = 1L;

	/*傻B了
	 * private String movie;	//电影
	
	private String photography;	//摄影
	
	private String pe;	//体育
	
	private String anime;	//动漫
	
	private String foot;	//美食
	
	private String technology;	//科技
	
	private String music;	//音乐
	
	private String tourism;	//旅游
	
	private String finance;	//财经
	
	private String game;	//游戏
	
	private String car;	//汽车
	
	private String fashion;	//时尚
	
	private String publicWelfare;	//公益
	
	private String literature;	//文学
	
	private String pet;	//宠物	*/
	
	private Integer hid;
	
	private String hobbyItem;
	
	private Set<Student> students = new HashSet<Student>();

	public Integer getHid() {
		return hid;
	}

	public void setHid(Integer hid) {
		this.hid = hid;
	}

	public String getHobbyItem() {
		return hobbyItem;
	}

	public void setHobbyItem(String hobbyItem) {
		this.hobbyItem = hobbyItem;
	}

	public Set<Student> getStudents() {
		return students;
	}

	public void setStudents(Set<Student> students) {
		this.students = students;
	}
}
