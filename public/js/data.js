
$(document).ready(function() {
  drawChart('/charts/last_year/run', 'Run', 'Miles')
  drawChart('/charts/last_year/bike', 'Bike','Miles')
  drawChart('/charts/last_year/swim', 'Swim','Meters')
  $("#select_chart_form").submit()n

})
google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart);
function drawChart(path, title, units) {
  console.log(path)
  $.ajax({
    url: path,
    // method: 'get',
    dataType: 'json'
  }).done(function(workout_data) {
    console.log(workout_data.workout)
    var data = google.visualization.arrayToDataTable(
      workout_data.workout);

    console.log('HIT!' + data)
    var options = {
      title: title,
      hAxis: {title: 'Date',
              titleTextStyle: {color: '#333'},
              units: {
                months: {format: ['MM']}
              }
            },
      vAxis: {title: units, minValue: 0}
    };

    var chart = new google.visualization.AreaChart($("#" + title)[0]);
    chart.draw(data, options);
  })

}
