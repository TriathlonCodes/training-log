
$(document).ready(function() {
//   // $("body").append("Hello World")
  drawChart('/charts/run', 'Run', 'Miles')
  // drawChart('/charts/bike', 'Bike', 'Miles')
  // drawChart('/charts/swim', 'Swim', 'Meters')

})
google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart);
function drawChart(path, title, units) {
  $.ajax({
    url: path,
    // method: 'get',
    dataType: 'json'
  }).done(function(workout_data) {

    var data = google.visualization.arrayToDataTable(
      workout_data.key);
    console.log('HIT!' + data)
    var options = {
      title: title,
      hAxis: {title: '2015',  titleTextStyle: {color: '#333'}},
      vAxis: {title: units, minValue: 0}
    };

    var chart = new google.visualization.AreaChart($("#chart_div")[0]);
    chart.draw(data, options);
  })

}
