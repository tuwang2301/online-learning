//// File: charts.js
//
//// Đoạn mã JavaScript ở đây
//var xValues = ["Math", "Literature", "Chemistry", "Physics"];
////var yValues = [${requestScope.laptop}, ${requestScope.smartphone}, ${requestScope.tablet}, ${requestScope.acces}];
//var barColors = ["red", "green", "blue", "orange"];
//new Chart('mychart', {
//    type: 'pie',
//    data: {
//        labels: xValues,
//        datasets: [{
//            backgroundColor: barColors,
//            data: yValues
//        }]
//    },
//    options: {
//        title: {
//            display: true,
//            text: 'Number of Blog by Category'
//        }
//    }
//});
//
//var xValues = ["Math", "Literature", "Chemistry", "Physics"];
////var yValues = [${requestScope.laptop1}, ${requestScope.smartphone1}, ${requestScope.tablet1}, ${requestScope.acces1}];
//var barColors = ["red", "green", "blue", "orange"];
//new Chart('myBarchart', {
//    type: 'bar',
//    data: {
//        labels: xValues,
//        datasets: [{
//            backgroundColor: barColors,
//            data: yValues
//        }]
//    },
//    options: {
//        legend: {display: false},
//        title: {
//            display: true,
//            text: 'Number of Viewer by Category'
//        }
//    }
//});
//
//google.charts.load("current", {"packages": ["corechart"]});
//google.charts.setOnLoadCallback(drawChart);
//function drawChart() {
//    var data = google.visualization.arrayToDataTable([
//        ["Star", "Count"],
////        ["5*",${requestScope.star5}],
////        ["4*",${requestScope.star4}],
////        ["3*",${requestScope.star3}],
////        ["2*",${requestScope.star2}],
////        ["1*",${requestScope.star1}]
////    ]);
////    var options = {
////        title: "Count Star of Feedback"
////    };
////    var chart = new google.visualization.BarChart(document.getElementById("myStarchart"));
////    chart.draw(data, options);
////}
//
////const dataPie = {
////    labels: [
////        <c:forEach items="${userfeedback}" var="uf">
//            "${//uf.user.userName}",
//        </c:forEach>//
////    ],
////    datasets: [{
////        label: "My First Dataset",
////        data: [
////            <c:forEach items="${userfeedback}" var="uf">
//                "${//uf.star}",
//            </c:forEach>//
////        ],
////        backgroundColor: [
////            "rgb(255, 99, 132)",
////            "rgb(54, 162, 235)",
////            "rgb(255, 205, 86)"
////        ],
////        hoverOffset: 4
////    }]
////};
//const configPie = {
//    type: "pie",
//    data: dataPie,
//};
//const myPieChart = new Chart(
//    document.getElementById("myPieChart"),
//    configPie
//);
//
//const dataBar = {
//    labels: [
//        <c:forEach items="${pFeedback}" var="pf">
//            "${//pf.product.productName}",
//        </c:forEach>//
//    ],
//    datasets: [{
//        label: "My First Dataset",
//        data: [
//            <c:forEach items="${pFeedback}" var="pf">
//                "${//pf.star}",
//            </c:forEach>//
//        ],
//        backgroundColor: [
//            "rgb(255,0,0)",
//            "rgb(54, 162, 235)",
//            "rgb(255, 205, 86)"
//        ],
//        hoverOffset: 4
//    }]
//};
//const configBar = {
//    type: "pie",
//    data: dataBar,
//};
//const myBarChart = new Chart(
//    document.getElementById("myPFeedback"),
//    configBar
//);
