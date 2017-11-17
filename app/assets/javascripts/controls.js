console.log("Hallo");

$(document).ready(function() {
  $('.show_chart').click(function() {
    var device_id=$(this).data('device-id');
    $.get('/devices/'+device_id+'.json', function(data) {
      console.log(data.device_name);
      var chart_data = {};
      
      for (var item of data.audios){
        chart_data[item.created_at]=item.value
      }
      console.log(chart_data)
      window.chart = new Chartkick.LineChart("chart-1",chart_data)


    });
  });
});