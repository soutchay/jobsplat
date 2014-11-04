function app_graph(){
		var dataset = [];
		var numDataSets = 20;
		var xRange = Math.floor(Math.random() * 100);
		var yRange = Math.floor(Math.random() * 100);
		for (var i =0; i < 10; i++){
      // var numberOne = Math.floor(Math.random() * xRange);
      var numberOne = 10+i*5;
      var numberTwo = Math.floor(Math.random() * yRange);
			dataset.push([numberOne, numberTwo]);
		}
		var w = 1000;
		var h = 300;
    var padding = 20;

  // var scale = d3.scale.linear()
  //                   .domain([100, 500])
  //                   .range([10, 350]);
  // scale function for xscale
  		var xScale = d3.scale.linear()
  						.domain([0, d3.max(dataset, function(d){ return d[0];})])
  						.range([0, w]);

  		var yScale = d3.scale.linear()
  						.domain([0, d3.max(dataset, function(d){return d[1];})])
  						.range([0, h]);
  						//range is the highest point
  						//domain is the max number from the array
      var xAxis = d3.svg.axis()
                    .orient('bottom')
                    .ticks(5);
      xAxis.scale(xScale);


      var svg = d3.select('body')
                  .append('svg')
                  .attr('width', w)
                  .attr('height', h);


  		var circles = svg.selectAll("circle")
  						.data(dataset)
  						.enter()
  						.append("circle");
  		circles
          .attr("cx", function(d){
      			return xScale(d[0]);
      		})
  				.attr("cy", function(d){
  					return h;
  				})
          .attr("x", function(d){
            return d[0];
          })
          .attr("y", function(d){
            return d[1];
          })
          .attr("r", function(d){
            return 5;
            // return Math.sqrt(h-d[1]*2);
          })
          .transition()
          .delay(function(d, i){
              return i*400
          })
          .duration(1000)
          .attr("cy", function(d){
            return yScale(d[1]);
          })       
          .attr('fill', 'blue');
}
window.onload=app_graph;