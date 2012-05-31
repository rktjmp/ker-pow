$(document).ready(function(){
	$("a.show-help").on('click', function(){
		$('section#help').fadeIn();
		$(this).remove();//css({'opacity' : '1.0'});
	});
});