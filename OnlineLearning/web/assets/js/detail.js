/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


document.getElementById("status-form").addEventListener("submit", function(event) {
  event.preventDefault(); // ngăn chặn form submit mặc định

  // Gửi request đến server để cập nhật trạng thái của khóa học
  var courseId = document.getElementsByName("course-id")[0].value;
  var xhr = new XMLHttpRequest();
  xhr.open("POST", "/update-status");
  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  xhr.send("course-id=" + courseId);

  // Thay đổi trạng thái hiển thị trên trang web
  var statusElement = document.querySelector("#CourseDetail p strong:last-child");
  statusElement.textContent = "Active";
});