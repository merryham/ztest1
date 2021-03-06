<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp"%>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-4 text-gray-800">List Page</h1>

	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">List</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<table border="1">
					<tr>
						<td>BNO</td>
						<td>TITLE</td>
						<td>WRITER</td>
						<td>REGDATE</td>
					</tr>
					<c:forEach items="${list}" var="vo">
						<tr>
							<td><c:out value="${vo.bno}" /></td>
							<td><a href='/board/read?page=${pm.current}&bno=${vo.bno}'><c:out
										value="${vo.title}" /></a></td>
							<td><c:out value="${vo.writer}" /></td>
							<td><c:out value="${vo.regdate}" /></td>
						</tr>
					</c:forEach>
				</table>



				<ul class="pagination">
				<c:if test="${pm.prev}">
					<li class="page-item"><a class="page-link" href="/board/list?page=${pm.start-1}">Previous</a></li>
				</c:if>	
				
				<c:forEach begin="${pm.start}" end="${pm.end}"  var="idx">
				
					<li class="page-item"><a class="page-link" href="/board/list?page=${idx}">${idx}</a></li>
				</c:forEach>
				
					<c:if test="${pm.next}">
					<li class="page-item"><a class="page-link" href="/board/list?page=${pm.end+1}">Next</a></li>
					</c:if>
				</ul>

			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->


<script>
	var flag = '${result}';

	if (flag === 'success') {
		alert("작업이 성공했습니다.");
	}
</script>


<%@include file="../includes/footer.jsp"%>

</body>
</html>