# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(".post-content").live('click', (e) ->
    e.preventDefault();
    $(this).toggleClass('unexpanded');
    a = $(this).children('a');
    src = a.attr('href');
    a.children('img').attr('src', src);
);
