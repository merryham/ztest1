<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@include file="../includes/header.jsp" %>

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-4 text-gray-800">Board Read Page</h1>
          
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">Read</h6>
            </div>
            <div class="card-body">
            	
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
                 
                 <button class="btn btn-primary"><a href="/board/modify?bno=${vo.bno}">Modify/Delete</a></button>
                 
                 <hr>
                <a href="/board/list${cri.getLink() }" class="btn btn-secondary">
                  Go to List
                </a>
              
              </form>
            
            </div>
        </div>
        <!-- /.container-fluid -->
        

         
<%@include file="../includes/footer.jsp" %>

