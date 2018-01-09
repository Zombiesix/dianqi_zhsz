package com.jxust.dianqi.service.impl;

import java.util.List;

import com.jxust.dianqi.bean.ProClass;
import com.jxust.dianqi.dao.ProClassDao;
import com.jxust.dianqi.service.ProClassService;

public class ProClassServiceImpl implements ProClassService {

	// 注入Dao
	private ProClassDao proClassDao;
	public void setProClassDao(ProClassDao proClassDao){
		this.proClassDao = proClassDao;
	}
	
	@Override
	public ProClass findAllInfo(String proClassName) throws Exception {
		return proClassDao.findAllInfo(proClassName);
	}

}
