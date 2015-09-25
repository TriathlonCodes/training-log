
$(document).ready(function() {
  // drawChart('/charts/last_year/run', 'Run', 'Miles')
  // drawChart('/charts/last_year/bike', 'Bike','Miles')
  // drawChart('/charts/last_year/swim', 'Swim','Meters')
  $("#select_charts_form").change(getCharts)

})

var getCharts = function(e) {
  e.preventDefault()
  var path = $(this).attr("action")
  var method = $(this).attr("method")
  var data= $(this).serialize()
  $.ajax({
    url: path,
    method: method,
    data: data,
    dataType: 'text'
  }).done(function(d) {
    var url = d
    $('.chart_div').show()
    drawChart(url + '/run', "Run", "Miles")
    drawChart(url + '/bike', "Bike", "Miles")
    drawChart(url + '/swim', "Swim", "Meters")
  })

}

google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart);
function drawChart(path, title, units) {
  console.log(path)
  $.ajax({
    url: path,
    dataType: 'json'
  }).done(function(workout_data) {
    console.log(workout_data.workout)
    var data = google.visualization.arrayToDataTable(
      workout_data.workout);

    console.log('HIT!' + data)
    var options = {
      title: title,
      hAxis: {
              titleTextStyle: {color: '#333'},
              units: {
                pattern: {format: ['M']}
              }
            },
      vAxis: {title: units, minValue: 0}
    };

    var chart = new google.visualization.AreaChart($("#" + title)[0]);
    chart.draw(data, options);
  })

}
