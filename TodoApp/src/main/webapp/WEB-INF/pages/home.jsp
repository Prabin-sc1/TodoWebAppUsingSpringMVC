<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><c:out value="${page}"></c:out></title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
</head>
<body>
	<div class="container mt-3">
		<h1 class="text-center">Welcome to ToDo Manger</h1>

		<c:if test="${not empty msg}">

			<div class="alert alert-success">
				<b><c:out value="${msg}"></c:out></b>
			</div>
		</c:if>
		<div class="row mt-5">

			<div class="col-md-2">
				<div class="list-group">
					<button type="button"
						class="list-group-item list-group-item-action active"
						aria-current="true">Menu</button>
					<a href='<c:url value='/add'></c:url>'
						class="list-group-item list-group-item-action">Add Todo</a> <a
						href='<c:url value='/home'></c:url>'
						class="list-group-item list-group-item-action">View Todo</a>
				</div>
			</div>


			<div class="col-md-10">

				<c:if test="${page=='home'}">
					<h1 class="text-center">All TODOS</h1>
					<c:forEach items="${todos}" var = "t">
					<div class="card">
					<div class="card-body">
					<h3><c:out value="${t.todoTitle}"></c:out></h3>
					<p><c:out value="${t.todoContent}"></c:out></p>
					</div>
					</div>
					</c:forEach>
				</c:if>

				<c:if test="${page =='add'}">
					<h1 class="text-center">Add ToDo</h1>
					<br>
					<form:form action="saveTodo" method="post" modelAttribute="todo">

						<div class="form-group">
							<form:input path="todoTitle" cssClass="form-control"
								placeholder="Enter your todo title" />
						</div>

						<div class="form-group">
							<form:textarea path="todoContent" cssClass="form-control"
								placeholder="write content here" cssStyle="height:300px;" />
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add Todo</button>
						</div>



					</form:form>
				</c:if>
			</div>

		</div>


		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
			crossorigin="anonymous"></script>
</body>


<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
	integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
	crossorigin="anonymous"></script>
</html>