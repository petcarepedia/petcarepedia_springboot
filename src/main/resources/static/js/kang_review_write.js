$(document).ready(function(){

	
	
	
	let fileTarget = $('.filebox .upload-hidden');

  	fileTarget.on('change', function(){  // 값이 변경되면
  		let filename = '';
	    if(window.FileReader){  // modern browser
	      filename = $(this)[0].files[0].name;
	    } 
	    else {  // old IE
	      filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
	    }
	    
	    // 추출한 파일명 삽입
	    $(this).siblings('.upload-name').val(filename);
  	});
	
	
	
	$("#DeleteFile").click(function() {
		$("#file1").value("");
		
	});
	
}); //ready