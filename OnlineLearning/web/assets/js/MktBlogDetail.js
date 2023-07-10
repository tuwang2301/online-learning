function previewImage(event) {
    var input = event.target;
    var reader = new FileReader();
    var preview = document.getElementById('preview');

    if (input.files && input.files[0]) {
      reader.onload = function() {
        preview.src = reader.result;
      };
      reader.readAsDataURL(input.files[0]);
    } else {
      preview.src = '${detail.image}';
    }
  }