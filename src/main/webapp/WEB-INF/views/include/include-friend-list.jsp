<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>

	.delete-btn{
		position: absolute;
		top: 0px;
		right: 15px;
		z-index: 10;
	}
	
	.update-btn{
		position: absolute;
		top: 0px;
		right: 30px;
		z-index: 10;
	}
	
	.list-items:hover{
		background-color: #ddd;
		border-radius: 10px;
	}

</style>

<c:forEach items="${LIST}" var="vo">

	<div class="row align-items-center list-items">
		<div class="col-sm-3 text-center">
			<h3>${vo.f_name}</h3>
		</div>
		<div class="col-sm-9">
			<i class="far fa-trash-alt delete-btn" data-id="${vo.f_id}"></i>
			<i class="fas fa-pen update-btn" data-id="${vo.f_id}"></i>
			<small>번호 : ${vo.f_tel}</small><br>
			<small>주소 : ${vo.f_addr}</small><br>
			<small>취미 : ${vo.f_hobby}</small><br>
			<small>관계 : ${vo.f_relation}</small>
		</div>
	</div>
	
	<hr>

</c:forEach>