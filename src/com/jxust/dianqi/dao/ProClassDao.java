package com.jxust.dianqi.dao;

import java.util.List;

import com.jxust.dianqi.bean.ProClass;

public interface ProClassDao {

	ProClass findAllInfo(String proClassName) throws Exception;

}
