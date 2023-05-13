//출생연도 1900~2099
var selectElement = document.getElementById('birth');

for (var year = 1900; year <= 2099; year++) {
  var optionElement = document.createElement('option');
  optionElement.value = year;
  optionElement.textContent = year;
  selectElement.appendChild(optionElement);
}

function previewImage(event) {
    var file = event.target.files[0];
    var reader = new FileReader();

    reader.onload = function(e) {
      var img = document.createElement('img');
      img.src = e.target.result;
      img.style.width = '150px';
      img.style.height = '150px';
      img.style.borderRadius = '50%';

      var previewContainer = document.getElementById('previewContainer');
      previewContainer.innerHTML = '';
      previewContainer.appendChild(img);
    };

    reader.readAsDataURL(file);
  }