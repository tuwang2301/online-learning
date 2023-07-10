/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */




function openExitMessage() {
    document.getElementById("exit-message").style.display = "block";
}

function openRedoMessage() {
    document.getElementById("redo-message").style.display = "block";
}
function closeRedoMessage() {
    document.getElementById("redo-message").style.display = "none";
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

function nextAnswer(index) {
    var url = "quizreview?index=" + index;
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

window.onload = function () {
    var hiddenInput = document.getElementById("isMarkedInput");
    var myButton = document.getElementById("markButton");

    if (hiddenInput.value === "true") {
        myButton.style.backgroundColor = "yellow";
    } else {
        myButton.style.backgroundColor = "";
    }
};

function openReview() {
    document.getElementById("quiz-review").style.display = "block";
    document.getElementById("quiz-unanswered").style.display = "none";
    document.getElementById("quiz-marked").style.display = "none";
    document.getElementById("quiz-incorrect").style.display = "none";
    document.getElementById("quiz-correct").style.display = "none";
    document.getElementById("quiz-all").style.display = "flex";
}

function openUnanswered() {
    document.getElementById("quiz-unanswered").style.display = "flex";
    document.getElementById("quiz-marked").style.display = "none";
    document.getElementById("quiz-incorrect").style.display = "none";
    document.getElementById("quiz-correct").style.display = "none";
    document.getElementById("quiz-all").style.display = "none";
}

function openMarked() {
    document.getElementById("quiz-unanswered").style.display = "none";
    document.getElementById("quiz-marked").style.display = "flex";
    document.getElementById("quiz-incorrect").style.display = "none";
    document.getElementById("quiz-correct").style.display = "none";
    document.getElementById("quiz-all").style.display = "none";
}

function openIncorrect() {
    document.getElementById("quiz-unanswered").style.display = "none";
    document.getElementById("quiz-marked").style.display = "none";
    document.getElementById("quiz-incorrect").style.display = "flex";
    document.getElementById("quiz-correct").style.display = "none";
    document.getElementById("quiz-all").style.display = "none";
}

function openCorrect() {
    document.getElementById("quiz-unanswered").style.display = "none";
    document.getElementById("quiz-marked").style.display = "none";
    document.getElementById("quiz-incorrect").style.display = "none";
    document.getElementById("quiz-correct").style.display = "flex";
    document.getElementById("quiz-all").style.display = "none";
}

function openAll() {
    document.getElementById("quiz-unanswered").style.display = "none";
    document.getElementById("quiz-marked").style.display = "none";
    document.getElementById("quiz-incorrect").style.display = "none";
    document.getElementById("quiz-correct").style.display = "none";
    document.getElementById("quiz-all").style.display = "flex";
}
