package com.jxust.dianqi.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.jxust.dianqi.bean.Hobby;
import com.jxust.dianqi.bean.ProClass;
import com.jxust.dianqi.bean.Student;
import com.jxust.dianqi.bean.StudentInfo;
import com.jxust.dianqi.service.StudentService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class StudentInfoAction extends ActionSupport implements ModelDriven<StudentInfo>{

	private static final long serialVersionUID = 1L;
	
	private StudentInfo studentInfo = new StudentInfo();
	
	@Override
	public StudentInfo getModel() {
		// TODO Auto-generated method stub
		return studentInfo;
	}
	
	private StudentService studentService;
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	/**
	 * 将填写完的信息就行提交保存到一个单独的数据表中(成功跳转到用户信息页面)
	 * @return
	 * @throws Exception
	 */
	private double score70p;
	private double score30p;
	private int rank;
	private double scoreTotal;
	public void setScore70p(double score70p) {
		this.score70p = score70p;
	}
	public void setScore30p(double score30p) {
		this.score30p = score30p;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public void setScoreTotal(double scoreTotal) {
		this.scoreTotal = scoreTotal;
	}
	public String addStudentInfo() throws Exception{
		
		List<ProClass> listp = studentService.findAllProClass();
		List<Hobby> lists = studentService.getAllHobby();
		
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("listp", listp);
		request.setAttribute("hobbyList", lists);
		
		//根据学生姓名 保存驱动封装的信息（大部分表单信息）
		Student student = (Student)request.getSession().getAttribute("s");
		//Student s = studentService.findStudentAndByName(student.getName());//先根据姓名查询出学生（包含班级）
		studentInfo.setStudent(student);
		studentService.saveStudentInfo(studentInfo);
		
		//还有表单的部分信息保存到Student表中
		Student sUpdate = new Student();
		sUpdate.setScore30p(score30p);
		sUpdate.setScore70p(score70p);
		sUpdate.setScoreTotal(scoreTotal);
		sUpdate.setRank(rank);
		studentService.updateStudent(sUpdate, student.getName());
		
		return "add-success";
	}
	
}
