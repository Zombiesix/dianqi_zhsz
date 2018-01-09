<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>综合素质管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/public.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css?version=1.0">
	<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		/****************************** 分页显示对应班级的学生信息 ***************************/
		// 请求参数获取（注：不能直接获取a 标签的内容，因为还有上一页和下一页，可以获取 a 标签的上一层li标签的id值）
		$('.page li').click(function(){
			var liContentId = $(this).attr("id");
			/* alert(typeof liContent); */
			if((typeof liContentId) != "undefined"){// 这里类型需要加上一个双引号，为字符串类型
				/* alert("asd"); */
				// 根据得到的参数发送Ajax请求（参数：请求的地址，传入的参数，回调函数，返回的内容格式）
				var url = "${pageContext.request.contextPath }/index_ajaxRank.action";
				var param ={currPage : liContentId}; 
				$.get(url, param, function(data){
					/* alert("Data Loaded:" + data); //得到数据*/
					$('#rank-tbody').html("");//首先将其内容设置为空，然后设置我们需要的值
					// 对 data 数据（pageBean中的list数据）进行循环（注：“i”表示循环对象下标(0,1...)，“n”表示对应的循环对象）
					$(data.list).each(function(i,n){
						/* alert(i + "-");// 得到的是“0-”“1-”“2-”... */
						$('#rank-tbody').append('<tr style="color: #333;" id=' + n.sid + ' onmouseover="changeColor(this.id)">');
						/* alert($('tr:eq[0]').html()); */
						$('#rank-tbody tr').eq(i).append('<td>' + n.rank + '</td>');
						$('#rank-tbody tr').eq(i).append('<td>' + n.name + '</td>');
						$('#rank-tbody tr').eq(i).append('<td>' + n.score70p + '</td>');
						$('#rank-tbody tr').eq(i).append('<td>' + n.score30p + '</td>');
						$('#rank-tbody').append('</tr>');
					});
					/* alert(data.currPage); */
				}, "json");
			}
		});
		/* alert(typeof liContent); */
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
	<div class="header-placeholder"></div>

	<section class="login" style="background-image: url(${pageContext.request.contextPath}/image/student-list-bg1.jpg);">
		<article class="sentiment">
			<p>生活没有剧本</p>
			<p class="last">成功没有捷径</p>
		</article>
		<c:if test="${empty sessionScope.s }">
		<form action="${pageContext.request.contextPath }/student_login.action" method="post" class="login">
			<div>
				<span id="loginError" class="error">错误信息显示</span>
			</div>
			<div class="ipt">
				<label for="account">账&nbsp;&nbsp;&nbsp;号：</label>
				<input name="account" id="account" type="text" placeholder="请输入一卡通号" value="${aCookie.account.value }">
			</div>
			<div class="ipt">
				<label for="pwd">密&nbsp;&nbsp;&nbsp;码：</label>
				<input name="password" id="pwd" type="password" placeholder="请输入密码" value='${pCookie.password.value }'>
			</div>
			<div class="ipt">
				<label for="code" class="veri-code">验证码：</label>
				<input name="code" id="code" class="veri-code-input" type="text">
				<span class="code-image"><img src="${pageContext.request.contextPath }/student_codeServlet.action" alt=""></span>
			</div>
			<div>
				<input name="remember" id="remb" type="checkbox" ${aCookie.account==null?"":"checked=checked"}>
				<label class="remember" for="remb">记住密码</label>
				<span class="forget"><a href="${pageContext.request.contextPath }/student_forgetPwd.action">忘记密码</a></span>
			</div>
			<div class="login-btn">
				<input id="login" class="btn" type="submit" value="登录">
				<input class="btn" type="reset" value="重置">
			</div>
			<div class="notice">
				<p>注：1、账号为一卡通号（10位）.</p>
				<p class="last">2、初始密码为身份证后六位.</p>
				<p class="last">3、----------------</p>
				<p class="last">4、----------------</p>
				<p class="last">5、----------------</p>
			</div>
		</form>
		</c:if>
	</section><!-- end section.login -->

	<section class="main">
		<aside class="main_left">
			<h1 class="title">有问题请咨询（各班负责人）</h1>
			<article class="principal">
				<c:forEach items="${lists }" var="student">
					<div class="unit">
						<div class="avatar">
							<a href="${pageContext.request.contextPath}/student_getStudentByName.action?name=${student.name}">
								<img src="${pageContext.request.contextPath}/${student.avatar }" alt="${student.name }">
							</a>
						</div>
						<div class="info">
							<c:if test="${student.identity == 2 }"><!-- 注：‘==2’需要放到里面 -->
								<p class="counselor">辅导员</p>
							</c:if>
							<p class="name">姓名：${student.name }</p>
							<c:if test="${student.identity != 2 }">
								<p class="counselor">班级：${student.proClass.name }</p>
							</c:if>
							<p class="tele">电话：${student.tele }</p>
						</div>
					</div>
				</c:forEach>
			</article>
		</aside>
		
		<aside class="main_right">
			<h1 class="title">电子专业排名(已统计的)</h1>
			<article class="rank">
				<table id="rank-table">
					<thead>
						<tr>
							<td style="width: 20%;">排名</td>
							<td style="width: 30%;">姓名</td>
							<td style="width: 25%;">绩点分</td>
							<td style="width: 25%;">考试分</td>
						</tr>
					</thead>
					<tbody id="rank-tbody">
						<c:forEach items="${pageBean.list }" var="student">
							<tr style="color: #333;" id="${student.sid }" onmouseover="changeColor(this.id)">
								<td>${student.rank }</td>
								<td>${student.name }</td>
								<td>${student.score70p }</td>
								<td>${student.score30p }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="page">
					<ul>
						<c:if test="${pageBean.currPage == 1 }">
							<li style="background-color: #444;"><a href="javascript: void(0)">上一页</a></li>
						</c:if>
						<c:if test="${pageBean.currPage != 1 }">
							<li id="${pageBean.currPage - 1 }"><a href="javascript:void(0)">上一页</a></li>
						</c:if>
						
						<c:forEach begin="1" end="${pageBean.totalPage }" step="1" var="n">
							<c:if test="${pageBean.currPage == n }">
								<li style="background-color: #e85e5e;"><a href="javascript:void(0)">${n }</a></li>
							</c:if>
							<c:if test="${pageBean.currPage != n }">
								<li id="${n }"><a href="javascript:void(0)">${n }</a></li>
							</c:if>
						</c:forEach>
						
						<c:if test="${pageBean.currPage == pageBean.totalPage }">
							<li style="background-color: #444;"><a href="javascript: void(0)">下一页</a></li>
						</c:if>
						<c:if test="${pageBean.currPage != pageBean.totalPage }">
							<li id="${pageBean.currPage + 1 }"><a href="javascript: void(0)">下一页</a></li>
						</c:if>
					</ul>
				</div>
			</article>
		</aside>
		
	</section><!-- end section.main -->

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


<script type="text/javascript">
	/* 设置排名表格 */
	function changeColor(id){
		$('#rank-table tr').css('color', '#333');
		$('#'+id).css('color', '#403cdc');
	}
</script>

<!-- 验证账号的登录（账号密码不能为空，因为账号为一卡通号所以现在前端页面中验证下位数） -->
<script type="text/javascript">
	$('#account').blur(function(){
		var aValue = $(this).val();//得到账号框中数据
		if(aValue == ""){
			$('#loginError').html('账号不能为空');
		}else if(aValue.length != 10){
			$('#loginError').html('账号位数不对');
		}else{
			$('#loginError').html('');
		}
	});
	$('#pwd').blur(function(){
		var pValue = $(this).val();//得到账号框中数据
		/* alert(pValue); */
		if(pValue == ""){
			$('#loginError').html('密码不能为空');
		}else{
			$('#loginError').html('');
		}
	});
	$('#code').blur(function(){
		var cValue = $(this).val();//得到账号框中数据
		/* alert(cValue); */
		var url = "${pageContext.request.contextPath}/student_checkCodeServlet.action";
		var param = {"code": cValue};
		$.post(url,param,function(data){
			$('#loginError').html(data);
		},"text");
	});
	$('#login').mouseenter(function(){//当鼠标放到登录键上时触发，通过错误信息判断信息是否填写正确，来决定是否可以进行点击
		var error = $('#loginError').html();
		if(error == ""){
			$(this).removeAttr('onclick');
		}else{
			$(this).attr('onclick','{return false;}');
		}
	});
</script>

</html>