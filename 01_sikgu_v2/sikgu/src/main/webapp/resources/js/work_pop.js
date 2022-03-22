/**
 * ---------------------------------------
 * This demo was created using amCharts 4.
 * 
 * For more information visit:
 * https://www.amcharts.com/
 * 
 * Documentation is available at:
 * https://www.amcharts.com/docs/v4/
 * ---------------------------------------
 */

// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

/**
 * Create container for charts
 */
var container = am4core.create("chartdiv", am4core.Container);
container.width = am4core.percent(100);
container.height = am4core.percent(100);
container.layout = "horizontal";

/**
 * Population pyramid chart
 */

var pyramidChart = container.createChild(am4charts.XYChart);

pyramidChart.cursor = new am4charts.XYCursor();
pyramidChart.cursor.behavior = "none";
//pyramidChart.arrangeTooltips = false;
pyramidChart.numberFormatter.numberFormat = "#,###.#a";
pyramidChart.numberFormatter.bigNumberPrefixes = [
  { "number": 1e+3, "suffix": "M" }
];

pyramidChart.dataSource.url = "resources/js/un_population_age_groups.csv";
pyramidChart.dataSource.parser = new am4core.CSVParser();
pyramidChart.dataSource.parser.options.numberFields = ["col5", "col6", "col7"];
pyramidChart.dataSource.events.on("parseended", function(ev) {
  sourceData = ev.target.data;
  ev.target.data = getCurrentData();
});
function getCurrentData() {
  var currentData = [];
  am4core.array.each(sourceData, function(row, i) {
//    if (row.col3 == currentYear) {
      currentData.push(row);
//    }
  });
  currentData.sort(function(a, b) {
    var a1 = Number(a.col4.replace(/[^0-9]+.*$/, ""));
    var b1 = Number(b.col4.replace(/[^0-9]+.*$/, ""));
    if (a1 > b1) {
      return 1;
    }
    else if (a1 < b1) {
      return -1;
    }
    return 0;
  });
  return currentData;
}

function updateData() {
  var data = getCurrentData();
  if (data.length == 0) {
    return;
  }
  am4core.array.each(pyramidChart.data, function(row, i) {
    if (!data[i]) {
      pyramidChart.data[i].col5 = 0;
      pyramidChart.data[i].col6 = 0;
    }
    else {
      pyramidChart.data[i].col5 = data[i].col5;
      pyramidChart.data[i].col6 = data[i].col6;
    }
  });
  pyramidChart.invalidateRawData();
  
  // Set title
  pyramidChart.titles.getIndex(0).text = currentYear;
}

// An adapter which filters data for the current year
//var currentYear = new Date().getFullYear().toString();
var currentYear='gangnam';
var sourceData = [];

var pyramidXAxisMale = pyramidChart.xAxes.push(new am4charts.ValueAxis());
pyramidXAxisMale.min = 0;
pyramidXAxisMale.max = 20000;
pyramidXAxisMale.strictMinMax = true;

var maleRange = pyramidXAxisMale.axisRanges.create();
maleRange.value = 0;
maleRange.endValue = 20000;
maleRange.label.text = "Males";
maleRange.label.inside = true;
maleRange.label.valign = "top";
maleRange.label.fontSize = 20;
maleRange.label.fill = pyramidChart.colors.getIndex(0);

var pyramidXAxisFemale = pyramidChart.xAxes.push(new am4charts.ValueAxis());
pyramidXAxisFemale.min = 0;
pyramidXAxisFemale.max = 20000;
pyramidXAxisFemale.renderer.inversed = true;
pyramidXAxisFemale.strictMinMax = true;

var maleRange = pyramidXAxisFemale.axisRanges.create();
maleRange.value = 0;
maleRange.endValue = 20000;
maleRange.label.text = "Females";
maleRange.label.inside = true;
maleRange.label.valign = "top";
maleRange.label.fontSize = 20;
maleRange.label.fill = pyramidChart.colors.getIndex(1);

pyramidChart.bottomAxesContainer.layout = "horizontal";

var pyramidYAxis = pyramidChart.yAxes.push(new am4charts.CategoryAxis());
pyramidYAxis.dataFields.category = "col4";
pyramidYAxis.renderer.minGridDistance = 10;
pyramidYAxis.renderer.grid.template.location = 0;
pyramidYAxis.renderer.inside = true;
pyramidYAxis.title.text = "Age groups";
//pyramidYAxis.renderer.labels.template.adapter.add("textOutput", function(text, target) {
//  if (text == "80-84") {
//    text += "*";
//  }
//  return text;
//});

var pyramidSeriesMale = pyramidChart.series.push(new am4charts.ColumnSeries());
pyramidSeriesMale.dataFields.categoryY = "col4";
pyramidSeriesMale.dataFields.valueX = "col5";
pyramidSeriesMale.tooltipText = "{valueX}";
pyramidSeriesMale.name = "Male";
pyramidSeriesMale.xAxis = pyramidXAxisMale;
pyramidSeriesMale.clustered = false;
pyramidSeriesMale.columns.template.strokeOpacity = 0;

var pyramidSeriesFemale = pyramidChart.series.push(new am4charts.ColumnSeries());
pyramidSeriesFemale.dataFields.categoryY = "col4";
pyramidSeriesFemale.dataFields.valueX = "col6";
pyramidSeriesFemale.tooltipText = "{valueX}";
pyramidSeriesFemale.name = "Female";
pyramidSeriesFemale.xAxis = pyramidXAxisFemale;
pyramidSeriesFemale.clustered = false;
pyramidSeriesFemale.columns.template.strokeOpacity = 0;

var pyramidTitle = pyramidChart.titles.create();
pyramidTitle.text = currentYear;
pyramidTitle.fontSize = 20;
pyramidTitle.marginBottom = 22;

var note = pyramidChart.tooltipContainer.createChild(am4core.Label);
note.text = "* Until 1990 U.S. did not collect detailed age stats for persons above 80. For years prior to 1990 this category represents all 80+ persons."
note.fontSize = 10;
note.valign = "bottom";
note.align = "center";

/**
 * Create population chart
 */
var popChart = container.createChild(am4charts.XYChart);
popChart.marginLeft = 15;
popChart.data = [{}];

var popSubtitle = popChart.titles.create();
popSubtitle.text = "(hover to see breakdown)";

var popTitle = popChart.titles.create();
popTitle.text = "U.S. population";
popTitle.fontSize = 20;

popChart.numberFormatter.numberFormat = "#,###.#a";
popChart.numberFormatter.bigNumberPrefixes = [
  { "number": 1e+3, "suffix": "M" }
];

//popChart.dateFormatter.dateFormat = "yyyy";

var popXAxis = popChart.xAxes.push(new am4charts.CategoryAxis());
pyramidSeriesMale.dataFields.categoryY = "col3";
popXAxis.renderer.minGridDistance = 40;

var popYAxis = popChart.yAxes.push(new am4charts.ValueAxis());
popYAxis.renderer.opposite = true;

var popSeriesMale = popChart.series.push(new am4charts.LineSeries());
popSeriesMale.dataFields.categoryX = "col3";
popSeriesMale.dataFields.valueY = "col4";
popSeriesMale.propertyFields.strokeDasharray = "dash";
popSeriesMale.propertyFields.fillOpacity = "opacity";
popSeriesMale.stacked = true;
popSeriesMale.strokeWidth = 2;
popSeriesMale.fillOpacity = 0.5;
popSeriesMale.name = "Male";

var popSeriesFemale = popChart.series.push(new am4charts.LineSeries());
popSeriesFemale.dataFields.categoryX = "col3";
popSeriesFemale.dataFields.valueY = "col5";
popSeriesFemale.propertyFields.strokeDasharray = "dash";
popSeriesFemale.propertyFields.fillOpacity = "opacity";
popSeriesFemale.stacked = true;
popSeriesFemale.strokeWidth = 2;
popSeriesFemale.fillOpacity = 0.5;
popSeriesFemale.tooltipText = "[bold]U.S. population in {categoryX}[/]\n[font-size: 20]Male: {col4}\nFemale: {col5}";
popSeriesFemale.name = "Female";

popChart.dataSource.url = "resources/js/un_population.csv";
popChart.dataSource.parser = new am4core.CSVParser();
popChart.dataSource.parser.options.numberFields = ["col4", "col5", "col6"];
popChart.dataSource.adapter.add("parsedData", function(data) {
  am4core.array.each(data, function(item) {
    if (item.col3 == currentYear) {
      item.dash = "3,3";
      item.opacity = 0.3;
    }
  });
  return data;
});

popChart.cursor = new am4charts.XYCursor();
popChart.snapToSeries = popSeriesFemale;
popChart.cursor.events.on("cursorpositionchanged", function(ev) {
  currentYear = popXAxis.toAxisPosition(ev.target.xPosition).toString();
  updateData();
});

popChart.cursor.events.on("hidden", function(ev) {
  var currentYear = "gangnam";
  updateData();
});