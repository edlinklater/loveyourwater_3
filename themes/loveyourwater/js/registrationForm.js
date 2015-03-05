(function($) {

	$('.resetformaction').on('click', function(e){
        e.preventDefault();

        var button = $(this),
            form = button.parents('form');

        form
            .find('input')
            .filter('[type!=reset]')
            .filter('[type!=submit]')
            .val('');

        form
            .find('.message.validation')
            .hide();

        return false;
	});

})(jQuery);
