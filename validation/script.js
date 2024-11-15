(function () {
'use strict'
const forms = document.querySelectorAll('.requires-validation')
Array.from(forms)
  .forEach(function (form) {
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
      console.log("before validation Succ1");
      form.classList.add('was-validated')
    }, false)
  })
})()

function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

  //var input1 = document.querySelector("#phone");
  //      // here, the index maps to the error code returned from getValidationError - see readme
  //      var errorMap = ["Invalid number", "Invalid country code", "Too short", "Too long", "Invalid number"];

  //       var iti1 = window.intlTelInput(input1, {
  //          utilsScript: "{{asset('js/utils.js')}}",
  //          initialCountry: "auto",
  //          preferredCountries: ['AE', 'US', 'UK', 'SA', 'QA', 'OM', 'IN'],
  //          setNumber: true,
  //          formatOnDisplay: true,
  //          nationalMode: true,
  //          geoIpLookup: function(success, failure) {
  //              $.get("https://ipinfo.io", function() {}, "jsonp").always(function(resp) {
  //                  var countryCode = (resp && resp.country) ? resp.country : "";
  //                  success(countryCode);
  //              });
  //          },
  //      });

  //      var reset = function() {
  //          input1.classList.remove("error");
  //      };

  //      // on blur: validate
  //      input1.addEventListener('keyup', function() {
  //          reset();
  //          if (input1.value.trim()) {
  //              if (iti1.isValidNumber()) {
  //                  $('#phoneError').hide();
  //                  input1.classList.remove("is-invalid");
  //                  input1.classList.add("is-valid");
  //                  document.querySelector("#phoneinvalid").value = iti1.getNumber();
  //              } else {
  //                  $('#phoneError').show();
  //                  input1.classList.remove("is-valid");
  //                  input1.classList.add("is-invalid");
  //              }
  //          }
  //      });

  //      // on keyup / change flag: reset
  //      input1.addEventListener('change', reset);
  //      input1.addEventListener('keyup', reset);