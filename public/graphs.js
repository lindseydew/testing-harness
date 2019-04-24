$(document).ready(function(){
  $.get('/api', function(d) {

    var trace1 = {
      x: d.x,
      y: d.y,
      type: 'scatter',
    };

    var data = [trace1];


    Plotly.newPlot('myDiv', data, {}, {showSendToCloud: false});

  });

});
