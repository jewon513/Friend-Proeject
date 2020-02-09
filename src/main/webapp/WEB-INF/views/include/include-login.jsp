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

<script>
	$(function(){
		
	})
</script>

<div class="d-flex justify-content-center">

	<div class="login-box shadow p-3 mb-5 bg-white rounded text-center">
		<form:form modelAttribute="userDTO">
			<p>
			<h1>Login</h1>
			</p>
			<div class="form-group">
				<form:input type="text" class="form-control" placeholder="Enter Your Id" path="user_id"></form:input>
			</div>
			<div class="form-group">
				<form:input type="password" class="form-control" placeholder="Enter Your Password" path="user_pw"></form:input>
			</div>
			<p>
				<small><a href="${rootPath}/user/join" class="text-info">계정이 없다면 지금 가입하세요.</a></small>
			</p>
			<p>
				<small><a href="#" class="text-danger">혹시 비밀번호를 잃어버리셨나요?</a></small>
			</p>
			<div class="row">
				<button class="m-auto btn btn-primary login-button">Login</button>
			</div>
		</form:form>

	</div>

</div>