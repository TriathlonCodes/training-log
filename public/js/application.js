$(document).ready(function() {
  $("#full_log > tbody > tr").on("click", function() {
    $(this).css({
      "background-color" : "lightblue"

    })
    $(this).addClass("selected")
  })



});
