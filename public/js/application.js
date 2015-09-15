$(document).ready(function() {
  $("#full_log > tbody > tr").on("click", function() {
    $(this).css({
      "background-color" : "lightblue"

    })
    $(this).addClass("selected")
  })
 //not a funtional portion
  $(".selected").on("click", function() {
    console.log("this is working")
    $(this).css({
      "background-color" : "white"
    });
    $(this).removeClass("selected")
  })



});
