+function ($) {

	$('.resetformaction').on('click', function(){
		$('#RegistrationForm_Form').find('input').each(
			$(this).val('')
		);
	});

}(jQuery);