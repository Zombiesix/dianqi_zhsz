<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>浏览提交信息</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/info_add.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css">
	<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
</head>

<style>
	section.info-add-content form.add-form{
		border: 1px solid #e6d2d2;
		border-radius: 5px;
		background-color: #e6d2d2;
	}
	.submit-btn button{
		margin: 0 20px;
		width: 80px;
		height: 35px;
		background-color: #693409;
		padding: 2px 5px;
		border: 1px solid #693409;
		border-radius: 10px;
		cursor: pointer;
	}
	.submit-btn button a{
		color: #e1ead9;
		font-size: 14px;
	}
	.submit-btn a:hover{
		color: #6eea00;
	}
</style>

<script type="text/javascript">
	$(function(){
		$('textarea').attr('disabled', 'disabled');
		$('input').attr('disabled', 'disabled');
	})
</script>

<body>
	<header>
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
<!-- 修改下面的 a 标签为 li ，不需要点击链接 -->
					<a href="#" onmouseover="displayMenu(this)">电子</a>
					<ul class="dropdown-menu" style="display: none;" onmouseover="displayMenuUl(this)">
						<c:forEach items="${listp }" var="proClass_dz">
							<c:if test="${fn:contains(proClass_dz.name, '电子') }">
							<li><a href="#">${proClass_dz.name }</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
				<li class="menu" onmouseout="cancelMenu(this)">
<!-- 修改下面的 a 标签为 li ，不需要点击链接 -->
					<a href="#" id="" onmouseover="displayMenu(this)">自动化</a>
					<ul class="dropdown-menu" style="display: none;" onmouseover="displayMenuUl(this)">
						<c:forEach items="${listp }" var="proClass_zdh">
							<c:if test="${fn:contains(proClass_zdh.name, '自动化') }">
							<li><a href="#">${proClass_zdh.name }</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
				<li class="menu" onmouseout="cancelMenu(this)">
<!-- 修改下面的 a 标签为 li ，不需要点击链接 -->
					<a href="#" id="" onmouseover="displayMenu(this)">电气</a>
					<ul class="dropdown-menu" style="display: none;" onmouseover="displayMenuUl(this)">
						<c:forEach items="${listp }" var="proClass_dq">
							<c:if test="${fn:contains(proClass_dq.name, '电气') }">
							<li><a href="#">${proClass_dq.name }</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</ul>
		</nav>
		<div class="user-info"><!-- The rightmost user is shown -->
			<div class="user-avatar">
<!-- 需要有个贯彻全站的用户，判断是否登陆 -->
				<c:if test="'用户' == '用户'">
					<a href="${pageContext.request.contextPath}/student_info.action">
						<img src="${pageContext.request.contextPath}/image/user.png" alt="用户名">
					</a>
				</c:if>
				<%-- <c:if test="'用户' == null">
					<a href="${pageContext.request.contextPath}/jsp/error/not_user.jsp">
						<img src="${pageContext.request.contextPath}/image/user.png" alt="用户名">
					</a>
				</c:if> --%>
			</div>
		</div>
		<form action="${pageContext.request.contextPath }/student_findStudentByName.action" method="post" class="search-form"><!-- The search box on the right -->
			<input type="search" name="searchName" class="search" maxlength="16" placeholder="搜索学生">
			<input type="submit" class="submit" value="搜">
		</form>
	</header><!-- end header -->
	<div class="header-placeholder"></div>
	
	<section class="info-add-content">
		<h1 class="header-title"><span>请确定信息，无误后提交</span></h1>
		<form action="" class="add-form">
			<h1>江西理工大学学生综合素质测评评分表</h1>
			<table class="table-0 table-public">
				<tr>
					<td width="6%">姓名</td>
					<td width="8%"><input name="name" type="text" value="张九波"></td>
					<td width="6%">班级</td>
					<td width="9%"><input name="name" type="text"></td>
					<td width="6%">学号</td>
					<td width="10%"><input name="name" type="text"></td>
					<td width="8%">任何职</td>
					<td width="14%" colspan="2"><input name="name" type="text"></td>
					<td width="10%">专业人数</td>
					<td width="7%"><input name="name" type="text"></td>
					<td width="8%" rowspan="2">学院（校区）审核</td>
					<td width="8%" rowspan="2">电气学院</td>
				</tr>
				<tr>
					<td>测评期限</td>
					<td colspan="3"><input name="name" type="text"></td>
					<td>测评时间</td>
					<td colspan="2"><span>运行的当前时间</span></td>
					<td width="6%">辅导员</td>
					<td><input name="name" type="text"></td>
					<td>班主任</td>
					<td><input name="name" type="text"></td>
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
					<td width="4%" rowspan="3">总分</td>
					<td width="13%" colspan="2">学生学业评价（70%）</td>
					<td width="5%">合计</td>
					<td width="5%"><input name="name" type="text"></td>
					<td width="46%" colspan="6">学生操行评定（30%）</td>
					<td width="10%">合计</td>
					<td width="13%" colspan="2"><input name="name" type="text"></td>
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
				<tr>
					<td><input name="name" type="text"></td>
					<td><input name="name" type="text"></td>
					<td><input name="name" type="text"></td>
					<td><input name="name" type="text"></td>
					<td colspan="2"><input name="name" type="text"></td>
					<td><input name="name" type="text"></td>
					<td><input name="name" type="text"></td>
					<td><input name="name" type="text"></td>
					<td><input name="name" type="text"></td>
					<td><input name="name" type="text"></td>
					<td><input name="name" type="text"></td>
					<td><input name="name" type="text"></td>
					<td><input name="name" type="text"></td>
					<td><input name="name" type="text"></td>
				</tr>
			</table>

			<!-- Table two -->
			<div class="table-title">
				<h3>专业成绩评分表</h3>
				<div class="table-title-n">分表二</div>
			</div>
			<table class="table-2 table-public">
				<tr>
					<td style="width:15%;text-align:right;border-right:0;"><label for="table-2-1">平均绩点分：</label></td>
					<td style="width:35%;border-left:0;"><input name="name" id="table-2-1" type="text" style="text-align: left;"></td>
					<td style="width:15%;text-align:right;border-right:0;"><label for="table-2-2">平均绩点分名次：</label></td>
					<td style="width:35%;border-left:0;"><input name="name" id="table-2-2" type="text" style="text-align: left;"></td>
				</tr>
			</table>
			
			<!-- Table three -->
			<div class="table-title">
				<h3>创新能力评分表</h3>
				<div class="table-title-n">分表三</div>
			</div>
			<table class="table-n">
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
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
					<td>6.通过CET-4考试，当学期加1分；通过CET-6考试，加2分；特殊专业参照《学生手册》规定执行。</td>
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>2.参加省级科研成果评比，以证书或文件为依据，获一、二、三等奖及优胜奖分别加4、2、1、0.5分。</td>
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
					<td>7.非计算机专业通过全国或省级计算机考试，达到一级标准，当学期加1分；达到二级标准，加2分；达到三级标准，加3分。</td>
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>3.参加校/市级科研成果评比，以证书或文件为依据，获一、二、三等奖及优胜奖分别加2、1、0.5、0.3分。</td>
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
					<td>8.各种知识竞赛、科技活动、征文等加分值（只在获奖之学期加分，含体育、艺术类专业竞赛）</td>
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>4.参加院级科研成果评比，以证书或文件为依据，获一、二、三等奖及优胜奖分别加1、0.5、0.3、0.1分。</td>
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
					<td>9.其他。</td>
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>5.学生拥有科研成果或研制出科研产品，经学校科技处审定，可适当加分，最高不超过6分。</td>
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>总分</td>
					<td colspan="6" class="total-score">基础分+奖励分&nbsp;=&nbsp;70&nbsp;+
						<span>此表的此类项相加</span>
						<span>=</span>
						<span>前面两个数相加</span>
					</td>
				</tr>
			</table>
			
			<!-- Table four -->
			<div class="table-title">
				<h3>其它奖励和处罚评分表</h3>
				<div class="table-title-n">分表四</div>
			</div>
			<table class="table-n">
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
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
					<td>1.无故不参加校内外各级文艺、体育活动等，每次扣3分，扣完本项奖励分为止。</td>
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>2.参加院级以上体育竞赛的运动员、获奖者及集体项目主力队员，每项次加分。集体项目非主力队员减半加分。</td>
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
					<td>2.其他。</td>
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
				</tr>
				<tr>
					<td>3.在体育竞赛中获得道德风尚奖的，按相应级别二等奖加分。</td>
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>4.参加各种文化艺术活动按不同等级加分(舞蹈等集体项目按同等标准加分)。</td>
					<td><textarea name=""></textarea></td>
					<td><input type="text"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>5.参加各类讲座，每参加一次校级讲座加1分，院级每次加0.5分,最高加分5分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>6.其他。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="subtotal-score">
					<td>分值小计</td>
					<td colspan="3"><span>此表此列中所有加分项</span></td>
					<td colspan="3"><span>此表此列中所有减分项</span></td>
				</tr>
				</tr>
				<tr>
					<td>总分</td>
					<td colspan="6" class="total-score">基础分+奖励分-惩罚分&nbsp;=&nbsp;前表的运算结果&nbsp;+
						<span>此表的此类项相加</span>
						<span>-</span>
						<span>此表的此类项相加</span>
						<span>=</span>
						<span>前面三个数的加减</span>
					</td>
				</tr>
			</table>

			<!-- Table five -->
			<div class="table-title">
				<h3>德育素质评分表</h3>
				<div class="table-title-n">分表五</div>
			</div>
			<table class="table-n">
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
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td>1.有反对四项基本原则的反动言论和行为，煽动闹事、非法游行集会、张贴大小字报、参加法轮功等邪教组织、传销等非法组织(非法活动)，破坏安定团结、扰乱社会秩序者扣40分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr>
					<td>2.积极参加“双学”、“十佳团日”等思想教育活动，被评为校级先进个人者加6分；被评为院级先进个人者加3分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td>2.受到院级通报批评者扣3分；校级通报批评者扣5分；受到警告处分者扣10分，严重警告者扣14分，记过者扣18分，留校察看者扣22分，以上几项可累计扣分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr>
					<td>3.勇于向校内外违法违纪现象作斗争或制止、举报者每次加5～10分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td>3.中共党员、各级主要学生干部工作严重失职，对突发事件或恶性违法违纪案件不报告、不制止或不抢救者扣5-10分；在事故中负有领导、组织责任者，扣10-20分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr>
					<td>4.所在寝室被评为校级青年文明号寝室加5分；校级文明寝室加4分；院级文明寝室加3分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td>4.凡各种考勤(上课、早锻炼等)迟到或早退每次扣1分，每缺勤1次扣3分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr>
					<td>5.被评为校“十佳大学生”者加8分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td>5.有恶意拖欠学费等不良诚信记录者扣15分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr>
					<td>6.参加公益活动，表现突出者，每次加1～3分，最高分值为10分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td>6.违章用电私拉电线者扣5分，用煤油炉(酒精炉)者扣3分，点蜡烛者扣2分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr>
					<td>7.其他。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td>7.故意污损教室、寝室墙面、桌面和其他公共设施，攀折花木者扣4分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>8.所在寝室卫生被评为不合格寝室的成员每次扣2分；寝室成员被查晚归每次扣3分,被查未归或外宿以及在外租房,每次扣6分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>9.酗酒、起哄、摔瓶子等扰乱校园秩序者扣5分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td>10.其他。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr class="subtotal-score">
					<td>分值小计</td>
					<td colspan="3"><span>此表此列中所有加分项</span></td>
					<td colspan="3"><span>此表此列中所有减分项</span></td>
				</tr>
				<tr>
					<td>总分</td>
					<td colspan="6" class="total-score">基础分+奖励分-惩罚分&nbsp;=&nbsp;前表的运算结果&nbsp;+
						<span>此表的此类项相加</span>
						<span>-</span>
						<span>此表的此类项相加</span>
						<span>=</span>
						<span>前面三个数的加减</span>
					</td>
				</tr>
			</table>

			<!-- Table six -->
			<div class="table-title">
				<h3>社会实践评分表</h3>
				<div class="table-title-n">分表六</div>
			</div>
			<table class="table-n">
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
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td>1.按要求须参加实践活动而未参加的，每次扣3分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr>
					<td>2.上交社会实践论文未获奖者，加1分；被评为优秀论文或社会实践先进个人者，每篇(次)加2分，加分不超过4分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td>2.凡担任学生干部，工作不负责任，未按时按质完成任务或工作失职的，造成较坏影响的，每次扣0.5-2分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr>
					<td>3.向校内外报刊、广播台投稿被录用的，国家级加2分/篇；省级加1分/篇；校级加0.5分/篇。在各级党团组织和学生组织从事宣传工作者、学生记者按上述标准减半加分，加分最多不得超过5分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td>3.不参加劳动或值日卫生者，每次扣1分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr>
					<td>4.学生干部根据担任职务、考核等级等情况加分，兼任多个职务的学生干部按最高职务加分，不累计。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td>4.其他劳动、卫生检查不合格或受到批评的班组，每人每次扣0.5分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr>
					<td>5.参加青年志愿者活动、社区服务活动，每次加1分，加分最多不超过3分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td>5.其他。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
				</tr>
				<tr>
					<td>6.参加校勤工助学，经学工部考核优秀者加1分。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td>7.其他。</td>
					<td><textarea name=""></textarea></td>
					<td><input name="" type="text"></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr class="subtotal-score">
					<td>分值小计</td>
					<td colspan="3"><span>此表此列中所有加分项</span></td>
					<td colspan="3"><span>此表此列中所有减分项</span></td>
				</tr>
				<tr>
					<td>总分</td>
					<td colspan="6" class="total-score">基础分+奖励分-惩罚分&nbsp;=&nbsp;前表的运算结果&nbsp;+
						<span>此表的此类项相加</span>
						<span>-</span>
						<span>此表的此类项相加</span>
						<span>=</span>
						<span>前面三个数的加减</span>
					</td>
				</tr>
			</table>
			<div class="submit-btn">
				<input type="submit" value="提交" style="width: 80px;">
				<button><a href="info_add.html">修改</a></button>
			</div>
		</form>
		<article class="notice">
			<h1>注：信息填写的注意事项.</h1>
			<ul>
				<li>需要注意的第一点</li>
				<li>需要注意的第二点</li>
			</ul>
		</article>
	</section>

	<jsp:include page="/jsp/public/foot.jsp"></jsp:include>

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

</html>