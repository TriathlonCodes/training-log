$(document).ready(function() {
  // $("#log > tbody > tr").on("click", function() {
  //   $(this).css({
  //     "background-color" : "lightblue"
  //   })
  //   $(this).addClass("selected")
  // })
 //not a funtional portion
  $("#create-workout").on("click", getLogForm)
  // $(".container").on("submit", "#newWorkout", logWorkout) //*** UNCOMMENT! ****
  $(".selected").on("click", function() {
    console.log("this is working")
    $(this).css({
      "background-color" : "white"
    });
    $(this).removeClass("selected")
  })



});

var setDefault = function(e) {
  e.preventDefault
  // will set the default of a selected list to what has already been selected in a EDIT method
}

var logWorkout = function(e) {
  e.preventDefault()
  console.log("I'm Hit!")
  $(this).remove()
  var workoutData = $(this).serializeArray()
  console.log(workoutData)
  var newLogData = $.ajax({
    url: '/workouts',
    method: 'post',
    dataType: 'json',
    data: workoutData
  })
  newLogData.done( function(d){
    console.log(d)
    console.log("Post ajax win!")
    $("#create-workout").show()
  })
}

var getLogForm = function(e) {
  e.preventDefault()
  console.log("HIT ME!")
  $("#create-workout").hide()
  var form = $.ajax({
    url: '/workouts/new',
    method: 'get',
    dataType:'html',
    });
  form.done( function(d){
    $(".container").append(d)
  });
  form.fail( function(response) {
    console.log("FAILURE")
    console.log(response)
  });
}
