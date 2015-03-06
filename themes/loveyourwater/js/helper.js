window.helper = {

    /**
     * Resize Google slide proportionately
     *
     * Provided:
     *  1. css styled width is 100%
     *  2. the element has attribute width and height
     */
    resizeGoogleSlide: function($el) {
        var attrWidth = 0,
            attrHeight = 0,
            width = 0,
            newHeight = 0,
            controllerHeight = 29;
            newOldWidthRatio = 0;

        if($el.length > 0) {
            attrWidth = $el.attr('width'),
            attrHeight = $el.attr('height'),
            width = $el.width(),
            newOldWidthRatio = width / attrWidth;

            newHeight = ((attrHeight - controllerHeight) * newOldWidthRatio) + controllerHeight;

            $el.height( newHeight );
        }
    }

};
