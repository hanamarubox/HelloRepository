<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="css/layout.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>社員管理システム</title>
</head>
<body class="list">
	<header>
		<div class="container">
			<h1 class="site_title">社員管理システム</h1>
			<div class="user_info">ようこそ、<a href="../update/update_input.html">田中二郎</a>さん<span class="pipeline">|</span><a href="../index.html">ログアウト</a>
			</div>
		</div>
	</header>

	<div class="container content">
		<aside class="search">
			<div class="title">社員名検索</div>
			<div class="form">
				<form action="list.html">
					<input type="text" name="empName" />
					<input type="submit" value="検索" />
				</form>
			</div>
			<div class="title">部署名検索</div>
			<div class="form">
				<form action="list.html">
					<select name="deptId">
						<option value="1" selected="selected">営業部</option>
						<option value="2">経理部</option>
						<option value="3">総務部</option>
					</select>
					<input type="submit" value="検索" />
				</form>
			</div>
		</aside>

		<article class="main">
			<h3 class="page_title">社員一覧画面</h3>
			<div class="regist_link">
				<a href="./RegisterServlet">新規社員登録</a>
			</div>
			<table class="emp_list_table">
				<tr>
					<th class="empId">社員ID</th>
					<th class="empName">社員名</th>
					<th class="gender">性別</th>
					<th class="address">住所</th>
					<th class="birthday">生年月日</th>
					<th class="authority">権限</th>
					<th class="deptName">部署名</th>
					<th class="button" colspan="2">操作</th>
				</tr>
				<c:forEach var="Employee" items="${list}">
					<tr>
						<td>${Employee.emp_id}</td>
						<td>${Employee.emp_name}</td>
						<td>
							<c:if test="${Employee.gender == 1}">男性</c:if>
							<c:if test="${Employee.gender == 2}">女性</c:if>
						</td>
						<td>${Employee.address}</td>
						<td>${Employee.birthday}</td>
						<td>
							<c:if test="${Employee.authority == 1}">一般</c:if>
							<c:if test="${Employee.authority == 2}">管理者</c:if>
						</td>
						<td>${Employee.dept_name}</td>
						<td class="button">
							<form action="./UpdateServlet" method="get">
								<input type="hidden" name="empId" value=${Employee.emp_id} />
								<input type="submit" value="変更" />
							</form>
						</td>
						<td class="button">
							<form action="./DeleteServlet" method="get">
								<input type="hidden" name="empId" value=${Employee.emp_id} />
								<input type="submit" value="削除" class="delete" />
							</form>
						</td>
					</tr>
				</c:forEach>
			</table>
		</article>
	</div>

	<footer>
		<small>Copyright(C) 2017 System Shared co., ltd, ALL Rights Reserved</small>
		<!-- small要素は免責・著作権・ライセンス要件などを表す際に使用します。 -->
	</footer>
</body>
</html>