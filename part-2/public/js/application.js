$(document).ready(function (event) {
  $('#new_post_link').on("click", newPostClicked);
});

var newPostClicked = function (event) {
  event.preventDefault();
  $(this).hide();
  var request = $.get('/posts/new');
  request.done(newPostResponse);
};

var newPostResponse = function (response) {
  $('.sidebar.right').append(response);
  $('#post_form').on("submit", addPostSubmitted);
};

var addPostSubmitted = function(event) {
  event.preventDefault();
  form = $('#post_form');
  var request = $.ajax({
    type: form.attr('method'),
    url:  form.attr('action'),
    data: form.serialize()
  });
  request.done(addPostResponse);
};

var addPostResponse = function (response) {
  $('#posts').prepend(response);
  $('#post_form').remove();
  $('#new_post_link').show();
};