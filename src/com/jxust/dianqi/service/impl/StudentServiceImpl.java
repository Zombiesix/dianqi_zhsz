package com.jxust.dianqi.service.impl;

import java.util.List;

import com.jxust.dianqi.bean.Hobby;
import com.jxust.dianqi.bean.PageBean;
import com.jxust.dianqi.bean.ProClass;
import com.jxust.dianqi.bean.Student;
import com.jxust.dianqi.bean.StudentInfo;
import com.jxust.dianqi.dao.StudentDao;
import com.jxust.dianqi.service.StudentService;

public class StudentServiceImpl implements StudentService {

	// 注入dao
	private StudentDao dao;
	
	public void setStudentDao(StudentDao dao){
		this.dao = dao;
	}
	
	/**
	 * 查询出所有的专业班级在导航栏进行显示
	 */
	@Override
	public List<ProClass> findAllProClass() throws Exception {
		// TODO Auto-generated method stub
		return dao.findAllProClass();
	}

	/**
	 * 查询每个班中的管理员在主页中进行显示（可以通过其中的一个字段“是否为管理员”进行获取）
	 */
	@Override
	public List<Student> findAllAdmin() throws Exception {
		// TODO Auto-generated method stub
		return dao.findAllAdmin();
	}

	/**
	 * 分页查找今年已经添加了信息的学生在主页进行显示
	 */
	@Override
	public PageBean<Student> findNewStudentByPage(Integer currPage, Integer pageSize) throws Exception {
		// TODO Auto-generated method stub
		List<Student> lists = dao.findNewStudentByPage(currPage, pageSize);
		
		Long totalCount = dao.getTotalCount();
		
		return new PageBean<Student>(lists, currPage, pageSize, totalCount);
	}

	/**
	 * 检查登录用户
	 */
	@Override
	public Student checkByAccountAndPwd(String account, String password)
			throws Exception {
		// TODO Auto-generated method stub
		return dao.checkByAccountAndPwd(account, password);
	}

	/**
	 * 查询学生
	 */
	@Override
	public Student findStudentByName(String searchName) throws Exception {
		// TODO Auto-generated method stub
		return dao.findStudentByName(searchName);
	}
	
	/**
	 * 查询学生
	 */
	@Override
	public Student findStudentAndByName(String name) throws Exception {
		// TODO Auto-generated method stub
		return dao.findStudentAndByName(name);
	}

	/**
	 * 根据用户名进行用户信息的更新
	 */
	@Override
	public void updateStudentInfoByName(Student student) throws Exception {
		// TODO Auto-generated method stub
		dao.updateStudentInfoByName(student);
	}

	/**
	 * 得到所有的爱好值
	 */
	@Override
	public List<Hobby> getAllHobby() throws Exception {
		// TODO Auto-generated method stub
		return dao.getAllHobby();
	}

	/**
	 * 根据校验码验证
	 */
	@Override
	public Student checkCode(String check_code, String account) throws Exception {
		// TODO Auto-generated method stub
		return dao.checkCode(check_code, account);
	}

	/**
	 * 根据校验码进行密码的设置
	 */
	@Override
	public void setNewPwd(String account, String newPwd) throws Exception {
		// TODO Auto-generated method stub
		dao.setNewPwd(account, newPwd);
	}

	/**
	 * 根据用户账号判断是否存在
	 */
	@Override
	public Student accountIfExist(String account) throws Exception {
		// TODO Auto-generated method stub
		return dao.accountIfExist(account);
	}

	/**
	 * 查询此分数的排名
	 * @param scoretotal
	 * @return
	 * @throws Exception
	 */
	@Override
	public int findStudentRank(double scoretotal) throws Exception {
		// TODO Auto-generated method stub
		List<Double> list = dao.findStudentTotalScore();
		int i = 1;//用来记录排名,默认为第一名
		for(Double s : list){
			if(scoretotal < s){//判断有多少学生比指定数大，排名九尾多少+1名
				i++;
			}
		}
		return i;
	}

/****************保存学生提交的综合素质信息***********************/
	/**
	 * 
	 */
	@Override
	public void saveStudentInfo(StudentInfo studentInfo)
			throws Exception {
		// TODO Auto-generated method stub
		dao.saveStudentInfo(studentInfo);
	}

	@Override
	public void updateStudent(Student student, String name) throws Exception {
		// TODO Auto-generated method stub
		dao.updateStudent(student, name);
	}

}
