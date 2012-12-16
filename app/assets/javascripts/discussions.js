$(function() {
    if ($("#discussion-info").length > 0 && $(".post").length > 0) {
        var poll_interval = parseInt($("#discussion-info").attr("data-poll-interval"), 10);
        var poll_attempts = 0;
        var poll_increment = 15000;
        var max_increments = 75; // Max is around 30 minutes

        // Set initial update timer
        $("#discussion-info-updating-in-seconds").html(poll_interval/1000);
        setTimeout(function() { updatePosts(poll_interval, poll_attempts, poll_increment, max_increments); }, poll_interval);
        setInterval(updateTimer, 1000);
    }
});

function updatePosts(poll_interval, poll_attempts, poll_increment, max_increments) {
    discussion_id = $("#discussion-info").attr("data-discussion-id");
    after = $(".post").last().attr("data-post-id");
    $.getScript("/posts/poll.js?discussion_id=" + discussion_id + "&after=" + after);

    setTimeout(function() {
        if (after == $(".post").last().attr("data-post-id")) {
            // No new posts, increase poll interval
            poll_attempts = Math.min(poll_attempts + 1, max_increments);
        } else {
            poll_attempts = 0;
        }
    }, 1000);

    $("#discussion-info-updating-in-seconds").html((poll_interval + (poll_attempts * poll_increment))/1000);
    setTimeout(function() { updatePosts(poll_interval, poll_attempts, poll_increment, max_increments); }, poll_interval + (poll_attempts * poll_increment));
}

function updateTimer() {
    $('#discussion-info-updating-in-seconds').each( function() {
        $(this).html(parseInt($(this).html(), 10) - 1);
    });
}