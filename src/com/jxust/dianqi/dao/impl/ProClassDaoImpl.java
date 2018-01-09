package com.jxust.dianqi.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import com.jxust.dianqi.bean.ProClass;
import com.jxust.dianqi.dao.ProClassDao;

public class ProClassDaoImpl extends HibernateDaoSupport implements ProClassDao {

	@Override
	public ProClass findAllInfo(String proClassName) throws Exception {
		List<ProClass> lists = (List<ProClass>) this.getHibernateTemplate().find(""
				+ "select p from ProClass p left join fetch p.students where p.name = ?", proClassName);
		if(lists == null){
			return null;
		}
		return lists.get(0);
	}

}
