function last(arr) {
  d1 = new Date()
  arr[arr.length - 1]
  d2 = new Date()
  return d2 - d1
}

function sort(arr) {
  d1 = new Date()
  arr.sort()
  d2 = new Date()
  return d2 - d1
}

xarr = []
yarr = []

for(var i=50000; i < 1000000; i = i + 50000) {
  array_size = i;
  arr = []
  for(var j=0; j < array_size; j++) {
    arr.push(Math.floor(Math.random() * 2000))
  }
  xarr.push(array_size)
  time = sort(arr)
  yarr.push(time)
}

var trace1 = {
  x: xarr,
  y: yarr,
  type: 'scatter',
};

// var trace2 = {
//   x: [1, 2, 3, 4],
//   y: [16, 5, 11, 9],
//   type: 'scatter'
// };

var data = [trace1];

Plotly.newPlot('myDiv', data, {}, {showSendToCloud: true});
