<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="css/layout.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>社員管理システム</title>
</head>
<body>
	<header>
		<div class="content">
			<div class="title">社員管理システム</div>
		</div>
	</header>

	<div class="login">
		<h3>ログイン画面</h3>
		<div class="form">
			<p>社員IDとパスワードを入力してください。</p>
			<form method="post" action="./EmployeeServlet">
				<div class="login_label">社員ID</div>
				<div class="login_input">
					<input type="text" name="empId" />
				</div>
				<div class="login_label">パスワード</div>
				<div class="login_input">
					<input type="password" name="empPass" />
				</div>
				<div class="login_label"></div>
				<div class="login_input">
					<input type="submit" value="ログイン" />
				</div>
			</form>
		</div>
	</div>

	<footer>
		<div class="content">Copyright(C) 2017 System Shared co., ltd, ALL Rights Reserved</div>
	</footer>
</body>
</html>