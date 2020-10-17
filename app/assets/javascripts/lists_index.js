$('#add_list').on('click', function () {
  $.ajax({

    type: "GET",
    url: "/lists/new",
    dataType: 'html',

    success: function (data) {
      $(".lists").html(data);
    }

  })
  return false;
});

function editList(id) {
  $.ajax({

    type: "GET",
    url: "/lists/" + id + "/edit",
    dataType: 'html',

    success: function (data) {
      $(".lists").html(data);
    }

  })
}

function addTask(id) {
  var taskText = document.getElementById(id);
  //alert(taskText.value);
  $.ajax({

    type: "GET",
    url: "/tasks/new/?id=" + id,
    dataType: 'html',

    success: function (data) {
      $(".lists").html(data);
      var textArea = document.getElementById('task_content_task');
      textArea.value = taskText.value;
    }

  })
}

function editTask(id) {
  //alert(id);
  $.ajax({

    type: "GET",
    url: "/tasks/" + id + "/edit",
    dataType: 'html',

    success: function (data) {
      $(".lists").html(data);
    }

  })
}