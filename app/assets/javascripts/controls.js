$(document).ready(function() {
  $('.modal').modal();

  $('.show_chart').click(function() {
    var device_id=$(this).data('device-id');
    var device_type=$(this).data('device-type');
    $.get('/devices/'+device_id+'.json', function(data) {
      var ytitle;
      var chart_data = {}; 
      var device_name = data.device_name;

      if (device_type == "audio"){
        ytitle= "Audio (dB)";
        for (var item of data.audios){
          chart_data[item.created_at]=item.value
        }
      }

      else if (device_type == "temperature"){
        ytitle= "Temperature (°C)";
        for (var item of data.temperatures){
          chart_data[item.created_at]=item.value
        }
      }

      else if (device_type == "humidity"){
        ytitle= "Humidity (%)";
        for (var item of data.humidities){
          chart_data[item.created_at]=item.value
        }
      }

      else if (device_type == "luminosity"){
        ytitle= "Luminosity (cd)";
        for (var item of data.luminosities){
          chart_data[item.created_at]=item.value
        }
      }
      
      document.getElementById("device_name").innerHTML = device_name;
      window.chart = new Chartkick.LineChart("chart-1",chart_data, {xtitle: "Time", ytitle: ytitle})
    });
  });
  
});