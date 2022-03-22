function changeGraph() {
   
   // select box 의 값으로 ajax 요청할 json 생성
   var data = $("#select_data").val()
   var B_CODE = $("#B_NAME").val()
   var S_CODE = $("#S_NAME").val()
   
   var bounds = {
         "DATA": data,
         "B_CODE": B_CODE,
         "S_CODE": S_CODE
   }
   
   var controller = "MaxIncome.do";
   // 요청된 data에 따라 처리할 컨트롤러 지정
   if (data == "pre_income" & S_CODE == "total") {
      controller = "getPreIncome.do"
   } else if (data == "mov_pop") {
      controller = "getMoveIncome.do"
   } else if (data == "total_age") {
      controller = "getTotalChart.do"
   } else if (data == "max_income"){
	  controller = "MaxIncome.do"
   } else if (data == "pre_income") {
      controller = "getIncomeAgeRatio.do"
   }

   $.ajax({
      url : controller,
      type : 'post',
      dataType : 'json',
      contentType : 'application/json',
      data : JSON.stringify(bounds),
      success : function(result) {
         if (data == "max_income"){
         	maxIncomeChart(result)
         } else if (data == "pre_income" & S_CODE == "total") {
            IncomeBarChart(result)
         } else if (data == "mov_pop") {
            movPopChart(result)
         } else if (data == "liv_pop") {
            livPopChart(result)
         } else if (data == "wor_pop") {
            workPopChart(result)
         } else if (data == "total_age") {
        	Total_AgeChart(result)
         } else if (data == "pre_income") {
        	 Move_IncomeChart(result)
         }
      }
   });
}


function IncomeBarChart(data) {

//	Themes begin
	am4core.useTheme(am4themes_animated);
//	Themes end

//	Create chart instance
	var chart = am4core.create("chartdiv", am4charts.XYChart);

//	Add data
	chart.data = data;
	console.log(data);
//	for(var i = 0; i < chart.data.length; i++){
//		data[i].store_MM_income*(data[]
//		
//	}    

//	Create axes
	var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
	categoryAxis.dataFields.category = "s_name";
	categoryAxis.renderer.grid.template.location = 0;

	var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
	valueAxis.renderer.inside = true;
	valueAxis.renderer.labels.template.disabled = true;
	valueAxis.min = 0;
//	Create series	
	function createSeries(field, name) {

		// Set up series
		var series = chart.series.push(new am4charts.ColumnSeries());
		series.name = name;
		series.dataFields.valueY = field;
		series.dataFields.categoryX = "s_name";
		series.sequencedInterpolation = true;

		// Make it stacked
		series.stacked = true;

		// Configure columns
		series.columns.template.width = am4core.percent(60);
		series.columns.template.tooltipText = "[bold]{name}[/]\n[font-size:14px]{categoryX}: {valueY}만원";

		// Add label
		var labelBullet = series.bullets.push(new am4charts.LabelBullet());
		labelBullet.label.text = "{valueY}";
		labelBullet.locationY = 0.5;

		return series;
	}

	createSeries("a10_ratio", "10대");
	createSeries("a20_ratio", "20대");
	createSeries("a30_ratio", "30대");
	createSeries("a40_ratio", "40대");
	createSeries("a50_ratio", "50대");
	createSeries("a60_ratio", "60대");

//	Legend
	chart.legend = new am4charts.Legend();

}

function maxIncomeChart(data) {

	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end

	var chart = am4core.create("chartdiv", am4plugins_timeline.SerpentineChart);
	chart.curveContainer.padding(100, 20, 50, 20);
	chart.levelCount = 3;
	chart.yAxisRadius = am4core.percent(20);
	chart.yAxisInnerRadius = am4core.percent(2);
	chart.maskBullets = false;

	var colorSet = new am4core.ColorSet();

	chart.dateFormatter.inputDateFormat = "HH:mm";
	chart.dateFormatter.dateFormat = "HH";


 	data = JSON.parse(data);
	chart.data = data;
	
	for(var i=0; i < chart.data.length; i++ ){
		chart.data[i].color = colorSet.getIndex(i);
	}

	chart.fontSize = 10;
	chart.tooltipContainer.fontSize = 10;

	var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
	categoryAxis.dataFields.category = "category";
	categoryAxis.renderer.grid.template.disabled = true;
	categoryAxis.renderer.labels.template.paddingRight = 25;
	categoryAxis.renderer.minGridDistance = 10;

	var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
	dateAxis.renderer.minGridDistance = 70;
	dateAxis.baseInterval = { count: 30, timeUnit: "minute" };
	dateAxis.renderer.tooltipLocation = 0;
	dateAxis.renderer.line.strokeDasharray = "1,4";
	dateAxis.renderer.line.strokeOpacity = 0.5;
	dateAxis.tooltip.background.fillOpacity = 0.2;
	dateAxis.tooltip.background.cornerRadius = 5;
	dateAxis.tooltip.label.fill = new am4core.InterfaceColorSet().getFor("alternativeBackground");
	dateAxis.tooltip.label.paddingTop = 7;
	dateAxis.endLocation = 0;
	dateAxis.startLocation = -0.5;

	var labelTemplate = dateAxis.renderer.labels.template;
	labelTemplate.verticalCenter = "middle";
	labelTemplate.fillOpacity = 0.4;
	labelTemplate.background.fill = new am4core.InterfaceColorSet().getFor("background");
	labelTemplate.background.fillOpacity = 1;
	labelTemplate.padding(7, 7, 7, 7);

	var series = chart.series.push(new am4plugins_timeline.CurveColumnSeries());
	series.columns.template.height = am4core.percent(15);

	series.dataFields.openDateX = "start";
	series.dataFields.dateX = "end";
	series.dataFields.categoryY = "category";
	series.baseAxis = categoryAxis;
	series.columns.template.propertyFields.fill = "color"; // get color from data
	series.columns.template.propertyFields.stroke = "color";
	series.columns.template.strokeOpacity = 0;
	series.columns.template.fillOpacity = 0.6;

	var imageBullet1 = series.bullets.push(new am4plugins_bullets.PinBullet());
	imageBullet1.locationX = 1;
	imageBullet1.propertyFields.stroke = "color";
	imageBullet1.background.propertyFields.fill = "color";
	imageBullet1.image = new am4core.Image();
	imageBullet1.image.propertyFields.href = "icon";
	imageBullet1.image.scale = 0.8;
	imageBullet1.circle.radius = am4core.percent(100);
	imageBullet1.dy = -5;


	var textBullet = series.bullets.push(new am4charts.LabelBullet());
	textBullet.label.propertyFields.text = "text";
	textBullet.disabled = true;
	textBullet.propertyFields.disabled = "textDisabled";
	textBullet.label.strokeOpacity = 0;
	textBullet.locationX = 1;
	textBullet.dy = - 100;
	textBullet.label.textAlign = "middle";

	chart.scrollbarX = new am4core.Scrollbar();
	chart.scrollbarX.align = "center"
		chart.scrollbarX.width = am4core.percent(75);
	chart.scrollbarX.opacity = 0.5;

	var cursor = new am4plugins_timeline.CurveCursor();
	chart.cursor = cursor;
	cursor.xAxis = dateAxis;
	cursor.yAxis = categoryAxis;
	cursor.lineY.disabled = true;
	cursor.lineX.strokeDasharray = "1,4";
	cursor.lineX.strokeOpacity = 1;

	dateAxis.renderer.tooltipLocation2 = 0;
	categoryAxis.cursorTooltipEnabled = false;


	var label = chart.createChild(am4core.Label);
	label.text = "시간대별 최고 수익 분야"
		label.isMeasured = false;
	label.y = am4core.percent(10);
	label.x = am4core.percent(50);
	label.horizontalCenter = "middle";
	label.fontSize = 20;

}



function movPopChart(data) {
	
	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end

	// Create chart instance
	var chart = am4core.create("chartdiv", am4charts.XYChart);
	chart.scrollbarX = new am4core.Scrollbar();
	// Add data
	console.log(data);
	data = JSON.parse(data);
	chart.data =data;
	// Create axes
	var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
	categoryAxis.dataFields.category = "time";
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
	series.dataFields.categoryX = "time";
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
	paretoSeries.dataFields.valueY = "mov_pop";
	paretoSeries.dataFields.categoryX = "time";
	paretoSeries.yAxis = paretoValueAxis;
	paretoSeries.tooltipText = "유동인구: {valueY.formatNumber('#')}명[/]";
	paretoSeries.bullets.push(new am4charts.CircleBullet());
	paretoSeries.strokeWidth = 2;

	paretoSeries.stroke = new am4core.InterfaceColorSet().getFor("alternativeBackground");
	paretoSeries.strokeOpacity = 0.5;

	// Cursor
	chart.cursor = new am4charts.XYCursor();
	chart.cursor.behavior = "panX";
	
}

function Total_AgeChart(result){

	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end

	// Create chart instance
	var chart = am4core.create("chartdiv", am4charts.XYChart);
	chart.scrollbarX = new am4core.Scrollbar();
	
	// Add data
	result = JSON.parse(result);
	chart.data = result;

	prepareParetoData();
	
	function prepareParetoData(){
	    for(var i = 0; i < chart.data.length; i++){
	    	chart.data[i].pre_Income=Math.round(chart.data[i].pre_Income/10000);
	    	chart.data[i].mov_pop=Math.round(chart.data[i].mov_pop/100);
	    }

	}
	
	
	// Create axes
	var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
	categoryAxis.dataFields.category = "age";
	categoryAxis.renderer.grid.template.location = 0;
	categoryAxis.renderer.minGridDistance = 60;
	categoryAxis.tooltip.disabled = true;

	var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
	valueAxis.renderer.minWidth = 50;
	valueAxis.min = 0;
	valueAxis.numberFormatter = new am4core.NumberFormatter();
	valueAxis.numberFormatter.numberFormat = "#'만원'"
	valueAxis.cursorTooltipEnabled = false;

	// Create series
	var series = chart.series.push(new am4charts.ColumnSeries());
	series.sequencedInterpolation = true;
	series.dataFields.valueY = "pre_Income";
	series.dataFields.categoryX = "age";
	series.tooltipText = "[{categoryX}: bold]{valueY}만원[/]";
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
	paretoValueAxis.numberFormatter.numberFormat = "#'00명'"
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
	paretoSeries2.tooltipText = "유동인구: {valueY.formatNumber('#')}00명[/]";
	paretoSeries2.bullets.push(new am4charts.CircleBullet());
	paretoSeries2.strokeWidth = 2;
	paretoSeries2.stroke = new am4core.InterfaceColorSet().getFor("alternativeBackground");
//	range.contents.stroke = chart.colors.getIndex(4);
	paretoSeries2.strokeOpacity = 0.5;

	// Cursor
	chart.cursor = new am4charts.XYCursor();
	chart.cursor.behavior = "panX";
	}


function Move_IncomeChart(result){
	
	// Themes begin
	am4core.useTheme(am4themes_animated);
	// Themes end
	console.log(result);
	result = JSON.parse(result);
	var data = result;

	// cointainer to hold both charts
	var container = am4core.create("chartdiv", am4core.Container);
	container.width = am4core.percent(100);
	container.height = am4core.percent(100);
	container.layout = "horizontal";

	container.events.on("maxsizechanged", function () {
	    chart1.zIndex = 0;
	    separatorLine.zIndex = 1;
	    dragText.zIndex = 2;
	    chart2.zIndex = 3;
	})

	var chart1 = container.createChild(am4charts.PieChart);
	chart1 .fontSize = 11;
	chart1.hiddenState.properties.opacity = 0; // this makes initial fade in effect
	chart1.data = data;
	chart1.radius = am4core.percent(70);
	chart1.innerRadius = am4core.percent(40);
	chart1.zIndex = 1;

	var series1 = chart1.series.push(new am4charts.PieSeries());
	series1.dataFields.value = "litres";
	series1.dataFields.category = "age";
	series1.colors.step = 2;
	series1.alignLabels = false;
	series1.labels.template.bent = true;
	series1.labels.template.radius = 3;
	series1.labels.template.padding(0,0,0,0);

	var sliceTemplate1 = series1.slices.template;
	sliceTemplate1.cornerRadius = 5;
	sliceTemplate1.draggable = true;
	sliceTemplate1.inert = true;
	sliceTemplate1.propertyFields.fill = "color";
	sliceTemplate1.propertyFields.fillOpacity = "opacity";
	sliceTemplate1.propertyFields.stroke = "color";
	sliceTemplate1.propertyFields.strokeDasharray = "strokeDasharray";
	sliceTemplate1.strokeWidth = 1;
	sliceTemplate1.strokeOpacity = 1;

	var zIndex = 5;

	sliceTemplate1.events.on("down", function (event) {
	    event.target.toFront();
	    // also put chart to front
	    var series = event.target.dataItem.component;
	    series.chart.zIndex = zIndex++;
	})

	series1.ticks.template.disabled = true;

	sliceTemplate1.states.getKey("active").properties.shiftRadius = 0;

	sliceTemplate1.events.on("dragstop", function (event) {
	    handleDragStop(event);
	})

	// separator line and text
	var separatorLine = container.createChild(am4core.Line);
	separatorLine.x1 = 0;
	separatorLine.y2 = 300;
	separatorLine.strokeWidth = 3;
	separatorLine.stroke = am4core.color("#dadada");
	separatorLine.valign = "middle";
	separatorLine.strokeDasharray = "5,5";


	var dragText = container.createChild(am4core.Label);
	dragText.text = "Drag slices over the line";
	dragText.rotation = 90;
	dragText.valign = "middle";
	dragText.align = "center";
	dragText.paddingBottom = 5;

	// second chart
	var chart2 = container.createChild(am4charts.PieChart);
	chart2.hiddenState.properties.opacity = 0; // this makes initial fade in effect
	chart2 .fontSize = 11;
	chart2.radius = am4core.percent(70);
	chart2.data = data;
	chart2.innerRadius = am4core.percent(40);
	chart2.zIndex = 1;

	var series2 = chart2.series.push(new am4charts.PieSeries());
	series2.dataFields.value = "litres";
	series2.dataFields.category = "age";
	series2.colors.step = 2;

	series2.alignLabels = false;
	series2.labels.template.bent = true;
	series2.labels.template.radius = 3;
	series2.labels.template.padding(0,0,0,0);
	series2.labels.template.propertyFields.disabled = "disabled";

	var sliceTemplate2 = series2.slices.template;
	sliceTemplate2.copyFrom(sliceTemplate1);

	series2.ticks.template.disabled = true;

	function handleDragStop(event) {
	    var targetSlice = event.target;
	    var dataItem1;
	    var dataItem2;
	    var slice1;
	    var slice2;

	    if (series1.slices.indexOf(targetSlice) != -1) {
	        slice1 = targetSlice;
	        slice2 = series2.dataItems.getIndex(targetSlice.dataItem.index).slice;
	    }
	    else if (series2.slices.indexOf(targetSlice) != -1) {
	        slice1 = series1.dataItems.getIndex(targetSlice.dataItem.index).slice;
	        slice2 = targetSlice;
	    }


	    dataItem1 = slice1.dataItem;
	    dataItem2 = slice2.dataItem;

	    var series1Center = am4core.utils.spritePointToSvg({ x: 0, y: 0 }, series1.slicesContainer);
	    var series2Center = am4core.utils.spritePointToSvg({ x: 0, y: 0 }, series2.slicesContainer);

	    var series1CenterConverted = am4core.utils.svgPointToSprite(series1Center, series2.slicesContainer);
	    var series2CenterConverted = am4core.utils.svgPointToSprite(series2Center, series1.slicesContainer);

	    // tooltipY and tooltipY are in the middle of the slice, so we use them to avoid extra calculations
	    var targetSlicePoint = am4core.utils.spritePointToSvg({ x: targetSlice.tooltipX, y: targetSlice.tooltipY }, targetSlice);

	    if (targetSlice == slice1) {
	        if (targetSlicePoint.x > container.pixelWidth / 2) {
	            var value = dataItem1.value;

	            dataItem1.hide();

	            var animation = slice1.animate([{ property: "x", to: series2CenterConverted.x }, { property: "y", to: series2CenterConverted.y }], 400);
	            animation.events.on("animationprogress", function (event) {
	                slice1.hideTooltip();
	            })

	            slice2.x = 0;
	            slice2.y = 0;

	            dataItem2.show();
	        }
	        else {
	            slice1.animate([{ property: "x", to: 0 }, { property: "y", to: 0 }], 400);
	        }
	    }
	    if (targetSlice == slice2) {
	        if (targetSlicePoint.x < container.pixelWidth / 2) {

	            var value = dataItem2.value;

	            dataItem2.hide();

	            var animation = slice2.animate([{ property: "x", to: series1CenterConverted.x }, { property: "y", to: series1CenterConverted.y }], 400);
	            animation.events.on("animationprogress", function (event) {
	                slice2.hideTooltip();
	            })

	            slice1.x = 0;
	            slice1.y = 0;
	            dataItem1.show();
	        }
	        else {
	            slice2.animate([{ property: "x", to: 0 }, { property: "y", to: 0 }], 400);
	        }
	    }

	    toggleDummySlice(series1);
	    toggleDummySlice(series2);

	    series1.hideTooltip();
	    series2.hideTooltip();
	}

	function toggleDummySlice(series) {
	    var show = true;
	    for (var i = 1; i < series.dataItems.length; i++) {
	        var dataItem = series.dataItems.getIndex(i);
	        if (dataItem.slice.visible && !dataItem.slice.isHiding) {
	            show = false;
	        }
	    }

	    var dummySlice = series.dataItems.getIndex(0);
	    if (show) {
	        dummySlice.show();
	    }
	    else {
	        dummySlice.hide();
	    }
	}

	series2.events.on("datavalidated", function () {

	    var dummyDataItem = series2.dataItems.getIndex(0);
	    dummyDataItem.show(0);
	    dummyDataItem.slice.draggable = false;
	    dummyDataItem.slice.tooltipText = undefined;

	    for (var i = 1; i < series2.dataItems.length; i++) {
	        series2.dataItems.getIndex(i).hide(0);
	    }
	})

	series1.events.on("datavalidated", function () {
	    var dummyDataItem = series1.dataItems.getIndex(0);
	    dummyDataItem.hide(0);
	    dummyDataItem.slice.draggable = false;
	    dummyDataItem.slice.tooltipText = undefined;
	}
	)
}