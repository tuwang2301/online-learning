/*!
    * Start Bootstrap - SB Admin v7.0.5 (https://startbootstrap.com/template/sb-admin)
    * Copyright 2013-2022 Start Bootstrap
    * Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-sb-admin/blob/master/LICENSE)
    */
    // 
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sb-sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sb-sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sb-sidenav-toggled'));
        });
    }

});

function changeStatus(currentStatus) {
    var button = document.getElementById("statusButton");
    var newStatus = ""; // Thay đổi trạng thái tại đây

    if (currentStatus === "Active") {
        newStatus = "Locked";
    } else if (currentStatus === "Locked") {
        newStatus = "Active";
    }

    // Logic để thay đổi trạng thái
    // ...

    button.textContent = newStatus;
}


  $(document).ready(function() {
    // Khởi tạo datepicker cho các input
    $("#start-date").datepicker({
      dateFormat: "dd/mm/yy"
    });

    $("#end-date").datepicker({
      dateFormat: "dd/mm/yy"
    });

    // Xử lý sự kiện khi nhấn nút Show Trends
    $("#show-trends-button").click(function() {
      var startDate = $("#start-date").val();
      var endDate = $("#end-date").val();

      // Thực hiện các xử lý hoặc gửi yêu cầu tới server để hiển thị bộ đếm thời gian từ startDate đến endDate
      console.log("Start Date:", startDate);
      console.log("End Date:", endDate);
    });
  });
  
  $(function() {
    // Kích hoạt DatePicker cho các input
    $("#start-date").datepicker({ dateFormat: "dd/mm/yy" });
    $("#end-date").datepicker({ dateFormat: "dd/mm/yy" });

    // Xử lý sự kiện khi nhấn nút "Chọn 1 tuần"
    $("#select-week-button").click(function() {
      var today = new Date();
      var endDate = $.datepicker.formatDate("dd/mm/yy", today); // Ngày kết thúc là ngày hiện tại

      // Ngày bắt đầu là 7 ngày trước ngày kết thúc
      var startDate = new Date(today.getTime() - 7 * 24 * 60 * 60 * 1000);
      startDate = $.datepicker.formatDate("dd/mm/yy", startDate);

      // Gán giá trị cho input "Start Date" và "End Date"
      $("#start-date").val(startDate);
      $("#end-date").val(endDate);
    });
  });
  
  $(function() {
    // Kích hoạt DatePicker cho các input
    $("#start-date").datepicker({ dateFormat: "dd/mm/yy" });
    $("#end-date").datepicker({ dateFormat: "dd/mm/yy" });

    // Xử lý sự kiện khi nhấn nút "Chọn 1 tuần"
    $("#select-week-button").click(function() {
      var startDate = $("#start-date").val();
      var endDate = $("#end-date").val();
      
      // Lấy dữ liệu và vẽ biểu đồ
      fetchDataAndDrawChart(startDate, endDate);
    });
  });

  function fetchDataAndDrawChart(startDate, endDate) {
    // Gọi API hoặc truy vấn cơ sở dữ liệu để lấy dữ liệu trong khoảng thời gian từ startDate đến endDate
    
    // Mô phỏng dữ liệu mẫu
    var data = {
      labels: ["Day 1", "Day 2", "Day 3", "Day 4", "Day 5", "Day 6", "Day 7"],
      datasets: [
        {
          label: "Trend",
          data: [10, 20, 15, 25, 30, 20, 35],
          backgroundColor: "rgba(54, 162, 235, 0.2)",
          borderColor: "rgba(54, 162, 235, 1)",
          borderWidth: 1
        }
      ]
    };

    // Vẽ biểu đồ
    var ctx = document.getElementById("chart").getContext("2d");
    var chart = new Chart(ctx, {
      type: "line",
      data: data,
      options: {
        responsive: true,
        scales: {
          y: {
            beginAtZero: true
          }
        }
      }
    });
  }
