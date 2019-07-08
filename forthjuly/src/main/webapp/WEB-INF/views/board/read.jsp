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
	<div class="form-group">
                    <input type="text" name='bno' class="form-control form-control-user"  placeholder="Bno"
                    	value='<c:out value="${vo.bno}"/>' readonly="readonly">
                  </div>
            	
                <div class="form-group">
                    <input type="text" name='title' class="form-control form-control-user"  placeholder="Title"
                    	value='<c:out value="${vo.title}"/>' readonly="readonly">
                  </div>

                <div class="form-group">
                  <input type="text" name='content' class="form-control form-control-user"  placeholder="content"
                  		value='<c:out value="${vo.content}"/>' readonly="readonly">
                </div>
                <div class="form-group ">
                    <input type="text" name='writer' class="form-control form-control-user" placeholder="writer"
                   		value='<c:out value="${vo.writer}"/>' readonly="readonly">
                    	
                </div>
                
                <button class="btn btn-primary modBtn">
                 Modify/Delete
                 </button>
                 
                 
                <button class="btn btn-secondary listBtn">
                  Go List
                </button>
                
                 <script type="text/javascript" src="/resources/js/reply.js"> </script>
 
 <script>

 console.log(replyService)
 
 var actionForm = $("#actionForm");
 var bno = ${vo.bno};
 var replyList=$(".replyList");

 
 showPage();
 
 replyList.on("click","li", function(e){
	 
	 var rno = $(this).attr("data-rno")
	 
	 replyService.getReply(rno, function(reply){
		 
		 console.log("---------------------")
		 console.log(reply)
		 
		 $(".mrno").val(reply.rno);
		 $("input[name='reply']").val(reply.reply);
		 $("input[name='replyer']").val(reply.replyer);
		 
		 $("#replyModal").modal("show");
		 
		 $(".modifyBtn").removeClass("hide")
		 $(".replyBtn").addClass("hide")
		 $(".deleteBtn").removeClass("hide")
		
	 })
 });
 
 $(".addReplyBtn").on("click",function(e){
	 $("#replyModal").modal("show");
	 $(".modifyBtn").addClass("hide")
	 $(".replyBtn").removeClass("hide")
	 $(".deleteBtn").addClass("hide")
 });
 
 $(".modBtn").on("click", function(e){
	actionForm.submit();	 
 });

 $(".listBtn").on("click", function(e){
	actionForm.find("input[name='bno']").remove();
	actionForm.attr("action","/board/list").submit();	 
 });
 
 $(".replyBtn").on("click", function (e) {

     let obj = {
         bno: $(".mbno").val(),
         reply: $("input[name='reply']").val(),
         replyer: $("input[name='replyer']").val(),
     }

     replyService.addReply(obj, function(){
         alert("댓글 등록 성공")
         $("#replyModal").modal('hide')
         showPage()

     });

 });
 
 $(".deleteBtn").on("click", function(e){
	
	 var rno = $("input[name='rno']").val();
	 
	 alert(rno);
	 
	  replyService.removeReply(rno, function(){
		 alert("removed....");
         $("#replyModal").modal('hide')
		 showPage();
	 }) 
	 
 })
 
     function showPage(){

        replyList.html("")

        replyService.getList(bno,function (arr) {

            var str='';
            //구조 분해 할당
            for(var i=0;i<arr.length;i++){
                var {rno,bno,reply,replyer}=arr[i]
                console.log(rno,bno,reply)
                
                var temp=
                    "<li class='list-group-item' data-rno="+rno+">"+
           				"<div class='rno'>"+rno+"</div>"+
           				"<div class='reply'>"+reply+"</div>"+
           				"<div class='replyer'>"+replyer+"</div>"+
           			"</li>";
                str +=temp
            }
            replyList.append(str)
        })
    }
 
 var flag = '${result}';
 
 if(flag === 'success'){
	 alert("작업이 성공했습니다.");
 }
 
 
 </script>
</body>
</html>