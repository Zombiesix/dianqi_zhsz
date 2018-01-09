package com.jxust.dianqi.web.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.dsna.util.images.ValidateCode;

import com.jxust.dianqi.bean.Hobby;
import com.jxust.dianqi.bean.ProClass;
import com.jxust.dianqi.bean.Student;
import com.jxust.dianqi.service.StudentService;
import com.jxust.dianqi.utils.FastJsonUtil;
import com.jxust.dianqi.utils.MD5Utils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;

public class StudentAction extends ActionSupport implements ModelDriven<Student>{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 封裝提交的数据
	 */
	private Student student = new Student();
	@Override
	public Student getModel() {
		// TODO Auto-generated method stub
		return student;
	}
	
	/**
	 * 将表单中不需要封装到对象中的数据进行属性封装（比如：code、remember 和 searchName）
	 */
	private String remember;
	public String getRemember() {
		return remember;
	}
	public void setRemember(String remember) {
		this.remember = remember;
	}

	/**
	 * 向其中注入service
	 */
	private StudentService studentService;
	public void setStudentService(StudentService studentService){
		this.studentService = studentService;
	}
	
	/**
	 * 用户登录
	 * @throws Exception 
	 */
	public String login() throws Exception{
		// 判断用户是否记住了密码
		/*if(remember != null){
			ActionContext context = ActionContext.getContext();
			ValueStack stack = context.getValueStack();
			stack.set("password", student.getPassword());
		}*/

		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String msg = null;
		//对密码进行加密
		String password = MD5Utils.md5(student.getPassword());
		
		//调用service实现操作
		Student s = studentService.checkByAccountAndPwd(student.getAccount(), password);
		// 得到所有的爱好进行显示
		List<Hobby> lists = studentService.getAllHobby();
		
		//得到所有的专业班级（然后放到request域中）
		List<ProClass> listp = studentService.findAllProClass();
		
		//查询完毕对返回的对象进行判断是否存在
		if(s == null){
			msg = "账号或密码不正确";
			return "index";
		}

		request.getSession().setAttribute("s", s);//将登录的用户信息放入session中进行保存
		// 将登录成功的用户信息放入cookie中
		Cookie aCookie = new Cookie("account", s.getAccount());
		response.addCookie(aCookie);
		if(remember != null){
			Cookie pCookie = new Cookie("password", student.getPassword());
			pCookie.setMaxAge(60*6);
			response.addCookie(pCookie);
		}
		
		request.setAttribute("student", s);
		request.setAttribute("hobbyList", lists);
		request.setAttribute("listp", listp);
		return "info";
	}
	
	/**
	 * 注销账号
	 * @return
	 * @throws Exception
	 */
	public String logout() throws Exception{
		
		//销毁session完成注销
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getSession().invalidate();
		return "index";
	}
	
	/**
	 * 用户修改其基本信息（注：出生年月提交的是三个分开的字符，需要连接到一起）
	 */
	public String updateSByName() throws Exception{
		// 调用service进行用户信息的更新
		studentService.updateStudentInfoByName(student);
		
		// 根据姓名得到用户（）
		Student s = studentService.findStudentByName(student.getName());
		List<Hobby> lists = studentService.getAllHobby();
		
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("student", s);
		request.setAttribute("hobbyList", lists);
		
		// 修改完成跳转到原页面
		return "info";
	}
	
	/**
	 * 根据学生姓名查询学生
	 */
	private String searchName;
	public String setSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String findStudentByName() throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		// 此为添加的功能，需要判断
		String name = null;
		Student s;
		if(searchName == null){
			name = request.getParameter("name");
		}
		if(searchName == null){
			s = studentService.findStudentByName(name);
		}else{
			s = studentService.findStudentByName(searchName);
		}
		if(s == null){
			return "index";
		}
		
		if(searchName == null){
			String jsonString = FastJsonUtil.toJSONString(s);
			
			FastJsonUtil.write_json(response, jsonString);
		}else{
			List<ProClass> listp = studentService.findAllProClass();
			request.setAttribute("student", s);
			request.setAttribute("listp", listp);
			return "user-info";
		}
		
		// 进行用户信息的显示，不用值栈
		return null;
	}
	
	/**
	 * 根据学生姓名得到此学生信息
	 * @return
	 * @throws Exception
	 */
	public String getStudentByName() throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		
		Student s = studentService.findStudentByName(name);
		List<ProClass> listp = studentService.findAllProClass();
		request.setAttribute("student", s);
		request.setAttribute("listp", listp);
		
		return "user-info";
	}
	
	/**
	 * 根据学生名跳转到学生信息页面
	 * @return
	 * @throws Exception
	 */
	public String getUserInfoByName() throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		
		Student s = studentService.findStudentByName(name);
		List<ProClass> listp = studentService.findAllProClass();
		List<Hobby> lists = studentService.getAllHobby();
		
		request.setAttribute("student", s);
		request.setAttribute("hobbyList", lists);
		request.setAttribute("listp", listp);
		
		return "info";
	}
	
	/**
	 * 跳转到填写综合素质信息页面
	 * @return
	 * @throws Exception
	 */
	public String addInfoUI() throws Exception{

		HttpServletRequest request = ServletActionContext.getRequest();

		//得到所有的专业班级（然后放到request域中）
		List<ProClass> listp = studentService.findAllProClass();
		
		String name = request.getParameter("name");
		
		Student s = studentService.findStudentAndByName(name);//带班级查询

		request.setAttribute("student", s);
		request.setAttribute("listp", listp);
		
		return "info-add";
	}
	
/*********************************** 以下为忘记密码的操作  ****************************************/
	
	/**
	 * 用户找回密码
	 * @return
	 * @throws Exception
	 */
	public String forgetPwd() throws Exception{
		
		List<ProClass> listp = studentService.findAllProClass();
		
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("listp", listp);
		
		return "forget-pwd";
	}
	
	/**
	 * 判断是否存在这个账号
	 * @return
	 * @throws Exception
	 */
	public String accountIfExist() throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String account = request.getParameter("account");
		Student s = studentService.accountIfExist(account);
		
		//将账号保存在session中，供后续步骤使用
		request.getSession().setAttribute("accountPwd", account);
		
		// 判断是否有此账号，如果没有返回错误信息（msg），如果有返回正确信息
		String msg = null;
		if(s == null){
			msg = "不存在此账号，请输入正确账号";
		}else{
			msg = "信息填写正确";
		}
		FastJsonUtil.write_json(response, msg);
		
		return null;
	}
	
	/**
	 * 在对密码进行修改之前根据验证码进行判断
	 * @return
	 * @throws Exception
	 */
	private String check_code;
	public String getCheck_code() {
		return check_code;
	}
	public void setCheck_code(String check_code) {
		this.check_code = check_code;
	}
	public String checkCode() throws Exception{
		
		//得到之前放入session中的值，通过此值查找用户
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String account = (String) request.getSession().getAttribute("accountPwd");
		
		Student s = studentService.checkCode(check_code, account);
		String msg = null;
		if(s == null){
			msg = "校验码不匹配";
		}else{
			msg = "信息填写正确";
		}
		FastJsonUtil.write_json(response, msg);
		
		return null;
	}
	
	/**
	 * 设置新密码
	 * @return
	 * @throws Exception
	 */
	private String newPwd;
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public String setNewPwd() throws Exception{

		HttpServletResponse response = ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		String account = (String)request.getSession().getAttribute("accountPwd");
		String msg = null;
		
		newPwd = MD5Utils.md5(newPwd);
		//根据前面设置的账号，修改指定账号的密码
		studentService.setNewPwd(account, newPwd);
		
		FastJsonUtil.write_json(response, msg);
		
		return null;
	}

/**************************************************以下为验证码的使用（可通用）********************************/
	/**
	 * 生成验证码（验证码值放入cookie中，以后验证使用）
	 * @return
	 * @throws Exception
	 */
	public String codeServlet() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		ValidateCode code = new ValidateCode(150, 60, 4, 20);
		String str = code.getCode();
		Cookie codeCookie = new Cookie("code", str);
		response.addCookie(codeCookie);
		code.write(response.getOutputStream());
		return null;
	}
	/**
	 * 检验生成的验证码和用户输出的是否一致
	 * @return
	 */
	public String checkCodeServlet(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String code = request.getParameter("code");
		String msg = null, str = null;
		for(Cookie c : request.getCookies()){
			if(c.getName().equals("code")){
				str = c.getValue();
			}
		}
		if(code.equalsIgnoreCase(str)){
			msg = "";
		}else{
			msg = "验证码输入不正确";
		}
		FastJsonUtil.write_json(response, msg);
		return null;
	}
	
	/**
	 * 根据用户填写的“总分”查询排名数
	 * @return
	 * @throws Exception
	 */
	private double scoreTotal;
	public void setScoreTotal(double scoreTotal){
		this.scoreTotal = scoreTotal;
	}
	public String findStudentRank() throws Exception{
		int rank = studentService.findStudentRank(scoreTotal);
		String rank1 = String.valueOf(rank);
		HttpServletResponse response = ServletActionContext.getResponse();
		FastJsonUtil.write_json(response, rank1);
		return null;
	}

}
