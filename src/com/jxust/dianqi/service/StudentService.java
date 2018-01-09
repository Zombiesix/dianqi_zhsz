package com.jxust.dianqi.service;

import java.util.List;

import com.jxust.dianqi.bean.Hobby;
import com.jxust.dianqi.bean.PageBean;
import com.jxust.dianqi.bean.ProClass;
import com.jxust.dianqi.bean.Student;
import com.jxust.dianqi.bean.StudentInfo;

public interface StudentService {

	List<ProClass> findAllProClass() throws Exception;

	List<Student> findAllAdmin() throws Exception;

	PageBean<Student> findNewStudentByPage(Integer currPage, Integer pageSize) throws Exception;

	Student checkByAccountAndPwd(String account, String password) throws Exception;

	Student findStudentByName(String searchName) throws Exception;

	void updateStudentInfoByName(Student student) throws Exception;

	List<Hobby> getAllHobby() throws Exception;

	Student accountIfExist(String account) throws Exception;

	Student checkCode(String check_code, String account) throws Exception;

	void setNewPwd(String account, String newPwd) throws Exception;

	Student findStudentAndByName(String name) throws Exception;

	int findStudentRank(double scoretotal) throws Exception;

	void saveStudentInfo(StudentInfo studentInfo) throws Exception;

	void updateStudent(Student student, String name) throws Exception;
	
}
