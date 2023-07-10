/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

    var btnOpen = document.querySelector(".open_moda_btn");
    var modal = document.querySelector(".modal1x1");
    var iconClose = document.querySelector(".modal_header i");
    var btnClose = document.querySelector(".modal_footer button");

    function toggleModel(e) {
        console.log(e.target);
        modal.classList.toggle('hide');
    }

    btnOpen.addEventListener('click', toggleModel);

    btnClose.addEventListener('click', toggleModel);

    iconClose.addEventListener('click', toggleModel);
    modal.addEventListener('click', function (e) {
        if (e.target == e.currentTarget) {
            toggleModel();
        }
    });

// Lắng nghe sự kiện change của trường package và valid-from
document.querySelector('#package').addEventListener('change', calculatePrice);
document.querySelector('#valid-from').addEventListener('change', calculatePrice);
document.querySelector('#sale-price').addEventListener('change', calculateTotal);

function calculatePrice() {
  const packageSelect = document.querySelector('#package');
  const validFromInput = document.querySelector('#valid-from');
  const validToInput = document.querySelector('#valid-to');

  // Lấy giá trị của gói và ngày bắt đầu hợp lệ từ các trường nhập liệu
  const packageDuration = parseInt(packageSelect.value);
  const validFromDate = new Date(validFromInput.value);
  const packageValue = packageSelect.value;
  const [duration, listPrice] = packageValue.split(':');

  // Tính toán ngày hết hạn dựa trên gói và ngày bắt đầu hợp lệ
  const validToDate = new Date(validFromDate);
  validToDate.setDate(validFromDate.getDate() + packageDuration);
  validToInput.value = validToDate.toISOString().substring(0, 10);

  // Cập nhật giá trị tổng
  calculateTotal();
}
function validateForm() {
        // Lấy các giá trị từ các trường nhập liệu
        var package = document.getElementById("package").value;
        var total = document.getElementById("total").value;

        // Kiểm tra các giá trị có bị bỏ trống không
        if (package === "" || total === "") {
            alert("Please select the course package in the package.");
            return false;
        }

     
        if (isNaN(total) || total <= 0) {
            alert("Please select the course package in the package.");
            return false;
        }

        // Nếu thông tin đầy đủ và hợp lệ, cho phép gửi biểu mẫu đăng ký
        return true;
    }
function calculateTotal() {
  const packageSelect = document.querySelector('#package');
  const salePriceInput = document.querySelector('#sale-price');
  const totalInput = document.querySelector('#total');

  // Lấy giá trị của gói và giá sale-price
  const packageValue = packageSelect.value;
  const [duration, listPrice] = packageValue.split(':');
  const salePrice = parseFloat(salePriceInput.value);

  // Tính toán giá tổng cộng bằng cách nhân giá listprice với giá sale-price
  const total = salePrice * listPrice;
  totalInput.value = total.toFixed(2);
}

 var messageBox = document.getElementById("message");
  messageBox.style.display = "none"; 
  
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
  