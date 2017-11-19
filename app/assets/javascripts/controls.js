$(document).on('turbolinks:load', function() {
  $('.modal').modal();

  $('.show_chart').click(function() {
    var device_id=$(this).data('device-id');
    var device_type=$(this).data('device-type');
    $.get('/devices/'+device_id+'.json', function(data) {
      var ytitle;
      var chart_data = {};
      var data_1h = {};
      var device_name = data.device_name;

      switch(device_type) {
        case "audio":
          ytitle= "Audio (dB)";
          data_1h = get_value_by_hour_limit(data.audios);   
          break;

        case "temperature":
          ytitle= "Temperature (°C)";
          data_1h = get_value_by_hour_limit(data.temperatures);
          break;
        
        case "humidity":
          ytitle= "Humidity (%)";
          data_1h = get_value_by_hour_limit(data.humidities);
          break;
        
        case "luminosity":
          ytitle= "Luminosity (cd)";
          data_1h = get_value_by_hour_limit(data.luminosities);
          break;

        default:
          console.log("Button ???");
      }
      console.log("Showing them graphs :P");  

      try {
        for (var item of data_1h){
          chart_data[item.created_at]=item.value;
        }
      }
      catch(err) {
           console.log("Error on transforming data chart");
        }
      
        
      document.getElementById("device_name").innerHTML = device_name;
      window.chart = new Chartkick.LineChart("chart-1",chart_data, {xtitle: "Time", ytitle: ytitle});
    });
  });
  
});


function get_value_by_hour_limit(data){
  var current_time = (new Date()).getTime();
  var time_1hour_ago = current_time-3600000;
  var temp_time = time_1hour_ago
  var j = 0;
  var temp=[];


  for(var i = data.length-1; temp_time >= time_1hour_ago; i--){    
    temp[j]=data[i];
    var d = new Date(data[i].created_at);
    temp_time = d.getTime()
    j++;
  }
  return temp.slice(0, -1);
}
