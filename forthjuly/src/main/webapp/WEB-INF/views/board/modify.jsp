<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


            	<form id='form1' >        
        			<input type="hidden" name="bno" value="${cri.bno}">
            		<input type="hidden" name="page" value="${cri.page}">
        			<input type="hidden" name="amount" value="${cri.amount}">
        			<input type="hidden" name="type" value="${cri.type}">
          			<input type="hidden" name="keyword" value="${cri.keyword}">
   

				<div class="form-group">
                    <input type="text" name='bno' class="form-control form-control-user"  placeholder="Bno"
                    	value='<c:out value="${vo.bno}"/>' readonly="readonly">
                  </div>
            	
                <div class="form-group">
                    <input type="text" name='title' class="form-control form-control-user"  placeholder="Title"
                    	value='<c:out value="${vo.title}"/>' >
                  </div>

                <div class="form-group">
                  <input type="text" name='content' class="form-control form-control-user"  placeholder="content"
                  		value='<c:out value="${vo.content}"/>' >
                </div>
                <div class="form-group ">
                    <input type="text" name='writer' class="form-control form-control-user" placeholder="writer"
                   		value='<c:out value="${vo.writer}"/>' readonly="readonly">
                    	
                </div>
 </form>   
 
 <button class="btn btn-danger">delete</button>
 <button class="btn btn-warining">modify</button>
 <hr><a href="/board/list" class = "btn btn-secondary">Go to list</a>

<script type="text/javascript" src="/resources/js/reply.js"> </script>
<script>

$('.btn-danger').on("click",function(){
	 console.log("delete Button click");
	 
	 var formObj = $("#form1");
	 formObj
	 	.attr("action","/board/remove")
	 	.attr("method","post")
	 	.submit();
});
$('.btn-warning').on("click",function(){
	 console.log("modify Button click");
	 
	 var formObj = $("#form1");
	 formObj
	 	.attr("action","/board/modify")
	 	.attr("method","post")
	 	.submit();
});
$('.btn-secondary').on("click",function(e){
	 e.preventDefault();
	 var formObj = $("#form1");
	 formObj.find("input[name='bno']").remove();
	 formObj
	 	.attr("action","/board/list")
	 	.attr("method","get")
	 	.submit();
});



</script>

              
</body>


</html>