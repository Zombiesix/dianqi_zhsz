package com.jxust.dianqi.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.dianqi.bean.Hobby;
import com.jxust.dianqi.bean.ProClass;
import com.jxust.dianqi.bean.Student;
import com.jxust.dianqi.bean.StudentInfo;
import com.jxust.dianqi.dao.StudentDao;

public class StudentDaoImpl extends HibernateDaoSupport implements StudentDao {

	/**
	 * 查询出所有的专业班级在导航栏进行显示
	 */
	@Override
	public List<ProClass> findAllProClass() throws Exception {
		// TODO Auto-generated method stub
		List<ProClass> list = (List<ProClass>) this.getHibernateTemplate().find("from ProClass");
		return list;
	}

	/**
	 * 查询每个班中的管理员在主页中进行显示（可以通过其中的一个字段“是否为管理员”进行获取）
	 */
	@Override
	public List<Student> findAllAdmin() throws Exception {
		// TODO Auto-generated method stub
		List<Student> list = (List<Student>)this.getHibernateTemplate().find("select s from Student s left join fetch s.proClass where s.identity != ?", 0);
		return list;
	}

	/**
	 * 分页查找今年已经添加了信息的学生在主页进行显示
	 */
	@Override
	public List<Student> findNewStudentByPage(final Integer currPage, final Integer pageSize) throws Exception {
		// TODO Auto-generated method stub
		List<Student> list = getHibernateTemplate().execute(new HibernateCallback<List<Student>>() {
			public List<Student> doInHibernate(Session session){
				Query query = session.createQuery("from Student s where s.status = ?");
				query.setString(0, "1");
				query.setFirstResult((currPage-1)*pageSize);
				query.setMaxResults(pageSize);
				List<Student> list = query.list();
				return list;
			}
		});
		return list;
	}

	/**
	 * 查询出符合条件的所有学生数量
	 */
	@Override
	public Long getTotalCount() throws Exception {
		// TODO Auto-generated method stub
		List<Long> list = (List<Long>)this.getHibernateTemplate().find("select count(*) from Student where status = ?", 1);
		if(list != null && list.size() > 0){
			return list.get(0).longValue();
		}
		return (long) 0;
	}

	/**
	 * 学生的登录
	 */
	@Override
	public Student checkByAccountAndPwd(String account, String password)
			throws Exception {
		// TODO Auto-generated method stub
		// 进行多表连接查询时，需要使用join，可以一次性查询出；
		List<Student> list = (List<Student>)this.getHibernateTemplate().find("select s from Student s left join fetch s.hobbys where s.account = ? and s.password = ?", account, password);
		//判断查询到的list是否为空，为空时不能使用get(0)否则会报溢出异常
		if(list.isEmpty()){
			return null;
		}
		return list.get(0);
	}

	/**
	 * 根据学生名查询到该学生信息（带爱好查询）
	 */
	@Override
	public Student findStudentByName(String searchName) throws Exception {
		// TODO Auto-generated method stub
		List<Student> list = (List<Student>)this.getHibernateTemplate().find("select s from Student s left join fetch s.hobbys where s.name = ?", searchName);
		if(list.isEmpty()){
			return null;
		}
		return list.get(0);
	}
	
	/**
	 * 根据学生名查询到该学生信息（带班级查询）
	 */
	@Override
	public Student findStudentAndByName(String name) throws Exception {
		// TODO Auto-generated method stub
		List<Student> list = (List<Student>)this.getHibernateTemplate().find("select s from Student s left join fetch s.proClass where s.name = ?", name);
		if(list.isEmpty()){
			return null;
		}
		return list.get(0);
	}

	/**
	 * 得到所有的兴趣值
	 */
	@Override
	public List<Hobby> getAllHobby() throws Exception {
		// TODO Auto-generated method stub
		List<Hobby> list = (List<Hobby>)this.getHibernateTemplate().find("from Hobby");
		return list;
	}

	/**
	 * 传入一学生，首先根据学生名查询出该学生，然后进行对应字段的修改
	 */
	@Override
	@Transactional(readOnly = false)
	public void updateStudentInfoByName(Student student) throws Exception {
		// TODO Auto-generated method stub
		List<Student> list = (List<Student>)this.getHibernateTemplate().find("select s from Student s left join fetch s.hobbys where s.name = ?", student.getName());
		Student s = list.get(0);
		s.setTele(student.getTele());
		s.setSignature(student.getSignature());
		this.getHibernateTemplate().update(s);
	}

/**********************************************忘记密码进行找回************************************************/
	/**
	 * 根据校验码得到学生信息
	 */
	@Override
	public Student checkCode(String check_code, String account) throws Exception {
		// TODO Auto-generated method stub
		List<Student> list = (List<Student>)this.getHibernateTemplate().find(""
				+ "from Student where initialPwd = ? and account = ?", check_code, account);
		if((list.size() == 0) || list == null){
			return null;
		}
		return list.get(0);
	}

	/**
	 * 根据用户名修改密码
	 */
	@Override
	@Transactional(readOnly = false)
	public void setNewPwd(String account, String newPwd) throws Exception {
		// TODO Auto-generated method stub
		List<Student> list = (List<Student>)this.getHibernateTemplate().find("from Student where account = ?", account);
		if(list != null && list.size() != 0){
			list.get(0).setPassword(newPwd);
			this.getHibernateTemplate().update(list.get(0));
		}
	}

	/**
	 * 判断账户是否存在
	 */
	@Override
	public Student accountIfExist(String account) throws Exception {
		// TODO Auto-generated method stub
		List<Student> list = (List<Student>)this.getHibernateTemplate().find("from Student s where s.account = ?", account);
		if((list.size() == 0) || list == null){
			return null;
		}
		return list.get(0);
	}

	/**
	 * 查询所有学生的分数字段（注：因为查询的是字段，所以返回的不是对象列表）
	 */
	@Override
	public List<Double> findStudentTotalScore() throws Exception {
		// TODO Auto-generated method stub
		List<Double> list = (List<Double>)this.getHibernateTemplate().find(""
				+ "select (s.scoreTotal) from Student s");
		return list;
	}

/****************保存提交的综合素质信息*********************/
	@Override
	@Transactional(readOnly = false)
	public void saveStudentInfo(StudentInfo studentInfo)
			throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().save(studentInfo);
	}

	@Override
	@Transactional(readOnly = false)
	public void updateStudent(Student student, String name) throws Exception {
		// TODO Auto-generated method stub
		List<Student> list = (List<Student>)this.getHibernateTemplate().find("from Student s where s.name = ?", name);
		Student s = list.get(0);
		s.setScore30p(student.getScore30p());
		s.setScore70p(student.getScore70p());
		s.setScoreTotal(student.getScoreTotal());
		s.setRank(student.getRank());
		/*s.setStatus(1);*/
		this.getHibernateTemplate().update(s);
	}
	
}
