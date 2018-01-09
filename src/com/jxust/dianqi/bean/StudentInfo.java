package com.jxust.dianqi.bean;

import java.io.Serializable;
import java.util.Date;

public class StudentInfo implements Serializable {

	/**
	 * 1、基本信息根据名字就可以直接查询到,所以使用一个“一对一”的操作；
	 * 2、需要就行存储的字段：
	 * 		测评时间(evaluationTime)、
	 * 		专业成绩(professionScore)、专业成绩排名(pSRank)、创新能力分(creativity)、
	 * 		道德素质奖惩分(MQrapScore)、道德素质奖惩分小计(MQrapScoreSub
	 * 		社会实践奖惩分(SPrapScore)、社会实践奖惩分小计(SPrapScoreSub)、
	 * 		其它奖惩分(OTrapScore)、其它奖惩分小计(OTrapScoreSub)、
	 * 3、已经自Student表中存储的字段有：
	 * 		score70p(百分之七十的考试成绩)、score30p(百分之三十的操行评定)、scoretotal(总分)、rank(名次)
	 * ---------------------------------------------------------------------------------
	 * 当需要查询学生的信息填写情况时，空白表格直接使用 HTML 就可以，但其中填写的信息就不能了，需要实现保存到数据库中，然后需要时从中获取
	 * 因为分表中每个输入框都是独立的，可填写也可不填写，所以不可能将一个分表中的信息放在一起，这样显示就会很麻烦；好像只有将每一个输入框都分为一个字段
	 */
	
	private static final long serialVersionUID = 1L;

	private String siid;
	
	private Date evaluationTime = new Date();	//测评时间
	
	private Double professionScore;	//专业成绩
	
	private Integer pSRank;	//专业成绩排名
	
	//分表三
	private String table3_1;	//分表三第一点的加分依据
	
	private Integer table3_1_1;	//分表三第一点的加分数
	
	private String table3_2;
	
	private Integer table3_2_1;

	private String table3_3;
	
	private Integer table3_3_1;

	private String table3_4;
	
	private Integer table3_4_1;

	private String table3_5;
	
	private Integer table3_5_1;

	private String table3_6;
	
	private Integer table3_6_1;

	private String table3_7;
	
	private Integer table3_7_1;

	private String table3_8;
	
	private Integer table3_8_1;

	private String table3_9;
	
	private Integer table3_9_1;
	
	//分表四（相比分表三需要加上一个判断：是为加分还是减分）
	private String table14_1;
	
	private Integer table14_1_1;
	
	private String table14_2;
	
	private Integer table14_2_1;

	private String table14_3;
	
	private Integer table14_3_1;

	private String table14_4;
	
	private Integer table14_4_1;

	private String table14_5;
	
	private Integer table14_5_1;

	private String table14_6;
	
	private Integer table14_6_1;
	
	private String table04_1;	//减分
	
	private Integer table04_1_1;
	
	private String table04_2;
	
	private Integer table04_2_1;
	
	//分表五
	private String table15_1;
	
	private Integer table15_1_1;
	
	private String table15_2;
	
	private Integer table15_2_1;

	private String table15_3;
	
	private Integer table15_3_1;

	private String table15_4;
	
	private Integer table15_4_1;

	private String table15_5;
	
	private Integer table15_5_1;

	private String table15_6;
	
	private Integer table15_6_1;
	
	private String table15_7;
	
	private Integer table15_7_1;
	
	private String table05_1;	//减分
	
	private Integer table05_1_1;
	
	private String table05_2;
	
	private Integer table05_2_1;

	private String table05_3;
	
	private Integer table05_3_1;

	private String table05_4;
	
	private Integer table05_4_1;

	private String table05_5;
	
	private Integer table05_5_1;

	private String table05_6;
	
	private Integer table05_6_1;
	
	private String table05_7;
	
	private Integer table05_7_1;

	private String table05_8;
	
	private Integer table05_8_1;

	private String table05_9;
	
	private Integer table05_9_1;
	
	private String table05_10;
	
	private Integer table05_10_1;
	
	//分表六
	private String table16_1;
	
	private Integer table16_1_1;
	
	private String table16_2;
	
	private Integer table16_2_1;

	private String table16_3;
	
	private Integer table16_3_1;

	private String table16_4;
	
	private Integer table16_4_1;

	private String table16_5;
	
	private Integer table16_5_1;

	private String table16_6;
	
	private Integer table16_6_1;
	
	private String table16_7;
	
	private Integer table16_7_1;
	
	private String table06_1;	//减分
	
	private Integer table06_1_1;
	
	private String table06_2;
	
	private Integer table06_2_1;

	private String table06_3;
	
	private Integer table06_3_1;

	private String table06_4;
	
	private Integer table06_4_1;

	private String table06_5;
	
	private Integer table06_5_1;
	
	private Student student;

	public String getSiid() {
		return siid;
	}

	public void setSiid(String siid) {
		this.siid = siid;
	}

	public Date getEvaluationTime() {
		return evaluationTime;
	}

	public void setEvaluationTime(Date evaluationTime) {
		this.evaluationTime = evaluationTime;
	}

	public Double getProfessionScore() {
		return professionScore;
	}

	public void setProfessionScore(Double professionScore) {
		this.professionScore = professionScore;
	}

	public Integer getpSRank() {
		return pSRank;
	}

	public void setpSRank(Integer pSRank) {
		this.pSRank = pSRank;
	}

	public String getTable3_1() {
		return table3_1;
	}

	public void setTable3_1(String table3_1) {
		this.table3_1 = table3_1;
	}

	public Integer getTable3_1_1() {
		return table3_1_1;
	}

	public void setTable3_1_1(Integer table3_1_1) {
		this.table3_1_1 = table3_1_1;
	}

	public String getTable3_2() {
		return table3_2;
	}

	public void setTable3_2(String table3_2) {
		this.table3_2 = table3_2;
	}

	public Integer getTable3_2_1() {
		return table3_2_1;
	}

	public void setTable3_2_1(Integer table3_2_1) {
		this.table3_2_1 = table3_2_1;
	}

	public String getTable3_3() {
		return table3_3;
	}

	public void setTable3_3(String table3_3) {
		this.table3_3 = table3_3;
	}

	public Integer getTable3_3_1() {
		return table3_3_1;
	}

	public void setTable3_3_1(Integer table3_3_1) {
		this.table3_3_1 = table3_3_1;
	}

	public String getTable3_4() {
		return table3_4;
	}

	public void setTable3_4(String table3_4) {
		this.table3_4 = table3_4;
	}

	public Integer getTable3_4_1() {
		return table3_4_1;
	}

	public void setTable3_4_1(Integer table3_4_1) {
		this.table3_4_1 = table3_4_1;
	}

	public String getTable3_5() {
		return table3_5;
	}

	public void setTable3_5(String table3_5) {
		this.table3_5 = table3_5;
	}

	public Integer getTable3_5_1() {
		return table3_5_1;
	}

	public void setTable3_5_1(Integer table3_5_1) {
		this.table3_5_1 = table3_5_1;
	}

	public String getTable3_6() {
		return table3_6;
	}

	public void setTable3_6(String table3_6) {
		this.table3_6 = table3_6;
	}

	public Integer getTable3_6_1() {
		return table3_6_1;
	}

	public void setTable3_6_1(Integer table3_6_1) {
		this.table3_6_1 = table3_6_1;
	}

	public String getTable3_7() {
		return table3_7;
	}

	public void setTable3_7(String table3_7) {
		this.table3_7 = table3_7;
	}

	public Integer getTable3_7_1() {
		return table3_7_1;
	}

	public void setTable3_7_1(Integer table3_7_1) {
		this.table3_7_1 = table3_7_1;
	}

	public String getTable3_8() {
		return table3_8;
	}

	public void setTable3_8(String table3_8) {
		this.table3_8 = table3_8;
	}

	public Integer getTable3_8_1() {
		return table3_8_1;
	}

	public void setTable3_8_1(Integer table3_8_1) {
		this.table3_8_1 = table3_8_1;
	}

	public String getTable3_9() {
		return table3_9;
	}

	public void setTable3_9(String table3_9) {
		this.table3_9 = table3_9;
	}

	public Integer getTable3_9_1() {
		return table3_9_1;
	}

	public void setTable3_9_1(Integer table3_9_1) {
		this.table3_9_1 = table3_9_1;
	}

	public String getTable14_1() {
		return table14_1;
	}

	public void setTable14_1(String table14_1) {
		this.table14_1 = table14_1;
	}

	public Integer getTable14_1_1() {
		return table14_1_1;
	}

	public void setTable14_1_1(Integer table14_1_1) {
		this.table14_1_1 = table14_1_1;
	}

	public String getTable14_2() {
		return table14_2;
	}

	public void setTable14_2(String table14_2) {
		this.table14_2 = table14_2;
	}

	public Integer getTable14_2_1() {
		return table14_2_1;
	}

	public void setTable14_2_1(Integer table14_2_1) {
		this.table14_2_1 = table14_2_1;
	}

	public String getTable14_3() {
		return table14_3;
	}

	public void setTable14_3(String table14_3) {
		this.table14_3 = table14_3;
	}

	public Integer getTable14_3_1() {
		return table14_3_1;
	}

	public void setTable14_3_1(Integer table14_3_1) {
		this.table14_3_1 = table14_3_1;
	}

	public String getTable14_4() {
		return table14_4;
	}

	public void setTable14_4(String table14_4) {
		this.table14_4 = table14_4;
	}

	public Integer getTable14_4_1() {
		return table14_4_1;
	}

	public void setTable14_4_1(Integer table14_4_1) {
		this.table14_4_1 = table14_4_1;
	}

	public String getTable14_5() {
		return table14_5;
	}

	public void setTable14_5(String table14_5) {
		this.table14_5 = table14_5;
	}

	public Integer getTable14_5_1() {
		return table14_5_1;
	}

	public void setTable14_5_1(Integer table14_5_1) {
		this.table14_5_1 = table14_5_1;
	}

	public String getTable14_6() {
		return table14_6;
	}

	public void setTable14_6(String table14_6) {
		this.table14_6 = table14_6;
	}

	public Integer getTable14_6_1() {
		return table14_6_1;
	}

	public void setTable14_6_1(Integer table14_6_1) {
		this.table14_6_1 = table14_6_1;
	}

	public String getTable04_1() {
		return table04_1;
	}

	public void setTable04_1(String table04_1) {
		this.table04_1 = table04_1;
	}

	public Integer getTable04_1_1() {
		return table04_1_1;
	}

	public void setTable04_1_1(Integer table04_1_1) {
		this.table04_1_1 = table04_1_1;
	}

	public String getTable04_2() {
		return table04_2;
	}

	public void setTable04_2(String table04_2) {
		this.table04_2 = table04_2;
	}

	public Integer getTable04_2_1() {
		return table04_2_1;
	}

	public void setTable04_2_1(Integer table04_2_1) {
		this.table04_2_1 = table04_2_1;
	}

	public String getTable15_1() {
		return table15_1;
	}

	public void setTable15_1(String table15_1) {
		this.table15_1 = table15_1;
	}

	public Integer getTable15_1_1() {
		return table15_1_1;
	}

	public void setTable15_1_1(Integer table15_1_1) {
		this.table15_1_1 = table15_1_1;
	}

	public String getTable15_2() {
		return table15_2;
	}

	public void setTable15_2(String table15_2) {
		this.table15_2 = table15_2;
	}

	public Integer getTable15_2_1() {
		return table15_2_1;
	}

	public void setTable15_2_1(Integer table15_2_1) {
		this.table15_2_1 = table15_2_1;
	}

	public String getTable15_3() {
		return table15_3;
	}

	public void setTable15_3(String table15_3) {
		this.table15_3 = table15_3;
	}

	public Integer getTable15_3_1() {
		return table15_3_1;
	}

	public void setTable15_3_1(Integer table15_3_1) {
		this.table15_3_1 = table15_3_1;
	}

	public String getTable15_4() {
		return table15_4;
	}

	public void setTable15_4(String table15_4) {
		this.table15_4 = table15_4;
	}

	public Integer getTable15_4_1() {
		return table15_4_1;
	}

	public void setTable15_4_1(Integer table15_4_1) {
		this.table15_4_1 = table15_4_1;
	}

	public String getTable15_5() {
		return table15_5;
	}

	public void setTable15_5(String table15_5) {
		this.table15_5 = table15_5;
	}

	public Integer getTable15_5_1() {
		return table15_5_1;
	}

	public void setTable15_5_1(Integer table15_5_1) {
		this.table15_5_1 = table15_5_1;
	}

	public String getTable15_6() {
		return table15_6;
	}

	public void setTable15_6(String table15_6) {
		this.table15_6 = table15_6;
	}

	public Integer getTable15_6_1() {
		return table15_6_1;
	}

	public void setTable15_6_1(Integer table15_6_1) {
		this.table15_6_1 = table15_6_1;
	}

	public String getTable15_7() {
		return table15_7;
	}

	public void setTable15_7(String table15_7) {
		this.table15_7 = table15_7;
	}

	public Integer getTable15_7_1() {
		return table15_7_1;
	}

	public void setTable15_7_1(Integer table15_7_1) {
		this.table15_7_1 = table15_7_1;
	}

	public String getTable05_1() {
		return table05_1;
	}

	public void setTable05_1(String table05_1) {
		this.table05_1 = table05_1;
	}

	public Integer getTable05_1_1() {
		return table05_1_1;
	}

	public void setTable05_1_1(Integer table05_1_1) {
		this.table05_1_1 = table05_1_1;
	}

	public String getTable05_2() {
		return table05_2;
	}

	public void setTable05_2(String table05_2) {
		this.table05_2 = table05_2;
	}

	public Integer getTable05_2_1() {
		return table05_2_1;
	}

	public void setTable05_2_1(Integer table05_2_1) {
		this.table05_2_1 = table05_2_1;
	}

	public String getTable05_3() {
		return table05_3;
	}

	public void setTable05_3(String table05_3) {
		this.table05_3 = table05_3;
	}

	public Integer getTable05_3_1() {
		return table05_3_1;
	}

	public void setTable05_3_1(Integer table05_3_1) {
		this.table05_3_1 = table05_3_1;
	}

	public String getTable05_4() {
		return table05_4;
	}

	public void setTable05_4(String table05_4) {
		this.table05_4 = table05_4;
	}

	public Integer getTable05_4_1() {
		return table05_4_1;
	}

	public void setTable05_4_1(Integer table05_4_1) {
		this.table05_4_1 = table05_4_1;
	}

	public String getTable05_5() {
		return table05_5;
	}

	public void setTable05_5(String table05_5) {
		this.table05_5 = table05_5;
	}

	public Integer getTable05_5_1() {
		return table05_5_1;
	}

	public void setTable05_5_1(Integer table05_5_1) {
		this.table05_5_1 = table05_5_1;
	}

	public String getTable05_6() {
		return table05_6;
	}

	public void setTable05_6(String table05_6) {
		this.table05_6 = table05_6;
	}

	public Integer getTable05_6_1() {
		return table05_6_1;
	}

	public void setTable05_6_1(Integer table05_6_1) {
		this.table05_6_1 = table05_6_1;
	}

	public String getTable05_7() {
		return table05_7;
	}

	public void setTable05_7(String table05_7) {
		this.table05_7 = table05_7;
	}

	public Integer getTable05_7_1() {
		return table05_7_1;
	}

	public void setTable05_7_1(Integer table05_7_1) {
		this.table05_7_1 = table05_7_1;
	}

	public String getTable05_8() {
		return table05_8;
	}

	public void setTable05_8(String table05_8) {
		this.table05_8 = table05_8;
	}

	public Integer getTable05_8_1() {
		return table05_8_1;
	}

	public void setTable05_8_1(Integer table05_8_1) {
		this.table05_8_1 = table05_8_1;
	}

	public String getTable05_9() {
		return table05_9;
	}

	public void setTable05_9(String table05_9) {
		this.table05_9 = table05_9;
	}

	public Integer getTable05_9_1() {
		return table05_9_1;
	}

	public void setTable05_9_1(Integer table05_9_1) {
		this.table05_9_1 = table05_9_1;
	}

	public String getTable05_10() {
		return table05_10;
	}

	public void setTable05_10(String table05_10) {
		this.table05_10 = table05_10;
	}

	public Integer getTable05_10_1() {
		return table05_10_1;
	}

	public void setTable05_10_1(Integer table05_10_1) {
		this.table05_10_1 = table05_10_1;
	}

	public String getTable16_1() {
		return table16_1;
	}

	public void setTable16_1(String table16_1) {
		this.table16_1 = table16_1;
	}

	public Integer getTable16_1_1() {
		return table16_1_1;
	}

	public void setTable16_1_1(Integer table16_1_1) {
		this.table16_1_1 = table16_1_1;
	}

	public String getTable16_2() {
		return table16_2;
	}

	public void setTable16_2(String table16_2) {
		this.table16_2 = table16_2;
	}

	public Integer getTable16_2_1() {
		return table16_2_1;
	}

	public void setTable16_2_1(Integer table16_2_1) {
		this.table16_2_1 = table16_2_1;
	}

	public String getTable16_3() {
		return table16_3;
	}

	public void setTable16_3(String table16_3) {
		this.table16_3 = table16_3;
	}

	public Integer getTable16_3_1() {
		return table16_3_1;
	}

	public void setTable16_3_1(Integer table16_3_1) {
		this.table16_3_1 = table16_3_1;
	}

	public String getTable16_4() {
		return table16_4;
	}

	public void setTable16_4(String table16_4) {
		this.table16_4 = table16_4;
	}

	public Integer getTable16_4_1() {
		return table16_4_1;
	}

	public void setTable16_4_1(Integer table16_4_1) {
		this.table16_4_1 = table16_4_1;
	}

	public String getTable16_5() {
		return table16_5;
	}

	public void setTable16_5(String table16_5) {
		this.table16_5 = table16_5;
	}

	public Integer getTable16_5_1() {
		return table16_5_1;
	}

	public void setTable16_5_1(Integer table16_5_1) {
		this.table16_5_1 = table16_5_1;
	}

	public String getTable16_6() {
		return table16_6;
	}

	public void setTable16_6(String table16_6) {
		this.table16_6 = table16_6;
	}

	public Integer getTable16_6_1() {
		return table16_6_1;
	}

	public void setTable16_6_1(Integer table16_6_1) {
		this.table16_6_1 = table16_6_1;
	}

	public String getTable16_7() {
		return table16_7;
	}

	public void setTable16_7(String table16_7) {
		this.table16_7 = table16_7;
	}

	public Integer getTable16_7_1() {
		return table16_7_1;
	}

	public void setTable16_7_1(Integer table16_7_1) {
		this.table16_7_1 = table16_7_1;
	}

	public String getTable06_1() {
		return table06_1;
	}

	public void setTable06_1(String table06_1) {
		this.table06_1 = table06_1;
	}

	public Integer getTable06_1_1() {
		return table06_1_1;
	}

	public void setTable06_1_1(Integer table06_1_1) {
		this.table06_1_1 = table06_1_1;
	}

	public String getTable06_2() {
		return table06_2;
	}

	public void setTable06_2(String table06_2) {
		this.table06_2 = table06_2;
	}

	public Integer getTable06_2_1() {
		return table06_2_1;
	}

	public void setTable06_2_1(Integer table06_2_1) {
		this.table06_2_1 = table06_2_1;
	}

	public String getTable06_3() {
		return table06_3;
	}

	public void setTable06_3(String table06_3) {
		this.table06_3 = table06_3;
	}

	public Integer getTable06_3_1() {
		return table06_3_1;
	}

	public void setTable06_3_1(Integer table06_3_1) {
		this.table06_3_1 = table06_3_1;
	}

	public String getTable06_4() {
		return table06_4;
	}

	public void setTable06_4(String table06_4) {
		this.table06_4 = table06_4;
	}

	public Integer getTable06_4_1() {
		return table06_4_1;
	}

	public void setTable06_4_1(Integer table06_4_1) {
		this.table06_4_1 = table06_4_1;
	}

	public String getTable06_5() {
		return table06_5;
	}

	public void setTable06_5(String table06_5) {
		this.table06_5 = table06_5;
	}

	public Integer getTable06_5_1() {
		return table06_5_1;
	}

	public void setTable06_5_1(Integer table06_5_1) {
		this.table06_5_1 = table06_5_1;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
}