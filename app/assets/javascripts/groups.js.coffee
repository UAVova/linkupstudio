jQuery ->
  $(document).on "change", "#groups", (event) ->
    $("#manage_groups").attr("href", "/groups/" + $("#groups").val())