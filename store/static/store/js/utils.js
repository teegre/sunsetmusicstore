// Remove error field (card header) on user input.
var errorField = document.getElementById("error-field");
if (errorField != undefined) {
  inputFields = document.getElementsByClassName("form-control");
  for (const element of inputFields) {
    element.addEventListener("input", function() {
      var error = document.getElementById("error-field");
      if (error != undefined) error.remove();
  })}}
