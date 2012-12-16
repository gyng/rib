$(function() {
    if ($("#discussion-info").length > 0 && $(".post").length > 0) {
        var poll_interval = $("#discussion-info").attr("data-poll-interval");
        var poll_attempts = 0;
        var poll_increment = 1500;
        var max_increments = 75; // Max is around 30 minutes

        // Set initial update timer
        $("#discussion-info-updating-in-seconds").html(poll_interval/1000);
        setTimeout(function() { updatePosts(poll_interval, poll_attempts, poll_increment, max_increments); }, poll_interval);
        setInterval(function() { updateTimer((poll_interval + poll_attempts * poll_increment)/1000); }, 1000);
    }
});

function updatePosts(poll_interval, poll_attempts, poll_increment, max_increments) {
    discussion_id = $("#discussion-info").attr("data-discussion-id");
    after = $(".post").last().attr("data-post-id");
    $.getScript("/posts/poll.js?discussion_id=" + discussion_id + "&after=" + after);

    if (after == $(".post").last().attr("data-post-id")) {
        // No new posts, increase poll interval
        poll_attempts = Math.min(poll_attempts++, max_increments);
    } else {
        poll_attempts = 0;
    }

    $("#discussion-info-updating-in-seconds").html((poll_interval + poll_attempts * poll_increment)/1000);

    alert(poll_interval + poll_attempts * poll_increment);

    setTimeout(function() { updatePosts(poll_interval, poll_attempts, poll_increment, max_increments); }, poll_interval + poll_attempts * poll_increment);
}

function updateTimer(poll_interval) {
    $('#discussion-info-updating-in-seconds').each( function() {
        $(this).html(parseInt($(this).html(), 10) - 1);
    });
}