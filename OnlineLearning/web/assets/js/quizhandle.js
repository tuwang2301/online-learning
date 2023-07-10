/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */




function openReview() {
    document.getElementById("quiz-review").style.display = "block";
    document.getElementById("quiz-unanswered").style.display = "none";
    document.getElementById("quiz-marked").style.display = "none";
    document.getElementById("quiz-answered").style.display = "none";
    document.getElementById("quiz-all").style.display = "flex";
}



function exitExam(courseId) {
    var url = "exit?courseId=" + courseId;
    localStorage.removeItem("countdownTime");
    window.location.href = url;
}



function closeExitMessage() {
    document.getElementById("exit-message").style.display = "none";
}


function closeReview() {
    document.getElementById("quiz-review").style.display = "none";
}

function openPeek() {
    document.getElementById("question-peek").style.display = "block";
}

function closePeek() {
    document.getElementById("question-peek").style.display = "none";
}

function openExitMessage(index, type) {
    var selectedAnswer;
    if(type === "1"){
        selectedAnswer = encodeURIComponent($("input[name='answer']:checked").val());
    }else if(type === "2"){
        var selectedAnswers = [];
        $("input[name='m-answer']:checked").each(function () {
            selectedAnswers.push($(this).val());
        });
        selectedAnswer = selectedAnswers.join("");
    }else if(type === "3"){
        selectedAnswer = encodeURIComponent($("input[name='answer']").val());
    }
    var isMarked = $("input[name='isMarked']").val();
    var url = "exitexam?answer=" + selectedAnswer + "&isMarked=" + isMarked
            + "&index=" + index;
    window.location.href = url;
}

function submitAnswer(index1, index2, type) {
    var selectedAnswer;
    if(type === "1"){
        selectedAnswer = encodeURIComponent($("input[name='answer']:checked").val());
    }else if(type === "2"){
        var selectedAnswers = [];
        $("input[name='m-answer']:checked").each(function () {
            selectedAnswers.push($(this).val());
        });
        selectedAnswer = selectedAnswers.join("");
    }else if(type === "3"){
        selectedAnswer = encodeURIComponent($("input[name='answer']").val());
    }
    var isMarked = $("input[name='isMarked']").val();
    var url = "joinquiz?answer=" + selectedAnswer + "&isMarked=" + isMarked
            + "&index1=" + index1 + "&index2=" + index2;
    window.location.href = url;
}

function scoreExam(index) {
    var selectedAnswer = $("input[name='answer']:checked").val();
    var isMarked = $("input[name='isMarked']").val();
    var url = "score?answer=" + selectedAnswer + "&isMarked=" + isMarked
            + "&index=" + index;
    localStorage.removeItem("countdownTime");
    window.location.href = url;
}


function toggleIsMarked() {
    var isMarked = document.getElementById("isMarkedInput").value;
    var customButton = document.getElementById("markButton");
    if (isMarked === "true") {
        document.getElementById("isMarkedInput").value = "false";
        customButton.style.backgroundColor = "";
    } else {
        document.getElementById("isMarkedInput").value = "true";
        customButton.style.backgroundColor = "#ffe039";
    }
}
window.onload = function () {
    var hiddenInput = document.getElementById("isMarkedInput");
    var myButton = document.getElementById("markButton");

    if (hiddenInput.value === "true") {
        myButton.style.backgroundColor = "#ffe039";
    } else {
        myButton.style.backgroundColor = "";
    }
};

function openUnanswered() {
    document.getElementById("quiz-unanswered").style.display = "flex";
    document.getElementById("quiz-marked").style.display = "none";
    document.getElementById("quiz-answered").style.display = "none";
    document.getElementById("quiz-all").style.display = "none";
}

function openMarked() {
    document.getElementById("quiz-unanswered").style.display = "none";
    document.getElementById("quiz-marked").style.display = "flex";
    document.getElementById("quiz-answered").style.display = "none";
    document.getElementById("quiz-all").style.display = "none";
}

function openAnswered() {
    document.getElementById("quiz-unanswered").style.display = "none";
    document.getElementById("quiz-marked").style.display = "none";
    document.getElementById("quiz-answered").style.display = "flex";
    document.getElementById("quiz-all").style.display = "none";
}

function openAll() {
    document.getElementById("quiz-unanswered").style.display = "none";
    document.getElementById("quiz-marked").style.display = "none";
    document.getElementById("quiz-answered").style.display = "none";
    document.getElementById("quiz-all").style.display = "flex";
}

// Lấy giá trị của thời gian countdown từ localStorage
var countdownTime = localStorage.getItem("countdownTime");
// Nếu không có giá trị trong localStorage, sử dụng giá trị mặc định là 10 phút (600000 miliseconds)
if (!countdownTime)
{
//    countdownTime = 60000;
    countdownTime = document.getElementById("duration").innerHTML * 60000;
}

// Tạo countdown timer
var countdown = setInterval(function () {
    // Giảm giá trị của countdownTime đi 1 giây
    countdownTime -= 1000;

    // Lưu giá trị mới của countdownTime vào localStorage 5*60000
    localStorage.setItem("countdownTime", countdownTime);

    // Tính toán giá trị của phút và giây
    var minutes = Math.floor((countdownTime / 1000 / 60) % 60);
    var seconds = Math.floor((countdownTime / 1000) % 60);

    if (minutes < 10 && seconds < 10) {
        // Hiển thị giá trị của countdown timer trên trang web
        document.getElementById("countdown").innerHTML =
                "0" + minutes + ":" + "0" + seconds;

    } else if (minutes < 10 && seconds >= 10) {
        document.getElementById("countdown").innerHTML =
                "0" + minutes + ":" + seconds;
    } else if (minutes >= 10 && seconds < 10) {
        document.getElementById("countdown").innerHTML =
                minutes + ":" + "0" + seconds;
    } else {
        document.getElementById("countdown").innerHTML =
                minutes + ":" + seconds;
    }

    // Nếu countdownTime bằng 0, dừng countdown timer và thông báo cho người dùng
    if (countdownTime <= 0) {
        scoreExam(1);
        clearInterval(countdown);
    }
}, 1000);

