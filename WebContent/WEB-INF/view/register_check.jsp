<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="jp.co.sss.crud.bean.Employee" %>
<%
	Employee registerEmployee = (Employee) session.getAttribute("registerEmployee");
%>
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
			<h3>社員登録確認画面</h3>
			<div class="update">
				<div class="form">
					<div class="label">パスワード：</div>
					<div class="input">※非表示</div>
				</div>
				<div class="form">
					<div class="label">社員名：</div>
					<div class="input">${registerEmployee.emp_name}</div>
				</div>
				<div class="form">
					<div class="label">性別：</div>
					<div class="input">
						<c:if test="${registerEmployee.gender == 1}">男性</c:if>
						<c:if test="${registerEmployee.gender == 2}">女性</c:if>
					</div>
				</div>
				<div class="form">
					<div class="label">住所：</div>
					<div class="input">${registerEmployee.address}</div>
				</div>
				<div class="form">
					<div class="label">生年月日：</div>
					<div class="input">${registerEmployee.birthday}</div>
				</div>
				<div class="form">
					<div class="label">権限：</div>
					<div class="input">
						<c:if test="${registerEmployee.authority == 1}">一般</c:if>
						<c:if test="${registerEmployee.authority == 2}">管理者</c:if>
					</div>
				</div>
				<div class="form">
					<div class="label">部署名：</div>
					<div class="input">
						<c:if test="${registerEmployee.dept_id == 1}">営業部</c:if>
						<c:if test="${registerEmployee.dept_id == 2}">経理部</c:if>
						<c:if test="${registerEmployee.dept_id == 3}">総務部</c:if>
					</div>
				</div>
				<form method="get" action="./RegisterServlet" >
					<div class="form">
						<div class="label"></div>
						<div class="input">
							<!-- <input type="hidden" name="empPass" value="4444" /> <input
								type="hidden" name="empName" value="山田千絵" /> <input type="hidden"
								name="gender" value="2" /> <input type="hidden" name="address"
								value="埼玉県" /> <input type="hidden" name="birthday"
								value="1990/11/3" /> <input type="hidden" name="authority"
								value="1" /> <input type="hidden" name="deptId" value="3" /> -->
							<input type="submit" name="action" value="done" />
						</div>
					</div>
				</form>
				<form action="regist_input.html">
					<div class="form">
						<div class="label"></div>
						<div class="input">
							<input type="hidden" name="empPass" value="4444" /> <input
								type="hidden" name="empName" value="山田千絵" /> <input type="hidden"
								name="gender" value="2" /> <input type="hidden" name="address"
								value="埼玉県" /> <input type="hidden" name="birthday"
								value="1990/11/3" /> <input type="hidden" name="authority"
								value="1" /> <input type="hidden" name="deptId" value="3" /> <input
								type="submit" value="戻る" />
						</div>
					</div>
				</form>
			</div>
		</article>
	</div>

	<footer>Copyright(C) 2017 System Shared co., ltd, ALL Rights Reserved</footer>
</body>
</html>