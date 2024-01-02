<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <style>
        /* Center-align the form and buttons */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: rgb(34, 3, 96); /* Background color for the body */
        }

        /* Style for the login form */
        form.f1 {
            text-align: center;
            margin-top: 10px; /* Add margin to the top */
            padding: 20px; /* Add padding to the form */
            background-color: #ffffff; /* Background color for the form */
            border-radius: 10px; /* Add rounded corners to the form */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add a shadow to the form */
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
    <?php 
        // Include your constants.php file
        include('config/constants.php');

        // Start a session to manage user authentication
        // session_start();

        if (isset($_SESSION['user'])) {
            // If the user is logged in, display a logout button
            if (isset($_POST['logout'])) {
                // Handle the logout action
                session_destroy();
                header("Location: index.php"); // Redirect to the index page after logout
            } else {
                // Display the logged-in user's information
                echo "<p>You are logged in as: " . $_SESSION['user'] . "</p>";
                echo '<form class="f1" method="post" action="">
                        <input type="submit" name="logout" value="Logout">
                      </form>';
            }
        } else {
            // If the user is not logged in, display the login form
            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                // Handle form submission
                $username = $_POST["fullname"];
                $password = $_POST["password"];
    
                // Replace with your database connection code
                $conn = mysqli_connect(LOCALHOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
    
                if (!$conn) {
                    die("Connection failed: " . mysqli_connect_error());
                }
    
                if (isset($_POST['admin'])) {
                    // Redirect to the admin login page
                    header("Location:/onlinefood-order/admin/login.php");
                    exit();
                }
    
                // SQL query to check user credentials
                $sql = "SELECT * FROM loginform WHERE fullname='$username' AND password='$password'";
                $result = mysqli_query($conn, $sql);
    
                if ($result && mysqli_num_rows($result) == 1) {
                    // Successful login
                    $_SESSION['user'] = $username;
                    header("Location: index.php"); // Redirect to the index page after login
                } else {
                    // Failed login
                    echo '<p>Invalid credentials. Please try again.</p>';
                }
    
                mysqli_close($conn);
            }
    
            // Display the login form
            echo '<form class="f1" method="post" action="">
                    <h2>Login</h2>
                    <label for="fullname">Username:</label>
                    <input type="text" name="fullname" placeholder="Username"><br><br>
                    <label for="password">Password:</label>
                    <input type="password" name="password" placeholder="Password"><br><br>
                    <input type="submit" name="login" value="Login">
                    <input type="submit" name="admin" value="Admin">
                  </form>';
        }
    ?>
</body>

</html>

