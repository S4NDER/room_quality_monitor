console.log("Hallo");

$(document).ready(function() {
  $('.show_chart').click(function() {
    var device_id=$(this).data('device-id');
    $.get('/devices/'+device_id+'.json', function(data) {
      var chart_data = {};
      
      for (var item of data.audios){
        chart_data[item.created_at]=item.value
      }
      window.chart = new Chartkick.LineChart("chart-1",chart_data)
    });
  });
});