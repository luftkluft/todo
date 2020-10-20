$(document).ready(function () {
  var str1 = $('#nav_status').text();
  str1 = str1.split(' ').join('');
  var str2 = $('#nav_lists').text();
  str2 = str2.split(' ').join('');
  var str3 = $('#nav_tasks').text();
  str3 = str3.split(' ').join('');

  $.ajax({
    cache: false,
    url: "/sorting",
    type: 'GET',
    data: 'status=' + str1 + ';lists=' + str2 + ';tasks=' + str3,
    dataType: 'html',

    success: function (data) {
      $(".lists").html(data);
    }

  });
  return false;
});
