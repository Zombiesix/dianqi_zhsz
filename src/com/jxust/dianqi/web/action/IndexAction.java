package com.jxust.dianqi.web.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.dsna.util.images.ValidateCode;

import com.jxust.dianqi.bean.PageBean;
import com.jxust.dianqi.bean.ProClass;
import com.jxust.dianqi.bean.Student;
import com.jxust.dianqi.service.StudentService;
import com.jxust.dianqi.service.impl.StudentServiceImpl;
import com.jxust.dianqi.utils.FastJsonUtil;
import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport{

	private static final long serialVersionUID = 1L;

	/**
	 * 将所有在“主要操作”中获得的数据放到值栈中
	 */
	/**private PageBean<Student> pageBean = new PageBean<Student>();
	private List<Student> lists = new ArrayList<Student>();
	public PageBean<Student> getPageBean() {
		return pageBean;
	}
	public List<Student> getLists() {
		return lists;
	}*/
	
	// 向action中注入service对象
	private StudentService studentService;
	
	public void setStudentService(StudentService studentService){
		this.studentService = studentService;
	}

	/**
	 * 主要操作
	 */
	Integer currPage;
	public String index() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		
		//得到所有的专业班级（然后放到request域中）
		List<ProClass> listp = studentService.findAllProClass();
		
		//查询得到所有的管理员信息
		List<Student> lists = studentService.findAllAdmin();
		
		//进行学生的分页查询
		//首先设置“当前页面”和“总页面数”（注：这两个参数不能只在pageBean中进行初始化，因为后面的操作需要使用到这些参数）；但想totalPage就可以只在Bean中初始化就行
		/*有点小问题，没有currPage参数
		 * HttpServletRequest request = ServletActionContext.getRequest();
		Integer currPage = Integer.parseInt(request.getParameter("currPage"));
		if(currPage == null){
			currPage = 1;
		}*/
		if(request.getQueryString() == null){
			currPage = 1;
		}else{
			currPage = Integer.parseInt(request.getParameter("currPage"));
		}
		Integer pageSize = 10;
		PageBean<Student> pageBean = studentService.findNewStudentByPage(currPage, pageSize);

		//将当前页面值（currPage）共享出来，供后续的异步操作
//		request.setAttribute("currPage", currPage);
		
		//最后进行数据的共享，传递到jsp中进行显示
		request.setAttribute("listp", listp);
		request.setAttribute("lists", lists);
		request.setAttribute("pageBean", pageBean);
		
		return "index";
	}
	
	/**
	 * 主页上电子排名的异步请求
	 * @return
	 * @throws Exception
	 */
	public String ajaxRank() throws Exception{
		
		// 得到浏览器传来的参数
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		Integer currPage = Integer.parseInt(request.getParameter("currPage"));
		
		// 根据条件进行数据的查询
		Integer pageSize = 10;
		PageBean<Student> pageBean = studentService.findNewStudentByPage(currPage, pageSize);

		//将当前页面值（currPage）共享出来，供后续的异步操作
//		request.setAttribute("currPage", currPage);
		
		// 将查询到的数据以 json 的格式返回浏览器
		String jsonString = FastJsonUtil.toJSONString(pageBean);
		FastJsonUtil.write_json(response, jsonString);
		
		
		return null;
	}
}
