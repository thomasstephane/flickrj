$(document).ready(function() {

  $('input[value="Sign in!"]').on('click', function(e) {
    e.preventDefault();
    $.ajax({
      type: 'post',
      url: '/signin',
      data: $(this).serialize()
    }).done(function(data) {
      console.log(data);
    });
  });

  $('input[value="Join Us!"]').on('click', function(e) {
    e.preventDefault();
    $.ajax({
      type: 'post',
      url: '/signup',
      data: $(this).serialize()
    }).done(function(data) {
      console.log(data);
    });
  });
});
