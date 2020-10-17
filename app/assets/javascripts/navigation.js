function searchNav() {

  var str1 = $('#nav_status').text();
  str1 = str1.split(' ').join('');
  var str2 = $('#nav_lists').text();
  str2 = str2.split(' ').join('');
  var str3 = $('#nav_tasks').text();
  str3 = str3.split(' ').join('');

  //alert('status='+str1+'lists='+str2+'tasks='+str3);

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

}

// status
$('#nav_status_all').on('click', function () {
  var str = $(this).text();
  $('#nav_status').html(str)
  return false;
});

$('#nav_status_new').on('click', function () {
  var str = $(this).text();
  $('#nav_status').html(str)
  return false;
});

$('#nav_status_in_work').on('click', function () {
  var str = $(this).text();
  $('#nav_status').html(str)
  return false;
});

$('#nav_status_deferred').on('click', function () {
  var str = $(this).text();
  $('#nav_status').html(str)
  return false;
});

$('#nav_status_completed').on('click', function () {
  var str = $(this).text();
  $('#nav_status').html(str)
  return false;
});
// end status

// lists
$('#nav_lists_new_on_top').on('click', function () {
  var str = $(this).text();
  $('#nav_lists').html(str)
  return false;
});

$('#nav_lists_old_on_top').on('click', function () {
  var str = $(this).text();
  $('#nav_lists').html(str)
  return false;
});

$('#nav_lists_by_priority').on('click', function () {
  var str = $(this).text();
  $('#nav_lists').html(str)
  return false;
});

$('#nav_lists_by_name').on('click', function () {
  var str = $(this).text();
  $('#nav_lists').html(str)
  return false;
});

$('#nav_lists_by_deadline').on('click', function () {
  var str = $(this).text();
  $('#nav_lists').html(str)
  return false;
});
// end lists

// tasks
$('#nav_tasks_new_on_top').on('click', function () {
  var str = $(this).text();
  $('#nav_tasks').html(str)
  return false;
});

$('#nav_tasks_old_on_top').on('click', function () {
  var str = $(this).text();
  $('#nav_tasks').html(str)
  return false;
});

$('#nav_tasks_by_priority').on('click', function () {
  var str = $(this).text();
  $('#nav_tasks').html(str)
  return false;
});

$('#nav_tasks_by_name').on('click', function () {
  var str = $(this).text();
  $('#nav_tasks').html(str)
  return false;
});

$('#nav_tasks_by_deadline').on('click', function () {
  var str = $(this).text();
  $('#nav_tasks').html(str)
  return false;
});
  // end tasks