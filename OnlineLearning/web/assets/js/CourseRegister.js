/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
var btnOpen = document.querySelector(".open_moda_btn");
var modal = document.querySelector(".modal");
var iconClose = document.querySelector(".modal_header i");
var btnClose = document.querySelector(".modal_footer button");

function toggleModel(e){
    console.log(e.target);
    modal.classList.toggle('hide');
}

    btnOpen.addEventListener('click', toggleModel);

    btnClose.addEventListener('click', toggleModel);

    iconClose.addEventListener('click', toggleModel);
  modal.addEventListener('click', function(e){
    if (e.target == e.currentTarget) {
        toggleModel();
    }
});  

