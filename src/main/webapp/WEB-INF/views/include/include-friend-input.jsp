<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
.friend-input-box {
	width: 100%;
	margin: 50px auto;
}
</style>

<script type="text/javascript">
	
  function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
      object.value = object.value.slice(0, object.maxLength);
    }    
  }
  
  $(function(){
	
	  var checkinput = function(){
		
		  let f_name = $("#f_name").val()
		  if(f_name == ""){
			  alert("이름을 입력해주세요")
			  $("#f_name").focus()
			  return false;
		  }
		  
		  let tel1 = $("#tel1").val()
		  if(tel1 == ""){
			  alert("전화번호를 입력해주세요")
			  $("#tel1").focus()
			  return false;
		  }
		  
		  let tel2 = $("#tel2").val()
		  if(tel2 == ""){
			  alert("전화번호를 입력해주세요")
			  $("#tel2").focus()
			  return false;
		  }
		  
		  let tel3 = $("#tel3").val()
		  if(tel3 == ""){
			  alert("전화번호를 입력해주세요")
			  $("#tel3").focus()
			  return false;
		  }
		  
	  }
	  
	  $("#input-btn").click(checkinput)
	  
	  $("#input-btn").keypress(function(key){
		
		  if(key.keyCode == 13){
			  checkinput
		  }
		  
	  })
	  
	  
  })
  
</script>

<div class="friend-input-box text-center shadow p-3 mb-5 bg-white rounded ">

	<p>
	<h2>친구 등록</h2>
	</p>

	<form:form modelAttribute="friendDTO">
		<form:input path="f_id" type="hidden"/>
		<form:input path="f_user" type="hidden"/>
		<div class="form-group row">
			<label class="col-2 col-form-label align-middle">이름</label>
			<form:input type="text" class="form-control col-9" path="f_name" maxlength="20"></form:input>
		</div>
		<div class="form-group row align-items-center">
			<label class="col-2 col-form-label align-middle">번호</label>
			<form:input type="number" class="form-control col-2" placeholder="" path="tel1" maxlength="3" oninput="maxLengthCheck(this)" ></form:input>
			<div class="col-1">
				-
			</div> 
			<form:input type="number" class="form-control col-2" placeholder="" path="tel2" maxlength="4" oninput="maxLengthCheck(this)" ></form:input>
			<div class="col-1">
				-
			</div>
			<form:input type="number" class="form-control col-2" placeholder="" path="tel3" maxlength="4" oninput="maxLengthCheck(this)" ></form:input>
		</div>
		<div class="form-group row">
			<label class="col-2 col-form-label align-middle">주소</label>
			<form:input type="text" class="form-control col-9" placeholder="" path="f_addr" maxlength="100"></form:input>
		</div>
		<div class="form-group row">
			<label class="col-2 col-form-label align-middle">취미</label>
			<form:input type="text" class="form-control col-9" placeholder="" path="f_hobby" maxlength="100"></form:input>
		</div>
		<div class="form-group row">
			<label class="col-2 col-form-label align-middle">관계</label>
			<form:input type="text" class="form-control col-9" placeholder="" path="f_relation" maxlength="100"></form:input>
		</div>
		<div class="d-flex justify-content-end">
			<button id="input-btn" class="btn btn-primary" >등록</button>
		</div>
	</form:form>
	
</div>