<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css">

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