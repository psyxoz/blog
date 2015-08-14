$(document).ready ->
  $("#new_comment").on("ajax:success", (e, data) ->
    $('#comment_content').val('')
    $("#comments").prepend('<div>' + data.content + '</div>')
  ).on "ajax:error", (e, xhr) ->
    alert(xhr.responseJSON.errors)