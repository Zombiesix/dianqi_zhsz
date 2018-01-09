package com.jxust.dianqi.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {

	private final static Configuration cfg;
	private final static SessionFactory sessionFactory;

	static{
		cfg = new Configuration().configure();
		sessionFactory = cfg.buildSessionFactory();
	}
	
	/**
	 * 从工厂中获取session
	 */
	public static Session getSession(){
		return sessionFactory.openSession();
	}
	
	/**
	 * 还可以绑定本地session
	 */
	public static Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}
}
