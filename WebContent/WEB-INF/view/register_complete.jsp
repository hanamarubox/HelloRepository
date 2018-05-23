<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
			<h3>社員登録完了画面</h3>
			<div class="message">
				<p>社員登録処理が完了しました。</p>
				<p>
					<a href="./ListServlet">一覧表示に戻る</a>
				</p>
			</div>
		</article>
	</div>

	<footer>Copyright(C) 2017 System Shared co., ltd, ALL Rights Reserved</footer>
</body>
</html>