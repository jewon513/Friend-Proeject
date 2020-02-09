<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>

<style>
.login-box {
	width: 576px;
	margin-top: 50px;
}
</style>

<div class="d-flex justify-content-center">

	<div class="login-box shadow p-3 mb-5 bg-white rounded text-center">

		<form:form action="${rootPath}/user/join" modelAttribute="userDTO">
			<p>
			<h1>Join</h1>
			</p>
			<div class="form-group">
				<form:input type="text" class="form-control" placeholder="Enter Your Id" path="user_id"></form:input>
			</div>
			<div class="form-group">
				<form:input type="text" class="form-control" placeholder="Enter Your NickName" path="user_nick"></form:input>
			</div>
			<div class="form-group">
				<form:input type="password" class="form-control" placeholder="Enter Your Password" path="user_pw"></form:input>
			</div>
			<div class="row">
				<button class="m-auto btn btn-primary">Join</button>
			</div>
		</form:form>

	</div>

</div>