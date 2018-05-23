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
			<div class="user_info">
				ようこそ、<a href="../update/update_input.html">田中二郎</a>さん | <a href="../index.html">ログアウト</a>
			</div>
		</div>
	</header>

	<div class="content">
		<aside>
			<div class="title">社員名検索</div>
			<div class="form">
				<form action="../list/list.html">
					<input type="text" name="empId" />
					<input type="submit" value="検索" />
				</form>
			</div>
			<div class="title">部署名検索</div>
			<div class="form">
				<form action="../list/list.html">
					<select name="deptId">
						<option value="1">営業部</option>
						<option value="2">経理部</option>
						<option value="3">総務部</option>
					</select>
					<input type="submit" value="検索" />
				</form>
			</div>
		</aside>

		<article>
			<h3>社員登録入力画面</h3>
			<div class="update">
				<form method="post" action="./RegisterServlet" >
					<div class="form">
						<div class="label">パスワード：</div>
						<div class="input">
							<input type="password" name="empPass" />
						</div>
					</div>
					<div class="form">
						<div class="label">社員名：</div>
						<div class="input">
							<input type="text" name="empName" />
						</div>
					</div>
					<div class="form">
						<div class="label">性別：</div>
						<div class="input">
							<input type="radio" name="gender" value="1" />男性&nbsp;
							<input type="radio" name="gender" value="2" />女性
						</div>
					</div>
					<div class="form">
						<div class="label">住所：</div>
						<div class="input">
							<input type="text" name="address" />
						</div>
					</div>
					<div class="form">
						<div class="label">生年月日：</div>
						<div class="input">
							<input type="text" name="birthday" /> (YYYY/MM/DD)
						</div>
					</div>
					<div class="form">
						<div class="label">権限：</div>
						<div class="input">
							<input type="radio" name="authority" value="1" />一般&nbsp;&nbsp;
							<input type="radio" name="authority" value="2" />管理者
						</div>
					</div>
					<div class="form">
						<div class="label">部署名：</div>
						<div class="input">
							<select name="deptId">
								<option value="1">営業部</option>
								<option value="2">経理部</option>
								<option value="3">総務部</option>
							</select>
						</div>
					</div>
					<div class="form">
						<div class="label"></div>
						<div class="input">
							<input type="submit" value="登録" />
						</div>
					</div>
				</form>
				<form action="../list/list.html">
					<div class="form">
						<div class="label"></div>
						<div class="input">
							<input type="submit" value="戻る" />
						</div>
					</div>
				</form>
			</div>
		</article>
	</div>

	<footer>Copyright(C) 2017 System Shared co., ltd, ALL Rights Reserved</footer>
</body>
</html>