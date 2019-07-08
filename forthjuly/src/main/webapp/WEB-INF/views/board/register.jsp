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
              
</body>
</html>