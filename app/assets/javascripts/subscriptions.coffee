$(document).ready ->
  $("#new_subscription").on("ajax:success", () ->
    $("#subscription_email").val('')
    $('#subscription_modal').modal('hide')
    alert('Thanks!')
  ).on "ajax:error", (e, xhr) ->
    alert(xhr.responseJSON.errors)