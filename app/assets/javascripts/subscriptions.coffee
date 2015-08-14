$(document).ready ->
  $("#new_subscription").on("ajax:success", () ->
    $('#subscription_modal').modal('hide')
  ).on "ajax:error", (e, xhr) ->
    alert(xhr.responseJSON.errors)