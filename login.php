<?php include('config/config.php'); ?>
<html>
    <head>
        <title>User Login - Food Order System</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="login">
            <h1 class="text-center">User Login</h1>
            <br><br>
            <?php 
                if(isset($_SESSION['login_error'])) {
                    echo $_SESSION['login_error'];
                    unset($_SESSION['login_error']);
                }
            ?>
            <br><br>
            <form action="" method="POST" class="text-center">
                Email: <br>
                <input type="email" name="email" placeholder="Enter Email" required><br><br>
                Password: <br>
                <input type="password" name="password" placeholder="Enter Password" required><br><br>
                <input type="submit" name="submit" value="Login" class="btn-primary">
                <br><br>
            </form>
            <p class="text-center">Don't have an account? <a href="register.php">Register here</a></p>
        </div>
    </body>
</html>

<?php 
    if(isset($_POST['submit'])) {
        $email = mysqli_real_escape_string($conn, $_POST['email']);
        $raw_password = md5($_POST['password']);
        $password = mysqli_real_escape_string($conn, $raw_password);
        // Fetch user data from 'users' table
        $sql = "SELECT * FROM users WHERE email='$email'";
        $res = mysqli_query($conn, $sql);
        $count = mysqli_num_rows($res);

        if($count == 1) {
            $row = mysqli_fetch_assoc($res);

            // Verify the password
            if($password == $row['password']) {
                $_SESSION['login'] = "<div class='success'>Login Successful.</div>";
                $_SESSION['user'] = $row['full_name']; // Store the user's full name or email
                header('location:' . SITEURL . 'index.php'); // Redirect to index.php after successful login
                exit(); // Make sure to exit after the redirect
            } else {
                $_SESSION['login_error'] = "<div class='error text-center'>Incorrect Password.</div>";
                header('location:' . SITEURL . 'login.php');
                exit(); // Make sure to exit after the redirect
            }
        } else {
            $_SESSION['login_error'] = "<div class='error text-center'>Email not found.</div>";
            header('location:' . SITEURL . 'login.php');
            exit(); // Make sure to exit after the redirect
        }
    }
?>
