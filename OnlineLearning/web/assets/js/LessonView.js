document.addEventListener('DOMContentLoaded', function() {
  var placeholders = document.querySelectorAll('.video-placeholder');
  var popupWindow = null;

  placeholders.forEach(function(placeholder) {
    var videoLink = placeholder.getAttribute('data-video');
    var button = placeholder.querySelector('.watch-video-button');

    button.addEventListener('click', function(event) {
      event.preventDefault();

      if (!popupWindow || popupWindow.closed) {
        var left = window.screenLeft || window.screenX || 0;
        var top = window.screenTop || window.screenY || 0;
        var width = 800; // Chiều rộng của cửa sổ pop-up
        var height = 600; // Chiều cao của cửa sổ pop-up

        var popupLeft = window.innerWidth / 2 - width / 2 + left;
        var popupTop = window.innerHeight / 2 - height / 2 + top;

        popupWindow = window.open(videoLink, 'videoPopup', 'left=' + popupLeft + ',top=' + popupTop + ',width=' + width + ',height=' + height);
        
      } else {
        popupWindow.close();
        
      }
    });
  });
});
document.addEventListener('DOMContentLoaded', function() {
  var placeholders = document.querySelectorAll('.link-placeholder');
  var popupWindow = null;

  placeholders.forEach(function(placeholder) {
    var videoLink = placeholder.getAttribute('data-video');
    var button = placeholder.querySelector('.lesson-link');

    button.addEventListener('click', function(event) {
      event.preventDefault();

      if (!popupWindow || popupWindow.closed) {
        var left = window.screenLeft || window.screenX || 0;
        var top = window.screenTop || window.screenY || 0;
        var width = 800; // Chiều rộng của cửa sổ pop-up
        var height = 600; // Chiều cao của cửa sổ pop-up

        var popupLeft = window.innerWidth / 2 - width / 2 + left;
        var popupTop = window.innerHeight / 2 - height / 2 + top;

        popupWindow = window.open(videoLink, 'videoPopup', 'left=' + popupLeft + ',top=' + popupTop + ',width=' + width + ',height=' + height);
        
      } else {
        popupWindow.close();
        
      }
    });
  });
});
