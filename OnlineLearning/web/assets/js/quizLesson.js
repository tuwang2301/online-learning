/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function openMess(){
    document.getElementById("alert-mess").style.display = "block";
}

function closeMess(){
    document.getElementById("alert-mess").style.display = "none";
}

function clearLocalStorage() {
    localStorage.removeItem("countdownTime");
}