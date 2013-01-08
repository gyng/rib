$(function() {
    if ($("#board-info").length > 0 && $(".discussion-listing").length > 0) {
        // Set up sticky
        var header_height = $(".board-switcher").outerHeight();

        $(window).scroll(function() {
            if ($(window).scrollTop()> header_height) {
                $("#board-info").addClass("fixed").css("top", "20px");
            } else {
                $("#board-info").removeClass("fixed").next();
            }
        });
    }
});