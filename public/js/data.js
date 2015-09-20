
$(document).ready(function() {
//   // $("body").append("Hello World")
  drawChart('/charts/run')
  drawChart('/charts/bike')

})
google.load("visualization", "1", {packages:["corechart"]});
google.setOnLoadCallback(drawChart);
function drawChart(path) {
  $.ajax({
    url: path,
    method: 'get',
    dataType: 'json'
  }).done(function(run_data) {

    var data = google.visualization.arrayToDataTable(
      run_data.key);
    console.log('HIT!' + data)
    var options = {
      title: 'Year in Review',
      hAxis: {title: '2015',  titleTextStyle: {color: '#333'}},
      vAxis: {title: 'Miles', minValue: 0}
    };

    var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  })

}
