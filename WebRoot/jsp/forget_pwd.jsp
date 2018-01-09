<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>忘记密码</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/forget_pwd.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css">
	<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
</head>

<script type="text/javascript">
	$(document).ready(function(){
		/* 禁止submit提交框的默认提交 */
		$("input[type='submit']").click(function(){
			/* alert("123"); */
			return false;
		});
		
		/* 如果想进行下一步的操作就需要，此页面的所有的输入框都需要输入正确的信息，否则不能点击；这些判断使用“悬停”事件 */
		$('input[type="submit"]').mouseenter(function(){
			/* alert("123"); */
			var id = $(this).attr('id').slice(0,-2) + "-error";
			/* alert($('#'+id).attr("class")); */
			//判断前面操作的错误信息，如果存在错误将绑定的点击事件去除，如果没有错误信息，加上点击事件
			if($('#'+id).html() == "信息填写正确"){
				$(this).attr('onclick', 'changeStep(this.id)');
			}else{
				$(this).removeAttr('onclick');
			}
		});
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

	<section class="forget-pwd-content">
		<h1 class="headline">
			<span class="headline_content">找回登录密码</span>
		</h1>
		<ul id="step" class="steps-bar">
			<li id="step-1" class="step step-current">
				<span class="step_num">1.</span>
				<span>确定账号</span>
				<span class="arrow__background"></span>
				<span class="arrow__foreground"></span>
			</li>
			<li id="step-2" class="step">
				<span class="step_num">2.</span>
				<span>验证修改</span>
				<span class="arrow__background"></span>
				<span class="arrow__foreground"></span>
			</li>
			<li id="step-3" class="step">
				<span class="step_num">3.</span>
				<span>完成</span>
			</li>
		</ul>
		<div id="step-1-content" class="form-wrapper" style="display: block;">
			<form action="#" class="login" method="post">
				<div>
					<span id="step-2-error" class="error"></span>
				</div>
				<div class="ipt">
					<label for="account">账&nbsp;&nbsp;&nbsp;号：</label>
					<input name="account" id="account" type="text" placeholder="请输入一卡通号" value="">
				</div>
				<div class="ipt">
					<label for="code">验证码：</label>
					<input name="code" id="code" class="veri-code" type="text">
					<span class="code-image"><img src="#" alt=""></span>
				</div>
				<div class="login-btn">
					<input id="step-2-1" class="btn" type="submit" value="下一步">
				</div>
			</form>
		</div>
		<div id="step-2-content" class="form-wrapper" style="display: none;">
			<form action="${pageContext.request.contextPath }/student_setNewPwd.action" class="login">
				<div>
					<span class="error" id="step-3-error"></span>
				</div>
				<div class="ipt">
					<label for="check">校验码：</label>
					<input name="check_code" id="check" type="text" placeholder="身份证后六位">
				</div>
				<div class="ipt">
					<label for="newPwd">新密码：</label>
					<input name="newPwd" id="newPwd" type="password" placeholder="新密码">
				</div>
				<div class="ipt">
					<label for="newPwd1">新密码：</label>
					<input name="newPwd" id="newPwd1" type="password" placeholder="再次输入新密码">
				</div>
				<div class="login-btn">
					<input class="btn" type="submit" value="上一步">
					<input id="step-3-2" class="btn" type="submit" value="完成">
				</div>
			</form>
		</div>
		<div id="step-3-content" class="form-wrapper" style="display: none;">
			<p class="step3-p">密码修改完成，<a href="${pageContext.request.contextPath }/index.jsp">点此</a>进行登陆。</p>
		</div>
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
<script>

/* 简单的步骤跳转没有任何的功能实现 */
	/* “上一步”，“下一步”的步骤实现简单的跳转，其中的功能实现使用jQuery发送一步请求实现 */
	function changeStep(id){
		/* 1、设置步骤标题的样式变化 */
		$('#step li').removeClass('step-current');//移出所有样式
		var id1 = $('#'+id).attr('id').slice(0,-2);// 得到指定对象的id值（此处为“step-1-2”），截取其中的第一个数据到倒数第三个数据
		$('#'+id1).addClass('step-current');//添加指定样式
		/* 2、设置内容的显示和隐藏 */
		$('.form-wrapper').css('display', 'none');//隐藏所有的样式
		$('#'+id1+'-content').css('display', 'block');//添加指定样式
		
		/* 添加一个判断，当为最后一步操作时，进行密码数据的修改 */
		if(id == "step-3-2"){
			/* alert('123'); */
			var url = "${pageContext.request.contextPath }/student_setNewPwd.action";
			var param = {"newPwd": $('#newPwd1').val()};
			$.post(url,param,function(data){
				/* alert("这里不需要返回值"); */
			},"text");
		}
	}
	
/* 失去焦点触发，（账号、校验码、新密码） */
	/* 当账号框失去焦点时触发函数，调用后台返回信息 */
	$('#account').blur(function(){
		/* alert($('#account').val()) */;
		var url = "${pageContext.request.contextPath }/student_accountIfExist.action";
		var param = {"account": $('#account').val()};//注：“attr('value')”只能获得固定的value属性值
		$.post(url,param,function(data){
			$('#step-2-error').html(data);
		},"text");
	});
	/* 当校验码框失去焦点时触发函数，调用后台返回信息 */
	/* 注：有一问题，用户输入的校验码需要和之前输入的用户名相对应，这里还没有做（可以在第一步中将账号信息放到session，后面就可以使用了） */
	$('#check').blur(function(){
		/* alert('123'); */
		var url = "${pageContext.request.contextPath }/student_checkCode.action";
		var param = {"check_code": $('#check').val()};
		$.post(url,param,function(data){
			$('#step-3-error').html(data);
		},"text");
	});
	/* 判断两次输出的密码是否相等，如果不相等直接返回错误信息，相等的话返回正确信息（注：此项为页面最后一项，不能使用失去焦点事件） */
	$('#newPwd1').blur(function(){
		var value1 = $('#newPwd1').val();
		var value = $('#newPwd').val();
		if(value1 != value){
			$('#step-3-error').html("两次输入的密码不匹配");
		}else{
			$('#step-3-error').html("信息填写正确");
		}
	});
</script>
</html>