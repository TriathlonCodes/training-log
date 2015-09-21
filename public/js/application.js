$(document).ready(function() {

 //not a funtional portion
  $("#create-workout").on("click", getLogForm)
  $(".new_workout").on("submit", "form#newWorkout", logWorkout) //*** UNCOMMENT! ****

});

var setDefault = function(e) {
  e.preventDefault
  // will set the default of a selected list to what has already been selected in a EDIT method
}

var logWorkout = function(e) {
  e.preventDefault()
  console.log("I'm Hit!")
  $('#newWorkout').remove()
  $("#create-workout").show()
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
    $('span#table').load(document.URL + ' table.log')
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
    $(".new_workout").prepend(d)
  });
  form.fail( function(response) {
    console.log("FAILURE")
    console.log(response)
  });
}
