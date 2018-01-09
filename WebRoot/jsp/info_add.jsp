<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>提交信息</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/info_add.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css">
	<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
	
	<style type="text/css">
		form{
			position: relative;
		}
		form .currRank{
		    position: absolute;
		    width: 45px;
		    height: 109px;
		    top: 168px;
		    left: -36px;
		    border: 1px solid #800606;
		    text-align: center;
		    background-color: #800606;
		}
		form .currRank span{
			color: #fff;
		    font-size: 1.1em;
		    display: inline-block;
		    letter-spacing: 3px;
		    width: 100%;
		    cursor: pointer;
		}
		.hidden-content{
			display: none;
		}
	</style>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		/* 简化代码，补全基本结构 */
		/* $('#oneInput td').eq(4).attr('colspan','2'); */
		/****** 分表一 ****/
		$('#total30p').attr('value',parseFloat($('#8 input').attr('value')*0.5)+$('#11 input').attr('value')*0.3+$('#14 input').attr('value')*0.2);
		
		/* 禁止submit提交框的默认提交 */
		/**不需要禁止，直接再添加一个浏览页面按钮 */
		/* $("form #browsePage").click(function(){
			return false;
		}); */
	});
</script>

<body>
	
	<header class="hidden">
		<div class="logo"><!-- The leftmost logo -->
			<div class="left">
				<a href="${pageContext.request.contextPath}/index.jsp">
					<img src="${pageContext.request.contextPath}/image/logo.png" alt="江理">
				</a>
			</div>
			<div class="right">
				<a href="${pageContext.request.contextPath}/index.jsp">
					<h1 class="title">综合素质统计</h1>
					<p class="desc">C quality statistics</p>
				</a>
			</div>
		</div>
		<nav class="profession"><!-- The middle of the navigation bar -->
			<!-- if only design for electronic professional,will be modified 1、2、3class -->
			<ul id="ul-menu">
				<li class="menu">
					<a onmouseover="displayMenu(this)" href="${pageContext.request.contextPath}/index.jsp" class="active" id="">首页</a>
				</li>
				<li class="menu" onmouseout="cancelMenu(this)">
					<a href="javascript:void(0)" onmouseover="displayMenu(this)">电子</a>
					<ul class="dropdown-menu" style="display: none;" onmouseover="displayMenuUl(this)">
						<c:forEach items="${listp }" var="proClass_dz">
							<c:if test="${fn:contains(proClass_dz.name, '电子') }">
							<li><a href="${pageContext.request.contextPath }/proClass_findAllInfo.action?name=${proClass_dz.name }">${proClass_dz.name }</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
				<li class="menu" onmouseout="cancelMenu(this)">
					<a href="javascript:void(0)" id="" onmouseover="displayMenu(this)">自动化</a>
					<ul class="dropdown-menu" style="display: none;" onmouseover="displayMenuUl(this)">
						<c:forEach items="${listp }" var="proClass_zdh">
							<c:if test="${fn:contains(proClass_zdh.name, '自动化') }">
							<li><a href="${pageContext.request.contextPath }/proClass_findAllInfo.action?name=${proClass_zdh.name }">${proClass_zdh.name }</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
				<li class="menu" onmouseout="cancelMenu(this)">
					<a href="javascript:void(0)" id="" onmouseover="displayMenu(this)">电气</a>
					<ul class="dropdown-menu" style="display: none;" onmouseover="displayMenuUl(this)">
						<c:forEach items="${listp }" var="proClass_dq">
							<c:if test="${fn:contains(proClass_dq.name, '电气') }">
							<li><a href="${pageContext.request.contextPath }/proClass_findAllInfo.action?name=${proClass_dq.name }">${proClass_dq.name }</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</ul>
		</nav>
		<div class="user-info"><!-- The rightmost user is shown -->
			<div class="user-avatar">
				<c:if test="${not empty sessionScope.s}">
					<a href="${pageContext.request.contextPath}/student_getUserInfoByName.action?name=${sessionScope.s.name }">
						<img src="${pageContext.request.contextPath}/${sessionScope.s.avatar }" alt="用户名">
					</a>
				</c:if>
				<c:if test="${empty sessionScope.s}">
					<a href="${pageContext.request.contextPath}/jsp/error/not_user.jsp">
						<img src="${pageContext.request.contextPath}/image/user.png" alt="用户名">
					</a>
				</c:if>
			</div>
			<div class="user-logout"><a href="${pageContext.request.contextPath}/student_logout.action">用户注销</a></div>
		</div>
		<form action="${pageContext.request.contextPath }/student_findStudentByName.action" method="post" class="search-form"><!-- The search box on the right -->
			<input type="search" name="searchName" class="search" maxlength="16" placeholder="搜索学生">
			<input type="submit" class="submit" value="搜">
		</form>
	</header><!-- end header -->
	<div class="header-placeholder hidden"></div>
	
	<section class="info-add-content">
		<h1 class="header-title hidden"><span>请填写相关信息</span></h1>
		<form action="${pageContext.request.contextPath }/studentInfo_addStudentInfo.action" id="add_form" class="add-form">
			<div class="currRank hidden"><span id="findRank">点击查看当前排名</span></div>
			<h1>江西理工大学学生综合素质测评评分表</h1>
			<table class="table-0 table-public">
				<tr>
					<td width="6%">姓名</td>
					<td width="8%"><input name="" type="text" value="${student.name }"></td>
					<td width="6%">班级</td>
					<td width="9%"><input name="" type="text" value="${student.proClass.name }"></td>
					<td width="6%">学号</td>
					<td width="10%"><input name="" type="text" value="${student.stuID }"></td>
					<td width="8%">任何职</td>
					<td width="14%" colspan="2"><input name="" type="text" value="${student.position }"></td>
					<td width="10%">专业人数</td>
					<td width="7%"><input name="" type="text" value="${student.proClass.numPerson }"></td>
					<td width="8%" rowspan="2">学院（校区）审核</td>
					<td width="8%" rowspan="2">电气学院</td>
				</tr>
				<tr>
					<td>测评期限</td>
					<td colspan="3"><input name="" type="text" value="2017~2018学年第一学期"></td>
					<td>测评时间</td>
					<td colspan="2"><span><%=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %></span></td>
					<td width="6%">辅导员</td>
					<td><input name="" type="text" value="爱谁谁"></td>
					<td>班主任</td>
					<td><input name="" type="text" value="${student.proClass.headTeacher }"></td>
				</tr>
			</table>

			<!-- Table one -->
			
			<div class="table-title">
				<h3>学生综合素质总分统计</h3>
				<div class="table-title-n">分表一</div>
			</div>
			<table class="table-1 table-public">
				<tr>
					<td width="4%" rowspan="3">名次</td>
					<td width="4%" rowspan="3"><span>总分</span></td>
					<td width="13%" colspan="2">学生学业评价（70%）</td>
					<td width="5%"><span>合计</span></td>
					<td width="5%"><input id="total70p" name="score70p" type="text"></td>
					<td width="46%" colspan="6">学生操行评定（30%）</td>
					<td width="10%"><span>合计</span></td>
					<td width="13%" colspan="2"><input id="total30p" name="score30p" type="text"></td>
				</tr>
				<tr>
					<td colspan="2">专业成绩分</td>
					<td colspan="2">创新能力分</td>
					<td colspan="3">道德素质（50%）</td>
					<td colspan="3">社会实践（30%）</td>
					<td colspan="3">其它奖惩和处罚分（20%）</td>
				</tr>
				<tr>
					<td>小计</td>
					<td>名次</td>
					<td colspan="2">小计</td>
					<td>基础分</td>
					<td>奖惩分</td>
					<td>小计</td>
					<td>基础分</td>
					<td>奖惩分</td>
					<td>小计</td>
					<td>基础分</td>
					<td>奖惩分</td>
					<td>小计</td>
				</tr>
				<tr id="oneInput">
					<td id="1"><input name="rank" type="text" value=""></td>
					<td id="2"><input name="scoreTotal" type="text" value=""></td>
					<td id="3"><input name="" type="text" value="" placeholder="填写"></td>
					<td id="4"><input name="" type="text" value="" placeholder="表二"></td>
					<td colspan="2" id="5"><input name="" type="text" value="70"></td>
					<td id="6"><input name="" type="text" value="70"></td>
					<td id="7"><input name="" type="text" value="0"></td>
					<td id="8"><input name="" type="text" value="70"></td>
					<td id="9"><input name="" type="text" value="70"></td>
					<td id="10"><input name="" type="text" value="0"></td>
					<td id="11"><input name="" type="text" value="70"></td>
					<td id="12"><input name="" type="text" value="70"></td>
					<td id="13"><input name="" type="text" value="0"></td>
					<td id="14"><input name="" type="text" value="70"></td>
				</tr>
			</table>

			<!-- Table two -->
			<div class="table-title">
				<h3>专业成绩评分表</h3>
				<div class="table-title-n">分表二</div>
			</div>
			<table id="table2" class="table-2 table-public">
				<tr>
					<td style="width:15%;text-align:right;border-right:0;"><label for="table2_1">平均绩点分：</label></td>
					<td style="width:35%;border-left:0;">
						<input name="professionScore" id="table2_1" type="text" style="text-align: left;border-bottom:1px #333 solid;" value="" placeholder="自己填写" onblur="table2Count(this)">
					</td>
					<td style="width:15%;text-align:right;border-right:0;"><label for="table2_2">平均绩点分名次：</label></td>
					<td style="width:35%;border-left:0;">
						<input name="pSRank" id="table2_2" type="text" style="text-align: left;border-bottom:1px #333 solid;" value="" placeholder="自己填写" onblur="table2Count(this)">
					</td>
				</tr>
			</table>
			
			<!-- Table three -->
			<div class="table-title">
				<h3>创新能力评分表</h3>
				<div class="table-title-n">分表三</div>
			</div>
			<table id="table3" class="table-n">
				<tr>
					<td style="width: 6%" rowspan="6">奖励分</td>
					<td style="width: 29%">加分标准</td>
					<td style="width: 12%">加分依据</td>
					<td style="width: 6%">加分数</td>
					<td style="width: 29%">加分标准</td>
					<td style="width: 12%">加分依据</td>
					<td style="width: 6%">加分数</td>
				</tr>
				<tr>
					<td>1.参加国家级科研成果评比，以证书或文件为依据，获一、二、三等奖及优胜奖分别加6、4、2、1分。</td>
					<td><textarea name="table3_1"></textarea></td>
					<td><input id="table3_1" name="table3_1_1" type="text" onblur="table3Count(this.id)"></td>
					<td>6.通过CET-4考试，当学期加1分；通过CET-6考试，加2分；特殊专业参照《学生手册》规定执行。</td>
					<td><textarea name="table3_6"></textarea></td>
					<td><input id="table3_6" name="table3_6_1" type="text" onblur="table3Count(id)"></td>
				</tr>
				<tr>
					<td>2.参加省级科研成果评比，以证书或文件为依据，获一、二、三等奖及优胜奖分别加4、2、1、0.5分。</td>
					<td><textarea name="table3_2"></textarea></td>
					<td><input id="table3_2" name="table3_2_1" type="text" onblur="table3Count(id)"></td>
					<td>7.非计算机专业通过全国或省级计算机考试，达到一级标准，当学期加1分；达到二级标准，加2分；达到三级标准，加3分。</td>
					<td><textarea name="table3_7"></textarea></td>
					<td><input id="table3_7" name="table3_7_1" type="text" onblur="table3Count(id)"></td>
				</tr>
				<tr>
					<td>3.参加校/市级科研成果评比，以证书或文件为依据，获一、二、三等奖及优胜奖分别加2、1、0.5、0.3分。</td>
					<td><textarea name="table3_3"></textarea></td>
					<td><input id="table3_3" name="table3_3_1" type="text" onblur="table3Count(id)"></td>
					<td>8.各种知识竞赛、科技活动、征文等加分值（只在获奖之学期加分，含体育、艺术类专业竞赛）</td>
					<td><textarea  name="table3_8"></textarea></td>
					<td><input id="table3_8" name="table3_8_1" type="text" onblur="table3Count(id)"></td>
				</tr>
				<tr>
					<td>4.参加院级科研成果评比，以证书或文件为依据，获一、二、三等奖及优胜奖分别加1、0.5、0.3、0.1分。</td>
					<td><textarea  name="table3_4"></textarea></td>
					<td><input id="table3_4" name="table3_4_1" type="text" onblur="table3Count(id)"></td>
					<td>9.其他。</td>
					<td><textarea  name="table3_9"></textarea></td>
					<td><input id="table3_9" name="table3_9_1" type="text" onblur="table3Count(id)"></td>
				</tr>
				<tr>
					<td>5.学生拥有科研成果或研制出科研产品，经学校科技处审定，可适当加分，最高不超过6分。</td>
					<td><textarea  name="table3_5"></textarea></td>
					<td><input id="table3_5" name="table3_5_1" type="text" onblur="table3Count(id)"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>总分</td>
					<td colspan="6" class="total-score">基础分+奖励分&nbsp;=&nbsp;70&nbsp;+
						<span id="table3total"></span>
						<span>=</span>
						<span id="table3total1"></span>
					</td>
				</tr>
			</table>
			
			<!-- Table four -->
			<div class="table-title">
				<h3>其它奖励和处罚评分表</h3>
				<div class="table-title-n">分表四</div>
			</div>
			<table id="table4" class="table-n">
				<tr>
					<td style="width: 6%" rowspan="7">奖惩分</td>
					<td style="width: 29%">加分标准</td>
					<td style="width: 12%">加分依据</td>
					<td style="width: 6%">加分数</td>
					<td style="width: 29%">扣分标准</td>
					<td style="width: 12%">扣分依据</td>
					<td style="width: 6%">扣分数</td>
				</tr>
				<tr>
					<td>1.体育锻炼达标者，当学期加分。优秀者加4分；良好者加2分；及格者加1分；不及格者计0分。</td>
					<td><textarea name="table14_1"></textarea></td>
					<td><input id="table41_1" name="table14_1_1" type="text" onblur="tableCount(this.id)"></td>
					<td>1.无故不参加校内外各级文艺、体育活动等，每次扣3分，扣完本项奖励分为止。</td>
					<td><textarea  name="table04_1"></textarea></td>
					<td><input id="table40_1" name="table04_1_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td>2.参加院级以上体育竞赛的运动员、获奖者及集体项目主力队员，每项次加分。集体项目非主力队员减半加分。</td>
					<td><textarea name="table14_2"></textarea></td>
					<td><input id="table41_2" name="table14_2_1" type="text" onblur="tableCount(this.id)"></td>
					<td>2.其他。</td>
					<td><textarea name="table04_2"></textarea></td>
					<td><input id="table40_2" name="table04_2_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td>3.在体育竞赛中获得道德风尚奖的，按相应级别二等奖加分。</td>
					<td><textarea name="table14_3"></textarea></td>
					<td><input id="table41_3" name="table14_3_1" type="text" onblur="tableCount(this.id)"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>4.参加各种文化艺术活动按不同等级加分(舞蹈等集体项目按同等标准加分)。</td>
					<td><textarea name="table14_4"></textarea></td>
					<td><input id="table41_4" name="table14_4_1" type="text" onblur="tableCount(this.id)"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>5.参加各类讲座，每参加一次校级讲座加1分，院级每次加0.5分,最高加分5分。</td>
					<td><textarea name="table14_5"></textarea></td>
					<td><input id="table41_5" name="table14_5_1" type="text" onblur="tableCount(this.id)"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>6.其他。</td>
					<td><textarea name="table14_6"></textarea></td>
					<td><input id="table41_6" name="table14_6_1" type="text" onblur="tableCount(this.id)"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="subtotal-score">
					<td>分值小计</td>
					<td colspan="3"><span id="table4_add_subtotal"></span></td>
					<td colspan="3"><span id="table4_less_subtotal"></span></td>
				</tr>
				<tr>
					<td>总分</td>
					<td colspan="6" class="total-score">基础分+奖励分-惩罚分&nbsp;=&nbsp;
						<span id="table4_">70</span>
						<span>+</span>
						<span id="table4_add_subtotal1"></span>
						<span>-</span>
						<span id="table4_less_subtotal1"></span>
						<span>=</span>
						<span id="table4Result"></span>
					</td>
				</tr>
			</table>

			<!-- Table five -->
			<div class="table-title">
				<h3>德育素质评分表</h3>
				<div class="table-title-n">分表五</div>
			</div>
			<table id="table5" class="table-n">
				<tr>
					<td style="width: 6%" rowspan="11">奖惩分</td>
					<td style="width: 29%">加分标准</td>
					<td style="width: 12%">加分依据</td>
					<td style="width: 6%">加分数</td>
					<td style="width: 29%">扣分标准</td>
					<td style="width: 12%">扣分依据</td>
					<td style="width: 6%">扣分数</td>
				</tr>
				<tr>
					<td>1.在精神文明建设中有突出表现、受到校级或校级以上表彰者加8～10分；校级通报表扬者加6分；院级通报表扬者加3分；集体表彰成员相应减半加分。</td>
					<td><textarea name="table15_1"></textarea></td>
					<td><input id="table51_1" name="table15_1_1" type="text" onblur="tableCount(this.id)"></td>
					<td>1.有反对四项基本原则的反动言论和行为，煽动闹事、非法游行集会、张贴大小字报、参加法轮功等邪教组织、传销等非法组织(非法活动)，破坏安定团结、扰乱社会秩序者扣40分。</td>
					<td><textarea name="table05_1"></textarea></td>
					<td><input id="table50_1" name="table05_1_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td>2.积极参加“双学”、“十佳团日”等思想教育活动，被评为校级先进个人者加6分；被评为院级先进个人者加3分。</td>
					<td><textarea name="table15_2"></textarea></td>
					<td><input id="table51_2" name="table15_2_1" type="text" onblur="tableCount(this.id)"></td>
					<td>2.受到院级通报批评者扣3分；校级通报批评者扣5分；受到警告处分者扣10分，严重警告者扣14分，记过者扣18分，留校察看者扣22分，以上几项可累计扣分。</td>
					<td><textarea name="table05_2"></textarea></td>
					<td><input id="table50_2" name="table05_2_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td>3.勇于向校内外违法违纪现象作斗争或制止、举报者每次加5～10分。</td>
					<td><textarea name="table15_3"></textarea></td>
					<td><input id="table51_3" name="table15_3_1" type="text" onblur="tableCount(this.id)"></td>
					<td>3.中共党员、各级主要学生干部工作严重失职，对突发事件或恶性违法违纪案件不报告、不制止或不抢救者扣5-10分；在事故中负有领导、组织责任者，扣10-20分。</td>
					<td><textarea name="table05_3"></textarea></td>
					<td><input id="table50_3" name="table05_3_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td>4.所在寝室被评为校级青年文明号寝室加5分；校级文明寝室加4分；院级文明寝室加3分。</td>
					<td><textarea name="table15_4"></textarea></td>
					<td><input id="table51_4" name="table15_4_1" type="text" onblur="tableCount(this.id)"></td>
					<td>4.凡各种考勤(上课、早锻炼等)迟到或早退每次扣1分，每缺勤1次扣3分。</td>
					<td><textarea name="table05_4"></textarea></td>
					<td><input id="table50_4" name="table05_4_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td>5.被评为校“十佳大学生”者加8分。</td>
					<td><textarea name="table15_5"></textarea></td>
					<td><input id="table51_5" name="table15_5_1" type="text" onblur="tableCount(this.id)"></td>
					<td>5.有恶意拖欠学费等不良诚信记录者扣15分。</td>
					<td><textarea  name="table05_5"></textarea></td>
					<td><input id="table50_5" name="table05_5_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td>6.参加公益活动，表现突出者，每次加1～3分，最高分值为10分。</td>
					<td><textarea name="table15_6"></textarea></td>
					<td><input id="table51_6" name="table15_6_1" type="text" onblur="tableCount(this.id)"></td>
					<td>6.违章用电私拉电线者扣5分，用煤油炉(酒精炉)者扣3分，点蜡烛者扣2分。</td>
					<td><textarea name="table05_6"></textarea></td>
					<td><input id="table50_6" name="table05_6_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td>7.其他。</td>
					<td><textarea name="table15_7"></textarea></td>
					<td><input id="table51_7" name="table15_7_1" type="text" onblur="tableCount(this.id)"></td>
					<td>7.故意污损教室、寝室墙面、桌面和其他公共设施，攀折花木者扣4分。</td>
					<td><textarea name="table05_7"></textarea></td>
					<td><input id="table50_7" name="table05_7_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>8.所在寝室卫生被评为不合格寝室的成员每次扣2分；寝室成员被查晚归每次扣3分,被查未归或外宿以及在外租房,每次扣6分。</td>
					<td><textarea name="table05_8"></textarea></td>
					<td><input id="table50_8" name="table05_8_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>9.酗酒、起哄、摔瓶子等扰乱校园秩序者扣5分。</td>
					<td><textarea name="table05_9"></textarea></td>
					<td><input id="table50_9" name="table05_9_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>10.其他。</td>
					<td><textarea name="table05_10"></textarea></td>
					<td><input id="table50_10" name="table05_10_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr class="subtotal-score">
					<td>分值小计</td>
					<td colspan="3"><span id="table5_add_subtotal"></span></td>
					<td colspan="3"><span id="table5_less_subtotal"></span></td>
				</tr>
				<tr>
					<td>总分</td>
					<td colspan="6" class="total-score">基础分+奖励分-惩罚分&nbsp;=&nbsp;
						<span id="table5_">70</span>
						<span>+</span>
						<span id="table5_add_subtotal1"></span>
						<span>-</span>
						<span id="table5_less_subtotal1"></span>
						<span>=</span>
						<span id="table5Result"></span>
					</td>
				</tr>
			</table>

			<!-- Table six -->
			<div class="table-title">
				<h3>社会实践评分表</h3>
				<div class="table-title-n">分表六</div>
			</div>
			<table id="table6" class="table-n">
				<tr>
					<td style="width: 6%" rowspan="8">奖惩分</td>
					<td style="width: 29%">加分标准</td>
					<td style="width: 12%">加分依据</td>
					<td style="width: 6%">加分数</td>
					<td style="width: 29%">扣分标准</td>
					<td style="width: 12%">扣分依据</td>
					<td style="width: 6%">扣分数</td>
				</tr>
				<tr>
					<td>1.参加假期社会实践活动，每次加3分。</td>
					<td><textarea name="table16_1"></textarea></td>
					<td><input id="table61_1" name="table16_1_1" type="text" onblur="tableCount(this.id)"></td>
					<td>1.按要求须参加实践活动而未参加的，每次扣3分。</td>
					<td><textarea name="table06_1"></textarea></td>
					<td><input id="table60_1" name="table06_1_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td>2.上交社会实践论文未获奖者，加1分；被评为优秀论文或社会实践先进个人者，每篇(次)加2分，加分不超过4分。</td>
					<td><textarea name="table16_2"></textarea></td>
					<td><input id="table61_2" name="table16_2_1" type="text" onblur="tableCount(this.id)"></td>
					<td>2.凡担任学生干部，工作不负责任，未按时按质完成任务或工作失职的，造成较坏影响的，每次扣0.5-2分。</td>
					<td><textarea name="table06_2"></textarea></td>
					<td><input id="table60_2" name="table06_2_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td>3.向校内外报刊、广播台投稿被录用的，国家级加2分/篇；省级加1分/篇；校级加0.5分/篇。在各级党团组织和学生组织从事宣传工作者、学生记者按上述标准减半加分，加分最多不得超过5分。</td>
					<td><textarea name="table16_3"></textarea></td>
					<td><input id="table61_3" name="table16_3_1" type="text" onblur="tableCount(this.id)"></td>
					<td>3.不参加劳动或值日卫生者，每次扣1分。</td>
					<td><textarea name="table06_3"></textarea></td>
					<td><input id="table60_3" name="table06_3_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td>4.学生干部根据担任职务、考核等级等情况加分，兼任多个职务的学生干部按最高职务加分，不累计。</td>
					<td><textarea name="table16_4"></textarea></td>
					<td><input id="table61_4" name="table16_4_1" type="text" onblur="tableCount(this.id)"></td>
					<td>4.其他劳动、卫生检查不合格或受到批评的班组，每人每次扣0.5分。</td>
					<td><textarea name="table06_4"></textarea></td>
					<td><input id="table60_4" name="table06_4_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td>5.参加青年志愿者活动、社区服务活动，每次加1分，加分最多不超过3分。</td>
					<td><textarea name="table16_5"></textarea></td>
					<td><input id="table61_5" name="table16_5_1" type="text" onblur="tableCount(this.id)"></td>
					<td>5.其他。</td>
					<td><textarea name="table06_5"></textarea></td>
					<td><input id="table60_5" name="table06_5_1" type="text" onblur="tableCount(this.id)"></td>
				</tr>
				<tr>
					<td>6.参加校勤工助学，经学工部考核优秀者加1分。</td>
					<td><textarea name="table16_6"></textarea></td>
					<td><input id="table61_6" name="table16_6_1" type="text" onblur="tableCount(this.id)"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>7.其他。</td>
					<td><textarea name="table16_7"></textarea></td>
					<td><input id="table61_7" name="table16_7_1" type="text" onblur="tableCount(this.id)"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="subtotal-score">
					<td>分值小计</td>
					<td colspan="3"><span id="table6_add_subtotal"></span></td>
					<td colspan="3"><span id="table6_less_subtotal"></span></td>
				</tr>
				<tr>
					<td>总分</td>
					<td colspan="6" class="total-score">基础分+奖励分-惩罚分&nbsp;=&nbsp;
						<span style="border:1px #333 solid; display: inline-block; width: 30px; height: 16px;vertical-align: middle;" id="table6_">70</span>
						<span>+</span>
						<span style="border:1px #333 solid; display: inline-block; width: 30px; height: 16px;vertical-align: middle;" id="table6_add_subtotal1"></span>
						<span>-</span>
						<span style="border:1px #333 solid; display: inline-block; width: 30px; height: 16px;vertical-align: middle;" id="table6_less_subtotal1"></span>
						<span>=</span>
						<span style="border:1px #333 solid; display: inline-block; width: 30px; height: 16px;vertical-align: middle;" id="table6Result"></span>
					</td>
				</tr>
			</table>
			<div class="submit-btn hidden">
				<input type="text" value="浏览填写信息" onclick="browsePage()">
				<input type="submit" value="提交信息">
				<input type="reset" value="重置">
			</div>
		</form>
		<article class="notice hidden">
			<h1>注：信息填写的注意事项.</h1>
			<ul>
				<li>1、平均绩点分 和 绩点分名次自行填写；</li>
				<li>2、信息填写完毕，请点击浏览信息；</li>
				<li>3、想查询当前名次请点击上面按钮“查询当前名次”(排名为只在已填写信息的学生中)；</li>
				<li>4、当点击进入了“浏览界面时”，可直接双击页面任何位置返回此编辑页面；</li>
			</ul>
		</article>
	</section>

	<footer class="hidden">
		<p class="first">友情链接</p>
		<p>Copyright (c) 2014 Jiangxiligong University. All Rights Reserved. 赣B2-20050168号/网备36011002000011号 360网站安全检测平台</p>
		<p class="last">江西理工大学电气学院</p>
	</footer><!-- end footer -->
	
</body>

<script>
	/* 1、鼠标移入显示（样式改变） */
	function displayMenu(x){
		$('#ul-menu a').removeClass('active');/*取消所有导航栏中超链接的active样式*/
		$(x).addClass('active');/*为当前超链接添加样式*/
		/*$('.dropdown-menu').css('display', 'none');*//*首先取消所有的ul显示*/
		/*取消直接调用下面的函数*/
		$(x).next().css('display', 'block');/*然后显示当前被选择的*/
		/*上面完成了基本的功能，但是当鼠标移开对象时ul还处以显示的状态*/
	}
	/* 2、鼠标移出隐藏 */
	function cancelMenu(x){
		$(x).children('.dropdown-menu').css('display', 'none');
	}
	/* 3、(注)当下拉菜单出现时，实现移入显示； */
	function displayMenuUl(x){
		$(x).css('display', 'block');
	}
</script>

<!-- 智能化统计分数（每个分表之间不需要有联系，哎！累死我了） -->
<script type="text/javascript">
	/* 分表二 */
	function table2Count(x){
		/**分表一*/
		if($(x).attr('id') == 'table2_1'){
			$('#3 input').attr('value',parseFloat($(x).val()));//将分表二中的数据填写完成后放到分表一中			
		}else{
			$('#4 input').attr('value',parseFloat($(x).val()));
		}
		$('#total70p').attr('value',parseFloat($('#3 input').val()*0.8)+$('#5 input').val()*0.2);
		$('#2 input').attr('value',parseFloat($('#total70p').attr('value'))*0.7+parseFloat($('#total30p').attr('value'))*0.3);
	}
	/* 分表三的统计（循环所有相加并在指定位置进行显示） */
	function table3Count(id){
		/* alert(id); */
		var id1 = id.slice(0,-2);//如：从“table3_*”中得到“table3”；也就是可以得到操作的此分表
		var total = 0;//将总统计数设置为零
		$('#'+id1+' input[type="text"]').each(function(i){//循环所有的指定需要统计的分数输入框，将数据统计出来，最后放到指定位置显示（注：为字符串相加不是数字相加）
			/* alert(i); alert($(this).val());*/
			if($(this).val() != ''){
				total += parseInt($(this).val());
			}
		});
		$('#table3total').html(total);
		$('#table3total1').html(total+70);
		
		/**分表一*/
		$('#5 input').attr('value', total+70);
		alert($('#total30p').attr('value'));
		$('#2 input').attr('value',parseFloat($('#total70p').attr('value'))*0.7+parseFloat($('#total30p').attr('value'))*0.3);
		
		/******* 重点：后续表也需要进行显示，目的是防止有些学生部分分表是不需要进行填写的,这样的话提交的后面数据就是不准确的 *******/
		/** var table1Result = total+70;
		$('#table4_').html(table1Result);
		$('#table5_').html(table1Result);
		$('#table6_').html(table1Result);
		$('#table4Result').html(table1Result);
		$('#table5Result').html(table1Result);
		$('#table6Result').html(table1Result); */
	}
	/* 后面三张表（4、5、6）的分表统计（注：可以一次性获得4、5、6表，然后根据奇偶获得加减项，这样会简单好多） */
	function tableCount(id){
		var id1 = id.slice(0,6);//如：从“table4_*”中得到“table4”；也就是可以得到操作的此分表
		var total1 = 0, total0 = 0;//将总统计数设置为零（“1”表示加项，“0”表示减项）
		$('#'+id1+' input[type="text"]').each(function(i){//循环所有的指定需要统计的分数输入框，将数据统计出来，最后放到指定位置显示（注：为字符串相加不是数字相加）
			/* alert(i); alert($(this).val());*/
			if($(this).attr('id').substring(0,7) == id1+"1"){//如：table14_*中取前六位“table1”用来判断是减项还是加项
				if($(this).val() != ''){
					total1 += parseInt($(this).val());
				}
			}else if($(this).attr('id').substring(0,7) == id1+"0"){
				if($(this).val() != ''){
					total0 += parseInt($(this).val());
				}
			}
		});
		$('#'+id1+'_add_subtotal').html(total1);//分值小计中的加减项
		$('#'+id1+'_less_subtotal').html(total0);
		$('#'+id1+'_add_subtotal1').html(total1);//总分中的加减项
		$('#'+id1+'_less_subtotal1').html(total0);
		$('#'+id1+'Result').html(parseInt($('#'+id1+'_').html())+total1-total0);
		
		/***************分表一***********/
		$('#7 input').attr('value',parseInt($('#table5_add_subtotal').html())-$('#table5_less_subtotal').html());
		$('#8 input').attr('value',70+parseInt($('#7 input').attr('value')));
		$('#10 input').attr('value',parseInt($('#table6_add_subtotal').html())-$('#table6_less_subtotal').html());
		$('#11 input').attr('value',70+parseInt($('#10 input').attr('value')));
		$('#13 input').attr('value',parseInt($('#table4_add_subtotal').html())-$('#table4_less_subtotal').html());
		$('#14 input').attr('value',70+parseInt($('#13 input').attr('value')));
		$('#2 input').attr('value',parseFloat($('#total70p').attr('value'))*0.7+parseFloat($('#total30p').attr('value'))*0.3);
		
		/****** 分表一 ****/
		$('#total30p').attr('value',parseFloat($('#8 input').attr('value')*0.5)+$('#11 input').attr('value')*0.3+$('#14 input').attr('value')*0.2);
		
		/*****重点：建立每个分表之间的联系，1、判断此表是否为最后一个表(“是”没有后续表需要联系“否”将此表的结果值传给后一个表的结果值)2、再次进行判断是否还有后续表格,方法雷同,递归****/
		/* 判断此table是否为最后一个table */
		/** if(id1 != $('table:last').attr('id')){
			var lastId = id1.slice(0,-1)+(parseInt(id1.slice(-1))+1);//得到下一个table的id值
			$('#'+lastId+'_').html(parseInt($('#'+id1+'Result').html()));//将需要的地方设置为上一个分表的结果值
			$('#'+lastId+'Result').html(parseInt($('#'+id1+'Result').html()));
			if(lastId != $('table:last').attr('id')){
				var lastLastId = lastId.slice(0,-1)+(parseInt(lastId.slice(-1))+1);//得到下一个table的id值
				$('#'+lastLastId+'_').html(parseInt($('#'+id1+'Result').html()));//将需要的地方设置为上一个分表的结果值
				$('#'+lastLastId+'Result').html(parseInt($('#'+id1+'Result').html()));
			}
		} */
	}
</script>

<!-- 查看当前排名 -->
<script type="text/javascript">
	$('#findRank').click(function(){
		var url = "${pageContext.request.contextPath}/student_findStudentRank.action";
		var param = {'scoreTotal': $('#2 input').attr('value')};//要传递的参数
		$.post(url,param,function(data){
			$('#1 input').attr('value', data);//将查询到的排名放到指定框中进行显示
		},"text");
	});
</script>

<!-- 浏览页面,供打印使用（要求：1、“导航栏,请填写相关信息,点击查看当前排名,表格的下边框,注意事项,底部”不需要(只留一个表格)2、到浏览页面时点击页面任何地方就可以回到信息填写页面3、表格中的所有数据原封不动的保存） -->
<script type="text/javascript">
	function browsePage(){
		/* alert('123'); */
		$('.hidden').addClass('hidden-content');//1、首先为需要进行隐藏的内容添加指定class(hidden),方便一次性获得;2、添加指定的class(hidden-content),已经设置了样式
		$('form').css({'border':'0'});
		/* 还有就是需要禁止所有的输入框编辑功能（将其设置为只读） */
		$('form input').attr('readonly','readonly');
		$('form textarea').attr('readonly','readonly');
	}

	/**注：下面的事件不能为click,因为当点击浏览时会先执行范围小的“browsePage”方法,然后直接执行范围到的 绑定了body的方法,这样相互抵消没有起到作用,所以这里使用双击的事件 */
	/* 当除表格外所有元素已经隐藏时,点击页面任何一处返回编辑页面（也就是是否有“hidden-content”样式） */
	$('body').dblclick(function(){
		/* alert('1234'); */
		if($('.hidden').hasClass('hidden-content')){
			$('.hidden').removeClass('hidden-content');
			$('form').removeAttr('style');
		}
	});
		
</script>

</html>