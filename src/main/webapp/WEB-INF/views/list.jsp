<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<%@include file="/WEB-INF/views/include/include-head.jsp"%>

</head>

<script type="text/javascript">
	$(function() {

		$("#friend-input-btn").click(function() {
			document.location.href = "${rootPath}/friend/input"
		})

		$(".delete-btn").click(function() {

			let f_id = $(this).attr("data-id")

			if(confirm("삭제할까요?")){
				$.ajax({
					
					url : "${rootPath}/friend/delete",
					data : {f_id : f_id},
					type : "POST",
					success : function(result){
						if(result == "OK"){
							alert("삭제 성공")
							location.reload()
						}else{
							alert("삭제 실패")
						}
					},
					error : function(result){
						alert(result)
					}
					
				})

			}
			
		})
		
		$(".update-btn").click(function(){
			
			let f_id = $(this).attr("data-id")
			
			if(confirm("수정할까요?")){

				document.location.href = "${rootPath}/friend/update?f_id=" + f_id
				
			}
			
		})

		

	})
</script>

<style>
.list-items {
	cursor: pointer;
}

.search-box {
	width: 300px;
}
</style>

<body>

	<!-- Navigation -->
	<%@include file="/WEB-INF/views/include/include-nav.jsp"%>

	<div class="container">

		<p>
		<h1>친구 리스트</h1>
		</p>
		<hr>

		<%@include file="/WEB-INF/views/include/include-friend-list.jsp"%>
		<div class="d-flex justify-content-end">
			<button id="friend-input-btn" class="btn btn-primary">추가</button>
		</div>
		<ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
		<form action="${rootPath}/friend/search">
			<div class="search-box ml-auto mr-auto row">
				<select class="form-control col-4" id="select" name="select">
					<option value="name">이름</option>
					<option value="tel">번호</option>
				</select>
				<input class="form-control col-8 search" type="text" placeholder="search" name="keyword">
			</div>
		</form>

	</div>

</body>


</html>