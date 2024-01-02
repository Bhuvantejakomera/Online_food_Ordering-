<?php
// Include the constants.php file
include('config/constants.php');

// Start Session
//session_start();

if (isset($_POST['signup'])) {
    // Get the signup form data
    $fullname = $_POST['fullname'];
    $password = $_POST['password'];

    // SQL Query to insert user into the database with 'admin' set to 'NO'
    $sql = "INSERT INTO loginform (fullname, password, admin) VALUES ('$fullname', '$password', 'NO')";
    $result = mysqli_query($conn, $sql);

    if ($result) {
        $_SESSION['signup'] = "<div class='success text-center'>User registered successfully.</div>";
        header("Location: regulogin.php"); // Redirect to login page (regulogin.php) after successful signup
    } else {
        $_SESSION['signup'] = "<div class='error text-center'>Failed to register user.</div>";
        header("Location: signup.php"); // Redirect to signup page on signup failure
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Signup</title>
    <link rel="stylesheet" href="css/style.css"> <!-- Link to your CSS file -->
    <style>
        /* Center-align the form and buttons */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* Style for the login form */
        form.f1 {
            text-align: center;
            margin-top: 10px; /* Add margin to the top */
            padding: 20px; /* Add padding to the form */
        }

        /* Style for the buttons */
        div.buttons {
            text-align: center;
            margin-top: 20px; /* Add margin to separate the buttons */
        }

        /* Style for each button */
        input[type="submit"] {
            padding: 10px 20px; /* Add padding to the buttons */
            background-color: #5d9e5f; /* Button background color */
            color: white; /* Button text color */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s; /* Smooth transition */
        }

        /* Change button color on hover */
        input[type="submit"]:hover {
            background-color: #000000; /* New background color on hover */
            color: #f30707; /* New text color on hover */
        }
        
        label {
            color: #5d9e5f; /* Change the label color to green (#5d9e5f) or any color you prefer */
            font-weight: bold; /* Make the labels bold */
        }
    </style>
</head>
<body>
    <!-- Signup Form -->
    <form class="f1" method="post" action="">
        <h2>Signup</h2>
        <?php
        if (isset($_SESSION['signup'])) {
            echo $_SESSION['signup'];
            unset($_SESSION['signup']);
        }
        ?>
        <label for="fullname">Username:</label>
        <input type="text" name="fullname" placeholder="Username"><br><br>
        <label for="password">Password:</label>
        <input type="password" name="password" placeholder="Password"><br><br>
        <input type="submit" name="signup" value="Signup">
    </form>

    <!-- Buttons with spacing -->
    <div class="buttons">
        <!-- Admin Login Button -->
        <form method="get" action="admin/login.php">
            <input type="submit" name="admin_login" value="ADMIN">
        </form>

        <!-- Login Button -->
        <form method="get" action="regulogin.php">
            <input type="submit" name="login" value="Login">
        </form>
    </div>
</body>
</html>

