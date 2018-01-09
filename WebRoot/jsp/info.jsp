<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>个人相关信息</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/info.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css">
	<script src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
</head>

<!-- 首次加载页面时禁止所有的输入框 -->
<script type="text/javascript">
	$(function(){
		$('select').attr('disabled', 'disabled');
		$('form#user-info input').attr('disabled', 'disabled');
		$('form#user-info input[type="submit"]').removeAttr('disabled');
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

	<div class="info-content">
		<div class="add-info"><a href="${pageContext.request.contextPath }/student_addInfoUI.action?name=${sessionScope.s.name}">填写本学期综合素质信息</a></div>
		<aside class="left">
			<h1>个人中心<span></span></h1>
			<ul>
				<li><a href="#">基本信息</a></li>
				<li><a href="#">等等信息</a></li>
				<!-- just only super administrtor have this feature -->
				<li id="allClass" onclick="displayClass(this.id)"><a href="#">所有班级</a></li>
				<ul id="allClass-display" class="dropdown" style="display: none;">
					<c:forEach items="${listp }" var="proClass">
						<li><a href="${pageContext.request.contextPath }/proClass_findAllInfo.action?name=${proClass.name }">${proClass.name }</a></li>
					</c:forEach>
				</ul>
			</ul>
		</aside><!-- end aside.left -->
		<aside class="right">
			<h1 class="title">基本信息</h1>
			<div class="right_content">
				<h3 class="update" onclick="updateInfo()">修改信息</h3>
				<div class="content_left">
					<div class="avatar">
						<a href="#">
							<c:if test="${student.avatar != null }">
								<img src="${pageContext.request.contextPath }/${student.avatar }" alt="用户头像">
							</c:if>
							<c:if test="${student.avatar == null }">
								<img src="${pageContext.request.contextPath }/image/avatar/avatar.png" alt="用户头像">
							</c:if>
						</a>
					</div>
<!-- 文件上传，并且显示到相应的位置 -->
					<div class="upload-avatar-image">
		              	<input type="button" class="upload-btn" value="更换头像">
		              	<input type="file" id="fileUpload"  name="file"/>
		            </div>
					<div class="tips">
						支持JPG、JPEG、PNG格式，且文件需小于1M。
					</div>
				</div>
				<div class="content_right">
					<form action="${pageContext.request.contextPath }/student_updateSByName.action" id="user-info" class="userexinfo-form" method="post">
			          	<div class="userexinfo-form-section">
			            	<p>姓名：</p>
			            	<span>
			              		<input type="text" name="name" id="" class="ui-checkbox" placeholder="姓名" value="${student.name }">
			            	</span>
			          	</div>
			          	<div class="userexinfo-form-section">
			            	<p>性别：</p>
			            	<span>
			            		<c:if test="${student.sex == 1 }">
			              			<input type="radio" name="gender" id="male" checked="checked" value="${student.sex }" class="radio-first">
			              		</c:if>
			              		<c:if test="${student.sex == 0 }">
			              			<input type="radio" name="gender" id="male" value="${student.sex + 1 }" class="radio-first">
			              		</c:if>
			              		<label for="male">男</label>
			            	</span>
			            	<span>
			            		<c:if test="${student.sex == 0 }">
			              			<input type="radio" name="gender" id="female" checked="checked" value="${student.sex }"  class="">
			              		</c:if>
			              		<c:if test="${student.sex == 1 }">
			              			<input type="radio" name="gender" id="female" value="${student.sex - 1 }"  class="">
			              		</c:if>
			              		<label for="female">女</label>
			            	</span>
			          	</div>
			          	<div class="userexinfo-form-section">
			            	<p>手机号：</p>
			            	<span>
			              		<input type="text" name="tele" id="" class="ui-checkbox" placeholder="手机号" value="${student.tele }">
			            	</span>
			            </div>
			          	<div class="date-picker userexinfo-form-section">
			  				<p>生日：</p>
			  				<span>
			    				<div class="ui-select">
			     	 				<select name="year" class="ui-select">
			     	 					<c:if test="${student.birthday == null }">
											<option selected="selected">--</option>
										</c:if>
										<c:forEach begin="1990" end="2010" step="1" var="i">
											<c:if test="${fn:substring(student.birthday,0,4) == i}">
												<option value="${i }" selected="selected">${i }</option>
											</c:if>
										 	<c:if test="${fn:substring(student.birthday,0,4) != i}">
												<option value="${i }">${i }</option>
											</c:if>
										</c:forEach>
        							</select>
   	 							</div>
   			 					<span class="tip">年</span>
  							</span>
  							<span>
    							<div class="ui-select">
									<select name="month" class="ui-select">
										<c:if test="${student.birthday == null }">
											<option selected="selected">--</option>
										</c:if>
										<c:forEach begin="01" end="12" step="1" var="i">
											<c:if test="${fn:substring(student.birthday,5,7) == i}">
												<option value="${i }" selected="selected">${i }</option>
											</c:if>
										 	<c:if test="${fn:substring(student.birthday,5,7) != i}">
												<option value="${i }">${i }</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
								<span class="tip">月</span>
							</span>
							<span>
								<div class="ui-select">
									<select name="day" class="ui-select">
										<c:if test="${student.birthday == null }">
											<option selected="selected">--</option>
										</c:if>
										<c:forEach begin="01" end="30" step="1" var="i">
											<c:if test="${fn:substring(student.birthday,8,10) == i}">
												<option value="${i }" selected="selected">${i }</option>
											</c:if>
										 	<c:if test="${fn:substring(student.birthday,8,10) != i}">
												<option value="${i }">${i }</option>
											</c:if>
										</c:forEach>
									</select>
								</div>
								<span class="tip">日</span>
							</span>
						</div>
<!-- 经典forEach、if、fn:container、“$左大括号 右大括号”（不能直接使用{和}会报错）的使用 -->
						<div class="userexinfo-form-section expand-list">
				            <p>兴趣：</p>
				            <div class="interest-list">
				                <!-- 将此用户所有的兴趣连接成字符串，中间放“-”隔开，最后得到一个字符串变量“hString”；后面直接可以使用contains判断其中是否包含某一字符串 -->
				                <!-- 注：在使用forEach循环时，变量不能定义为“A-B”，因为当放到$··中使用时“-”会被误解析 -->
				            	<c:set var="hString" value="0"></c:set>
				                <c:forEach items="${student.hobbys }" var="hobbyChecked">
				                	<c:set var="hString" value="${hString }-${hobbyChecked.hid }"></c:set>
				                </c:forEach>
				                <%-- <c:out value="${hString }"></c:out>可以得到所连接的值 --%>
				                
				            	<!-- 首先需要将所有的兴趣项查找出来，并进行循环显示；然后为每一个兴趣项进行判断是否为此用户的兴趣，如果“是”默认选中，“不是”默认不选中。 -->
				              	<c:forEach items="${hobbyList }" var="hobby">
					              	<span>
					              		<c:if test="${fn:contains(hString, hobby.hid) == true }">
					                		<input type="checkbox" id="userexinfo-form-interest-${hobby.hid }" name="hobbys1" value="${hobby.hobbyItem }" checked="checked" class="ui-checkbox" >
					                		<label for="userexinfo-form-interest-${hobby.hid }">${hobby.hobbyItem }</label>
					                	</c:if>
					                	<c:if test="${fn:contains(hString, hobby.hid) == false }">
					                		<input type="checkbox" id="userexinfo-form-interest-${hobby.hid }" name="hobbys1" value="${hobby.hobbyItem }" class="ui-checkbox" >
					                		<label for="userexinfo-form-interest-${hobby.hid }">${hobby.hobbyItem }</label>
					                	</c:if>
					              	</span>
				              	</c:forEach>
				              	<span class="bottom-tips">选择你的兴趣使你获得个性化的电影推荐哦</span>
				            </div>
				        </div>
						
						<div class="userexinfo-form-section">
							<p>个性签名：</p>
							<span>
								<input type="text" name="signature" id="userexinfo-form-bio" class="ui-checkbox" placeholder="20个字以内" value="${student.signature }">
							</span>
						</div>
						<input type="submit" class="form-save-btn" value="保存">
					</form>
				</div>
			</div>
		</aside><!-- end aside.right -->
	</div>

	
	<jsp:include page="/jsp/public/foot.jsp"/>

</body>

<script>
/* 导航栏的行为 */
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
/* 显示所有班级功能 */
	function displayClass(id){
		/* 设置内容的显示和隐藏 (进行下判断元素是否处于显示状态) */
		if($('#'+id+'-display').css('display') == 'none'){
			$('#'+id+'-display').css('display', 'block');
		}else{
			$('#'+id+'-display').css('display', 'none');
		}
	}
/* 对信息进行修改时开启所有输入框 */
	function updateInfo(){
		$('select').removeAttr('disabled');
		$('form#user-info input').removeAttr('disabled');
		// 因为姓名需要进行提交，将其设置为只读，不能是disabled
		$('input[name="name"]').attr('readonly','readonly');
		// 因为readonly的作用范围有限，只能是text、password、textarea，只能将其设置为disabled
		$('input[name="gender"]').attr('disabled','disabled');
		$('select').attr('disabled','disabled');
	}
</script>

</html>