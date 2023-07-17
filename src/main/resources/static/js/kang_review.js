$(document).ready(function(){	
	if($("#count").val() == 0 ) {
		return false;
	}
	else {
		$('html, body').animate({
			scrollTop: $('#filter_lo').offset().top
		}, 'slow');
	}
});