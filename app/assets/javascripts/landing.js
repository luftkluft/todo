$(document).ready(function () {
  $.ajax({
    type: "GET",
    url: '/lists',
    success: function (data) {
      $(".lists").html(data)
    }
  })
});
