package com.jxust.dianqi.bean;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class ProClass implements Serializable{

	private static final long serialVersionUID = 1L;

	private Integer pcid;    //专业班级ID

    private String name;    //班级名

    private String headTeacher; //班主任

    private Integer numPerson;  //专业人数

    private Set<Student> students = new HashSet<Student>();

    public Integer getPcid() {
        return pcid;
    }

    public void setPcid(Integer pcid) {
        this.pcid = pcid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getHeadTeacher() {
        return headTeacher;
    }

    public void setHeadTeacher(String headTeacher) {
        this.headTeacher = headTeacher;
    }

    public Integer getNumPerson() {
        return numPerson;
    }

    public void setNumPerson(Integer numPerson) {
        this.numPerson = numPerson;
    }

    public Set<Student> getStudents() {
        return students;
    }

    public void setStudents(Set<Student> students) {
        this.students = students;
    }

}
