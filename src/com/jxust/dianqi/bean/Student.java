package com.jxust.dianqi.bean;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.alibaba.fastjson.annotation.JSONField;

public class Student implements Serializable{

	private static final long serialVersionUID = 1L;

	private String sid;     //ID

    private String account; //账号（初始为一卡通号）

    private String password;//密码（初始为身份证后六位）

    private String name;    //真实姓名

    private Integer sex;    //性别（"true"表示男，"false"表示女），之前的不会，换为整形"1"表示男生，直接用字符串吧

    private Date birthday;  //生日

    private String tele;    //手机号

//    将兴趣字段提取出来，单独放入一个表中，和student表使用多对多的关系，见下面
//    private String interesting; //兴趣

    private String stuID;    //学号（两位数的或是一卡通号）

    private Integer identity;    //是否是管理员（"0"表示非管理员，"1"表示班级管理员，"2"表示超级管理员）

    private String avatar;  //头像地址

    private String position;    //班级职位

    private double score70p;     //学业成绩

    private double score30p;     //操行成绩

    private Integer rank;   //排名

    private Integer status = 0; //状态是否为今年的成绩，初始为0

    private String lift;    //成绩是升还是降，升降数为多少,eg:s6,表示升了6位；

    private String signature;   //个性签名
    
    private double scoreTotal;	//学生总分

    @JSONField(serialize=false)
    private ProClass proClass;  //所属那个班级
    
    @JSONField(serialize=false)
    private Set<Hobby> hobbys = new HashSet<Hobby>();
    
    private StudentInfo studentInfo;

	public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getTele() {
        return tele;
    }

    public void setTele(String tele) {
        this.tele = tele;
    }

    /*public String getInteresting() {
        return interesting;
    }

    public void setInteresting(String interesting) {
        this.interesting = interesting;
    }*/

    public String getStuID() {
        return stuID;
    }

    public void setStuID(String stuID) {
        this.stuID = stuID;
    }

    public Integer getIdentity() {
        return identity;
    }

    public void setIdentity(Integer identity) {
        this.identity = identity;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public double getScore70p() {
        return score70p;
    }

    public void setScore70p(double score70p) {
        this.score70p = score70p;
    }

    public double getScore30p() {
        return score30p;
    }

    public void setScore30p(double score30p) {
        this.score30p = score30p;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getLift() {
        return lift;
    }

    public void setLift(String lift) {
        this.lift = lift;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public double getScoreTotal() {
		return scoreTotal;
	}

	public void setScoreTotal(double scoreTotal) {
		this.scoreTotal = scoreTotal;
	}

	public ProClass getProClass() {
        return proClass;
    }

    public void setProClass(ProClass proClass) {
        this.proClass = proClass;
    }

    public Set<Hobby> getHobbys() {
		return hobbys;
	}

	public void setHobbys(Set<Hobby> hobbys) {
		this.hobbys = hobbys;
	}

	public StudentInfo getStudentInfo() {
		return studentInfo;
	}

	public void setStudentInfo(StudentInfo studentInfo) {
		this.studentInfo = studentInfo;
	}
}
