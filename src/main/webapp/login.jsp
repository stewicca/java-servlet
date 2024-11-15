<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JSP - Login</title>
    <script src="https://code.jquery.com/jquery-3.7.1.slim.min.js" integrity="sha256-kmHvs0B+OpCW5GVHUNjv9rOmY0IvSIRcf7zGUDTDQM8=" crossorigin="anonymous"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        #login-form {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        label {
            display: block;
            margin-bottom: 15px;
            font-size: 16px;
            color: #333;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
            box-sizing: border-box;
        }

        input:focus {
            border-color: #007BFF;
            outline: none;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .error {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }

        #toast {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            background-color: #f44336;
            color: white;
            padding: 16px;
            border-radius: 4px;
            visibility: hidden;
            opacity: 0;
            transition: opacity 0.5s ease-in-out;
        }

        #toast.show {
            visibility: visible;
            opacity: 1;
        }

        @media (max-width: 500px) {
            #login-form {
                padding: 20px;
            }
            input, button {
                font-size: 14px;
            }
        }
    </style>
  </head>
  <body>
    <form id="login-form" action="login-servlet" method="post">
      <h2>Login</h2>
      <label for="username">
        <span>Username</span>
        <input id="username" name="username" type="text" placeholder="Enter username">
        <div id="username-error" class="error"></div>
      </label>
      <label for="password">
        <span>Password</span>
        <input id="password" name="password" type="password" placeholder="Enter password">
        <div id="password-error" class="error"></div>
      </label>
      <button type="submit">Submit</button>
    </form>

    <div id="toast">Invalid credentials. Please try again.</div>

    <script>
      $(document).ready(function() {
        const urlParams = new URLSearchParams(window.location.search);
        if (urlParams.has('error')) {
          showToast();
        }

        $('#username').on('input', function() {
          validateUsername();
        });

        $('#password').on('input', function() {
          validatePassword();
        });

        $('#login-form').submit(function(event) {
          event.preventDefault();

          if (validateUsername() && validatePassword()) {
            this.submit();
          }
        });

        function validateUsername() {
          let username = $('#username').val();
          let usernameError = $('#username-error');

          if (username.trim().length < 4) {
            usernameError.text('Username must be at least 4 characters long');
            return false;
          } else {
            usernameError.text('');
            return true;
          }
        }

        function validatePassword() {
          let password = $('#password').val();
          let passwordError = $('#password-error');

          if (password.trim().length < 8) {
            passwordError.text('Password must be at least 8 characters long');
            return false;
          } else {
            passwordError.text('');
            return true;
          }
        }

        function showToast() {
          $('#toast').addClass('show');
          setTimeout(function() {
            $('#toast').removeClass('show');
          }, 2000);
        }
      });
    </script>
  </body>
</html>
