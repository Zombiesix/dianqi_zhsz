<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>所有学生信息</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/student.css">
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>

<script type="text/javascript">
	// 当页面加载完成时直接获取第一位学生的 id 值，然后调用changeColor函数，在右边进行相应的显示，防止一开始右边为空白太难看
	$(document).ready(function(){
		var id = $('#student-list tbody tr:first').attr('id');
		changeColor(id);
	});
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
							<li><a href="${pageContext.request.contextPath }/proClass_findAllInfo.action?name=${proClass_dz.name }">${proClass_dz.name }</a></li>
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
							<li><a href="${pageContext.request.contextPath }/proClass_findAllInfo.action?name=${proClass_zdh.name }">${proClass_zdh.name }</a></li>
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
							<li><a href="${pageContext.request.contextPath }/proClass_findAllInfo.action?name=${proClass_dq.name }">${proClass_dq.name }</a></li>
							</c:if>
						</c:forEach>
					</ul>
				</li>
			</ul>
		</nav>
		<div class="user-info"><!-- The rightmost user is shown -->
			<div class="user-avatar">
<!-- 需要有个贯彻全站的用户，判断是否登陆 -->
				<c:if test="${sessionScope.s != null }">
					<a href="${pageContext.request.contextPath}/student_info.action?name=${sessionScope.s.name }">
						<img src="${pageContext.request.contextPath}/${sessionScope.s.avatar }" alt="用户名">
					</a>
				</c:if>
				<c:if test="${sessionScope.s == null }">
					<a href="${pageContext.request.contextPath}/jsp/error/not_user.jsp">
						<img src="${pageContext.request.contextPath}/image/user.png" alt="用户名">
					</a>
				</c:if>
			</div>
		</div>
		<form action="${pageContext.request.contextPath }/student_findStudentByName.action" method="post" class="search-form"><!-- The search box on the right -->
			<input type="search" name="searchName" class="search" maxlength="16" placeholder="搜索学生">
			<input type="submit" class="submit" value="搜">
		</form>
	</header><!-- end header -->
	<div class="header-placeholder"></div>

	<section class="banner" style="background-image: url(image/student-list-bg2.jpg);">
		<div class="content">
			<div class="left">
				<h1 class="title">各班级人员</h1>
				<div class="catalog">
<!-- 使用java代码得到当前时间和当前星期（注：星期为阿拉伯数字修改为中文） -->
					<span class="date"><%=new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %><span class="week">周<%=new java.util.Date().getDay() %></span></span>
					<form action="" class="form-content">
						<!-- if not super administrator,select component is disable and display -->
						<select name="" id="" class="form-select">
							<!-- 在后台查询到所有班级列表（listp）和指定班级（proClas），循环所有班级如果等于指定班级进行默认显示 -->
							<c:forEach items="${listp }" var="pC">
								<c:if test="${pC.name == proClass.name}">
									<option value="${pC.name }" selected="selected">${pC.name }</option>
								</c:if>
								<c:if test="${pC.name != proClass.name}">
									<option value="${pC.name }">${pC.name }</option>
								</c:if>
							</c:forEach>
						</select>
					</form>
				</div>
				<table id="student-list">
					<thead>
						<tr>
							<td style="width: 8%"></td>
							<td style="width: 14%">姓名</td>
							<td style="width: 10%">性别</td>
							<td style="width: 24%">联系方式</td>
							<td style="width: 14%">总成绩</td>
							<td style="width: 14%">当前排名</td>
							<td style="width: 12%"></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${proClass.students }" var="student">
							<tr style="color: #333;" id="${student.sid }" onmouseover="changeColor(this.id)">
								<td>${student.stuID }</td>
								<td>${student.name }</td>
						<!-- 因为数据库中存储的是“0”或“1”所以需要判断 -->
								<c:if test="${student.sex == 1 }">
									<td>男</td>
								</c:if>
								<c:if test="${student.sex == 0 }">
									<td>女</td>
								</c:if>
								<td>${student.tele }</td>
								<td>${student.score70p }</td>
								<td>${student.score30p }</td>
						<!-- 首先判断学生状态（status字段）是否已经添加了综合素质；在添加了综合素质的学生中进行判断较上一学期（lift），排名是上升了还是下降了，上升下降了多少 -->
								<c:if test="${student.status == 0 }">
									<td>--</td>
								</c:if>
								<c:if test="${student.status == 1 }">
									<td>
										<c:if test="${fn:substring(student.lift, 0, 1) == 's'}">
											<img class="up" src="image/up.png" alt="">
										</c:if>
										<c:if test="${fn:substring(student.lift, 0, 1) == 'x'}">
											<img class="down" src="image/down.png" alt="">
										</c:if>
										${fn:substringAfter(student.lift, fn:substring(student.lift, 0, 1)) }
										</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
<!-- 需进行分页查询，其中加上Ajax的技术，需要注意，如何实现 -->
				<div class="page">
					<ul>
						<li><a href="#">上一页</a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">下一页</a></li>
					</ul>
				</div>
				<div class="notice">
					<p>注：最后一列表示较去年排名的升降情况，“--”表示此同学还没有填写今年信息。</p>
				</div>
			</div>
			<div id="student-info" class="right">
				<div class="avatar">
					<a href="#">
						<img src="" alt="头像">
					</a>
				</div>
				<div class="desc">
					<h1 class="name"></h1>
					<p class="sex"></p>
					<p class="birthday"></p>
					<p class="tele"></p>
					<p class="score"></p>
					<p class="rank"></p>
				</div>
			</div>
		</div>
	</section>

	<section class="student-info">
		<div class="movie">
	    	<div class="title">凑个页面内容（好看点）</div>
	    	<div class="row">
	    		<div class="item">
	    			<a href="#">
		    			<div class="pic">
		    				<img src="image/movie-image/Artificial Intelligence.jpg"/>
		    			</div>
	    			</a>
	    			<div class="description">
	    				<a href="#">人工智能</a>
	    				<p class="content">等千年只为最后一见</p>
	    			</div>
	    		</div>
	    		<div class="item">
	    			<a href="#">
		    			<div class="pic">
		    				<img src="image/movie-image/Interstellar.jpg"/>
		    			</div>
	    			</a>
	    			<div class="description">
	    				<a href="#">星际穿越</a>
	    				<p class="content">基普·索恩配上好莱坞特效</p>
	    			</div>
	    		</div>
	    		<div class="item">
	    			<a href="#">
		    			<div class="pic">
		    				<img src="image/movie-image/The Shawshank Redemption.jpg"/>
		    			</div>
	    			</a>
	    			<div class="description">
	    				<a href="#">肖申克的救赎</a>
	    				<p class="content">珍惜所拥有的自由</p>
	    			</div>
	    		</div>
	    		<div class="item">
	    			<a href="#">
		    			<div class="pic">
		    				<img src="image/movie-image/Forrest Gump.jpg"/>
		    			</div>
	    			</a>
	    			<div class="description">
	    				<a href="#">阿甘正传</a>
	    				<p class="content">困难只能为坚持增添色彩</p>
	    			</div>
	    		</div>
	    		<div class="item">
	    			<a href="#">
		    			<div class="pic">
		    				<img src="image/movie-image/War Wolf 2.jpg"/>
		    			</div>
	    			</a>
	    			<div class="description">
	    				<a href="#">战狼</a>
	    				<p class="content">斯皮尔伯格:谁说商业和艺术不可兼得-fighting</p>
	    			</div>
	    		</div>
	    	</div>
	    	<div class="more_movie">
	    		<a href="#">了解更多</a><!-- 直接调转到电影推荐网站 -->
	    	</div>
	    </div>
	</section><!-- begin settiing student-info -->

	
	<jsp:include page="/jsp/public/foot.jsp"></jsp:include>
	
</body>

<!-- 导航栏的行为 -->
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

<!-- 班级人员显示内容的行为 -->
<script type="text/javascript">
	function changeColor(id){
		// 改变表格的样式
		$('#student-list tr').css('color', '#333');
		$('#'+id).css('color', '#403cdc');
		// 在右边进行学生详细信息的显示
		var name = $('#'+id+' td').eq(1).html();// 得到对应学生的姓名
		var url = "${pageContext.request.contextPath}/student_findStudentByName.action";
		var param = {"name" : name};
		$.post(url,param,function(data){
			$('#student-info img').attr('src', '${pageContext.request.contextPath}/'+data.avatar);
			$('#student-info h1.name').html('姓名：'+data.name);
			if(data.sex == 1){
				$('#student-info p.sex').html('性别：男');
			}
			if(data.sex == 0){
				$('#student-info p.sex').html('性别：女');
			}
			// 将后台传过来的长整型转化为Date格式
/* var dateString = new SimpleDateFormat("yyyy-MM-dd").format(new Date(data.birthday)); 日期类型问题*/
			$('#student-info p.birthday').html('生日：'+data.birthday);
			$('#student-info p.tele').html('手机号：'+data.tele);
			$('#student-info p.score').html('成绩：'+data.score70p);
			$('#student-info p.rank').html('排名：'+data.rank);
		},"json");
	}
</script>

</html>