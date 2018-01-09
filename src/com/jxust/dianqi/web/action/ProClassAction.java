package com.jxust.dianqi.web.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.jxust.dianqi.bean.ProClass;
import com.jxust.dianqi.service.ProClassService;
import com.jxust.dianqi.service.StudentService;

public class ProClassAction extends StudentAction {

	private static final long serialVersionUID = 1L;

	// 注入service
	private ProClassService proClassService;
	public void setProClassService(ProClassService proClassService){
		this.proClassService = proClassService;
	}
	
	private StudentService studentService;
	public void setStudentService(StudentService studentService){
		this.studentService = studentService;
	}
	
	/**
	 * 显示对应专业班级的所有信息
	 * @return
	 * @throws Exception
	 */
	public String findAllInfo() throws Exception{

		HttpServletRequest request = ServletActionContext.getRequest();
		
		String proClassName = request.getParameter("name");
		ProClass proClass = proClassService.findAllInfo(proClassName);
		
		List<ProClass> listp = studentService.findAllProClass();
		
		request.setAttribute("proClass", proClass);
		request.setAttribute("listp", listp);
		
		return "student-info";
	}
}
