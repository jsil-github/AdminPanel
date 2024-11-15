﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="validation.aspx.cs" Inherits="validation_validation" %>

<!DOCTYPE html>

<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Registration Form (Bootstrap 5 Validation)</title>
  <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/css/intlTelInput.css'><link rel="stylesheet" href="./style.css">

</head>
<body>
<!-- partial:index.partial.html -->
<div class="form-body">
  <div class="row">
    <div class="form-holder">
      <div class="form-content">
        <div class="form-items">
          <h3>Register you interest</h3>
          <p>Fill in the data below, we will get back to you!</p>
          <form class="requires-validation" action="SubmitFORM.php" method="POST" novalidate>

            <div class="col-md-12 mb-3">
              <input class="form-control" type="text" name="name" placeholder="Full Name" required>
              <div class="valid-feedback">Username field is valid!</div>
              <div class="invalid-feedback">Username field cannot be blank!</div>
            </div>

            <div class="col-md-12 mb-3">
              <input class="form-control" type="email" name="email" placeholder="E-mail Address" required>
              <div class="valid-feedback">Email field is valid!</div>
              <div class="invalid-feedback">Email field cannot be blank!</div>
            </div>

            <div class="col-md-12 mb-3">
              <input class="form-control" type="tel" id="phone" name="phone" placeholder="Phone" onkeypress="return isNumber(event)" required>
              <div class="valid-feedback">Phone field is valid!</div>
              <div class="invalid-feedback">Phone field cannot be blank!</div>
            </div>

            <div class="col-md-12 mb-3">
              <textarea name="message" id="message" placeholder="Your Message"></textarea>
            </div>


            <div class="form-button mt-3">
              <button id="submit" type="submit" class="btn btn-primary">Submit</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- partial -->
  <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/intlTelInput.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.13/js/utils.js'></script><script  src="./script.js"></script>

</body>
</html>
