var canvas = d3.select("canvas"),
    context = canvas.node().getContext("2d"),
    width = canvas.property("width"),
    height = canvas.property("height");

var colors = d3.range(360)
    .map((function() {
      var color = d3.scale.cubehelix()
        .domain([0, 180, 360])
        .range([
          d3.hsl(-100, 0.75, 0.35),
          d3.hsl(  80, 1.50, 0.80),
          d3.hsl( 260, 0.75, 0.35)
        ]);
      return function(i) {
        return d3.rgb(color(i));
      };
    })());

var worker = new Worker("generate-prims.js");
worker.postMessage({width: width, height: height});
worker.addEventListener("message", function(event) {
  worker.terminate();

  var N = 1 << 0,
      S = 1 << 1,
      W = 1 << 2,
      E = 1 << 3;

  var d = 0,
      n = width * height,
      cells = event.data,
      distance = new Array(n),
      frontier = [(height - 1) * width],
      image = context.createImageData(width, height),
      imageData = image.data;

  distance[frontier[0]] = 0;

  for (var i = 0, c, i4 = 3; i < n; ++i, i4 += 4) {
    imageData[i4] = 255;
  }

  while (frontier.length) {
    var frontier1 = [],
        i0,
        n0 = frontier.length,
        i1;

    ++d;
    for (var i = 0; i < n0; ++i) {
      i0 = frontier[i];
      if (cells[i0] & E && distance[i1 = i0 + 1] == null) distance[i1] = d, frontier1.push(i1);
      if (cells[i0] & W && distance[i1 = i0 - 1] == null) distance[i1] = d, frontier1.push(i1);
      if (cells[i0] & S && distance[i1 = i0 + width] == null) distance[i1] = d, frontier1.push(i1);
      if (cells[i0] & N && distance[i1 = i0 - width] == null) distance[i1] = d, frontier1.push(i1);
    }

    frontier = frontier1;
  }

  d3.timer(function(elapsed) {
    for (var i = 0, c, r = Math.floor(elapsed / 20), i4 = 0; i < n; ++i, i4 += 4) {
      c = colors[(c = (distance[i] - r) % 360) < 0 ? c + 360 : c];
      imageData[i4] = c.r;
      imageData[i4 + 1] = c.g;
      imageData[i4 + 2] = c.b;
    }
    context.putImageData(image, 0, 0);
  });
});
