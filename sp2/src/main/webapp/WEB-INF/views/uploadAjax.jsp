<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>Upload Ajax Page</h1>
  
<style>

#bigPicture {
  display:flex;
  width: 100vw;
  height: 100vh;
  z-index: 100;
  position: absolute;
  background: blue;
}


</style>  
  
  <div id='bigPicture' class='hide'>
  </div>
  
  <div>
    <input type='file' name='uploadFile' multiple>
  </div>
  <button id='uploadBtn'>Upload</button>
  
  <ul id="uploadResult">
  </ul>
  
  <script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>

  <script>
  $(document).ready(function(){
	  
	  
	  var uploadResult = $("#uploadResult");
	  
	  var bigPicture = $("#bigPicture");
	  
	  bigPicture.hide();
	  
	  uploadResult.on("click", "img", function(e){
		 
		  var originName = $(this).attr("data-origin")
		  
		  bigPicture.html("<img src='/viewImage?file="+originName+"'>" );
		  
		  bigPicture.show(2000);
		  
	  });
	  
	  $("#uploadBtn").click(function(e){
		  
		  var inputFile = $("input[name='uploadFile']")
		  		  
		  var formData = new FormData();
		  
		  var files = inputFile[0].files;
		  
		  for(var i = 0; i < files.length; i++){
			  
			  formData.append("uploadFile", files[i]);
			  
		  }
		  
		  $.ajax({
			url:'/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			dataType: 'json',
			type:'post',
			success: function(result){
				
				for(var i = 0; i < result.length; i++){
					var originName = result[i].uuid+"_"+result[i].fileName;
					var thumbName = "s_" + originName;
					
					uploadResult.append("<li><img data-origin='"+ originName +"' src='/viewImage?file=" + thumbName+"'></li>");
				}//end for
				
			}//end success
			  
		  });//end ajax
		  
		  
	  });//end event
	  
  });
  </script>	  
  
  
</body>
</html>


