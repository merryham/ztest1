<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../includes/header.jsp" %>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">Board Register Page</h1>
          
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">DataTables Register</h6>
            </div>
            <div class="card-body">
            
            <form class="user" action="/board/register" method="post">
                <div class="form-group">
                    <input type="text" name='title' class="form-control form-control-user"  placeholder="title">
                  </div>

                <div class="form-group">
                  <input type="text" name='content' class="form-control form-control-user"  placeholder="content">
                </div>
                <div class="form-group ">
                    <input type="text" name='writer' class="form-control form-control-user" placeholder="writer">
                </div>
                 
                 <button class="btn btn-primary">Submit</button>
                 
         <hr>
  
                <a href="/board/list" class="btn btn-secondary">
                  Go to List
                </a>
               
              </form>
            
            </div>
        </div>
        <!-- /.container-fluid -->
        
 
 <script>
 
 var flag = '${result}';
 
 if(flag === 'success'){
	 alert("작업이 성공했습니다.");
 }
 
 
 </script>
         
<%@include file="../includes/footer.jsp" %>

