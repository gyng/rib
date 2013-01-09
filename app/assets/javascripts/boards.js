$(function() {
    var header_height = $(".board-switcher").outerHeight();

    if ($("#board-info").length > 0 && $(".discussion-listing").length > 0) {
        // Set up sticky
        $(window).bind("scroll resize", function(){ fixBoardInfo(header_height); });
    }
});

function fixBoardInfo(header_height) {
    if ($(window).scrollTop() > header_height && $(window).width() >= 768) {
        $("#board-info").addClass("fixed").css("top", "20px");
    } else {
        $("#board-info").removeClass("fixed");
    }
}