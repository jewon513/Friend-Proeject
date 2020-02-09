<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<%@include file="/WEB-INF/views/include/include-head.jsp"%>

</head>

<body>

<!-- Navigation -->
<%@include file="/WEB-INF/views/include/include-nav.jsp"%>

<div class="container">
	
	<c:choose>
		<c:when test="${Controller == 'login' }">
			<%@include file="/WEB-INF/views/include/include-login.jsp"%>
		</c:when>	
		<c:otherwise>
			<%@include file="/WEB-INF/views/include/include-join.jsp"%>
		</c:otherwise>
	</c:choose>	
	
</div>

</body>


</html>