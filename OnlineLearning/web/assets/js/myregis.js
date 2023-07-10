/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


var messageBox = document.getElementById("message1");
  messageBox.style.display = "none"; // Ẩn thông báo ban đầu
  
  function showMessage() {
    // Hiển thị thông báo
    messageBox.style.display = "block";
    messageBox.style.top = (window.innerHeight - messageBox.offsetHeight) / 2 + "px"; // Căn giữa theo chiều dọc
    messageBox.style.left = (window.innerWidth - messageBox.offsetWidth) / 2 + "px"; // Căn giữa theo chiều ngang
  
    // Tự động tắt thông báo sau 3 giây
    setTimeout(function() {
      messageBox.style.display = "none";
    }, 3000);
  }
  
  // Gọi hàm hiển thị thông báo
  showMessage();