(function($) {
    helper.resizeGoogleSlide($('.learn-slide iframe'));

    $(window).on('resize', function(e) {
        helper.resizeGoogleSlide($('.learn-slide iframe'));
    });

})(jQuery);
