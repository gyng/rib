$(function() {
    if ($("#discussion-info").length > 0 && $(".post").length > 0) {
        var poll_interval = $("#discussion-info").attr("data-poll-interval");
        setInterval(function() { updatePosts(poll_interval/1000); }, poll_interval);
        setInterval(function() { updateTimer(poll_interval/1000); }, 1000);
    }
});

function updatePosts(poll_interval) {
    discussion_id = $("#discussion-info").attr("data-discussion-id");
    after = $(".post").last().attr("data-post-id");
    $.getScript("/posts/poll.js?discussion_id=" + discussion_id + "&after=" + after);
    $("#discussion-info-updating-in-seconds").html(poll_interval/1000);
}

 // Function to update counters on all elements with class counter
function updateTimer(poll_interval) {
    $('#discussion-info-updating-in-seconds').each( function() {
        var count = parseInt($(this).html(), 10);
        if (count > 0) {
            $(this).html(count - 1);
        } else {
            $(this).html(poll_interval);
        }
    });
}
