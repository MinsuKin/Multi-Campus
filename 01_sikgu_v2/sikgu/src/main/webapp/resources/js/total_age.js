
$(document).ready(function() {
	$("#btn").on("click", function(){
		console.log("ok")
		changeGraph()
	})
})


function changeGraph() {

	   bounds = {
		         "B_CODE": 1001085,
		         "S_CODE": 'CS100001'
 }
		   

	$.ajax({
		url : 'getTotalChart.do',
		type : 'post',
		dataType : 'json',
		contentType : 'application/json',
		data : JSON.stringify(bounds),
		success : function(result) {
			Total_AgeChart(result)
		}
	});
}

function Total_AgeChart(result){

	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end

	// Create chart instance
	var chart = am4core.create("chartdiv", am4charts.XYChart);
	chart.scrollbarX = new am4core.Scrollbar();
	// Add data

	var data = JSON.parse(result);
	chart.data = data;
	console.log(data)

	// Create axes
	var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
	categoryAxis.dataFields.category = "age";
	categoryAxis.renderer.grid.template.location = 0;
	categoryAxis.renderer.minGridDistance = 60;
	categoryAxis.tooltip.disabled = true;

	var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
	valueAxis.renderer.minWidth = 50;
	valueAxis.min = 0;
	valueAxis.cursorTooltipEnabled = false;

	// Create series
	var series = chart.series.push(new am4charts.ColumnSeries());
	series.sequencedInterpolation = true;
	series.dataFields.valueY = "pre_Income";
	series.dataFields.categoryX = "age";
	series.tooltipText = "[{categoryX}: bold]{valueY}원[/]";
	series.columns.template.strokeWidth = 0;

	series.tooltip.pointerOrientation = "vertical";

	series.columns.template.column.cornerRadiusTopLeft = 10;
	series.columns.template.column.cornerRadiusTopRight = 10;
	series.columns.template.column.fillOpacity = 0.8;

	// on hover, make corner radiuses bigger
	var hoverState = series.columns.template.column.states.create("hover");
	hoverState.properties.cornerRadiusTopLeft = 0;
	hoverState.properties.cornerRadiusTopRight = 0;
	hoverState.properties.fillOpacity = 1;

	series.columns.template.adapter.add("fill", function(fill, target) {
	  return chart.colors.getIndex(target.dataItem.index);
	})


	var paretoValueAxis = chart.yAxes.push(new am4charts.ValueAxis());
	paretoValueAxis.renderer.opposite = true;
	paretoValueAxis.min = 0;
	paretoValueAxis.strictMinMax = true;
	paretoValueAxis.renderer.grid.template.disabled = true;
	paretoValueAxis.numberFormatter = new am4core.NumberFormatter();
	paretoValueAxis.numberFormatter.numberFormat = "#'명'"
	paretoValueAxis.cursorTooltipEnabled = false;

	var paretoSeries = chart.series.push(new am4charts.LineSeries())
	paretoSeries.dataFields.valueY = "work_pop";
	paretoSeries.dataFields.categoryX = "age";
	paretoSeries.yAxis = paretoValueAxis;
	paretoSeries.tooltipText = "직장인구: {valueY.formatNumber('#')}명[/]";
//	paretoSeries.bullets.push(new am4charts.CircleBullet());
	var bullet = paretoSeries.bullets.push(new am4charts.Bullet());
	var image = bullet.createChild(am4core.Image);
	var image = bullet.createChild(am4core.Image);
	image.href = "https://www.amcharts.com/lib/images/star.svg";
	image.width = 30;
	image.height = 30;
	image.horizontalCenter = "middle";
	image.verticalCenter = "middle";	
	paretoSeries.strokeWidth = 2;
	paretoSeries.stroke = new am4core.InterfaceColorSet().getFor("alternativeBackground");
	paretoSeries.strokeOpacity = 0.5;

	var paretoSeries2 = chart.series.push(new am4charts.LineSeries())
	paretoSeries2.dataFields.valueY = "mov_pop";
	paretoSeries2.dataFields.categoryX = "age";
	paretoSeries2.yAxis = paretoValueAxis;
	paretoSeries2.tooltipText = "유동인구: {valueY.formatNumber('#')}명[/]";
	paretoSeries2.bullets.push(new am4charts.CircleBullet());
	paretoSeries2.strokeWidth = 2;
	paretoSeries2.stroke = new am4core.InterfaceColorSet().getFor("alternativeBackground");
//	range.contents.stroke = chart.colors.getIndex(4);
	paretoSeries2.strokeOpacity = 0.5;

	// Cursor
	chart.cursor = new am4charts.XYCursor();
	chart.cursor.behavior = "panX";
}
