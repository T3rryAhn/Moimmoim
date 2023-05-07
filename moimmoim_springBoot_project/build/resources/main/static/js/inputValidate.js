var idInput = document.getElementById('idInput');
idInput.addEventListener("blur", function() {

    var inputValue = idInput.inputValue;
    var confirmMsg = document.getElementById('confirm-msg').innerHTML(inputValue);

});

