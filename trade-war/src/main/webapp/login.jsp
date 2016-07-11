<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="com.xcm.inf.acms.client.DynamicConfigLoader" %>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/meta.jsp"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="app_static_root" value='<%=DynamicConfigLoader.get("open.static")%>'/>
<link href="${app_static_root}/css/bootstrap.css" rel="stylesheet">
<link type="text/css" href="${app_static_root}/css/login2.css"  rel="stylesheet" />
<script type="text/javascript" src="${app_static_root}/js/jquery.js"></script>
<script type="text/javascript" src="${app_static_root}/js/validate/jquery.validate.js"></script>
<script type="text/javascript" src="${app_static_root}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${app_static_root }/images/login.js"></script>
<script type="text/javascript">

		document.onkeydown = function (e) { 
			var theEvent = window.event || e; 
			var code = theEvent.keyCode || theEvent.which; 
			if (code == 13) { 
				$("#loginBtn").click(); 
			} 
		} 

		if(window.top==self){
			//alert("我没在Frame里边!");
		}else{			
			window.top.document.location.href= "${pageContext.request.contextPath }/login.jsp";
		}
	  //页面validate
		$(document).ready(function() {
			//聚焦第一个输入框
				$("#j_username").focus();
				//为userInfoFrom注册validate函数
				$("#loginform").validate({
					rules : {
						j_username : "required",
						j_password : "required"
					},
					messages: {
						j_username:{
							required: "用户名不能为空"
						},
						j_password:{
							required: "密码不能为空"
						}
					}
				});
			//取cookie里的用户名密码	
			$("#j_username").val($.cookie('j_username'));
			//登录
			$("#loginBtn").click(function(){
				var validate=$("#loginform").validate().form();
				if(validate){	
 					if($("#_spring_security_remember_me").prop("checked")==true){
						$.cookie('j_username', $("#j_username").val(), { expires: 7 });
					} 
					$("#loginform").submit();
				}else{
					return false;
				}
			});
			$("#clearUser").click(function(){
				$.removeCookie('j_username');
				$.removeCookie('j_password');
				$("#j_username").val("");
				$("#j_password").val("");
			});
			
			
	});
</script>

<title>登录系统后台</title>
<style type="text/css">
  body {
  padding-top: 140px;
  padding-bottom: 40px;
  background-color: #eee;
}

.form-signin {
  max-width: 350px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .form-signin-heading,
.form-signin .checkbox {
  margin-bottom: 10px;
}
.form-signin .checkbox {
  font-weight: normal;
}
.form-signin .form-control {
  position: relative;
  font-size: 16px;
  height: auto;
  padding: 10px;
  width: 100%;
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
.form-signin .form-control:focus {
  z-index: 2;
}
.form-signin input[type="text"] {
  margin-bottom: -1px;
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}
.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

.pd_30{padding-bottom:20px;}
.xcm-main{width:600px; margin:0 auto;}
.login-modle dl dt{float:left; text-align:right; padding-top:8px;width: 10%}
.login-modle dl dd{float:left; margin-left:10px;width: 85%}
.login-modle{background-color: #fff; box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);}
</style>
</head>

<body >
<div class="xcm-main pd_30">
	<img src="${app_static_root}/images/header.png" />
</div>
<div class="xcm-main login-modle">
      <form id="loginform" class="form-signin" method="post" action="${pageContext.request.contextPath}/j_spring_security_check">
      	<dl class="clearfix">
        	<dt></dt>
        	<dd><h2 class="form-signin-heading" style="color: #004ECC;">开放平台管理系统</h2></dd>
        </dl>
        
        <div id="errorMsg" style="color: red;">${SPRING_SECURITY_LAST_EXCEPTION.message }</div>
        <dl class="clearfix">
        	<dt style="float:left;">账号&nbsp;&nbsp;</dt>
        	<dd><input type="text" class="form-control" style="background-color: #ECF5FA" autofocus name="j_username" id="j_username" value=""/></dd>
        </dl>
        <dl class="clearfix">
        	<dt>密码&nbsp;&nbsp;</dt>
        	<dd><input type="password" class="form-control" style="background-color: #ECF5FA"  name="j_password" id="j_password" value="" autocomplete="off"/></dd>
        </dl>
        <dl class="clearfix">
    		<dt>&nbsp;</dt>
       		<dd><button id="loginBtn" class="btn btn-lg btn-primary btn-large btn-block" type="button">登录</button></dd>
    	</dl>       
      </form>
    </div>
</body>
</html>


