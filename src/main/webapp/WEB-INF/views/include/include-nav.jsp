<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary static-top">
	<div class="container">
		<a class="navbar-brand" href="#">Friend Project</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="${rootPath}/">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
				<li class="nav-item"><a class="nav-link" href="${rootPath}/friend/list">Services</a></li>
				<c:if test="${LoginUser == null}">
					<li class="nav-item"><a class="nav-link" href="${rootPath}/user/login">login</a></li>
				</c:if>
				<c:if test="${not empty LoginUser}">
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">${LoginUser.user_nick}</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">member info</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="${rootPath}/user/logout">logout</a>
						</div>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>