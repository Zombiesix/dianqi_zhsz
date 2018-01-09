package com.jxust.dianqi.bean;

import java.io.Serializable;
import java.util.List;

public class PageBean<E> implements Serializable {

	private static final long serialVersionUID = 1L;

	private List<E> list;
	
	private Integer currPage;
	
	private Integer pageSize;
	
	private Integer totalPage;
	
	private Long totalCount;

	public PageBean(List<E> list, Integer currPage, Integer pageSize,
			Long totalCount) {
		super();
		this.list = list;
		this.currPage = currPage;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalPage() {//注：不能从double转为Integer，但可以转为int
		return (int)Math.ceil(totalCount*1.0/pageSize);
	}

	public Long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}
}
