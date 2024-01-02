<?php include('config/constants.php'); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- Important to make website responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Burger Ordering System</title>

    <!-- Link our CSS file -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
    <!-- Navbar Section Starts Here -->
<section class="navbar">
    <div class="container">
        <div class="logo">
            <a href="<?php echo SITEURL; ?>" title="Logo">
                <img src="images/logo(2).png" alt="Restaurant Logo" class="img-responsive">
                <span style="position: absolute; top: 45px; left: 250px; font-size: 24px; color: white;">BRRRGRRR</span>
            </a>
        </div>

        <div class="menu text-right">
            <ul>
                <?php if (isset($_SESSION['user'])): ?>
                    <li>
                        <a href="<?php echo SITEURL; ?>regulogin.php">Logout</a>
                    </li>
                <?php else: ?>
                    <li>
                        <a href="<?php echo SITEURL; ?>regulogin.php">Login</a>
                    </li>
                <?php endif; ?>
            </ul>
        </div>

        <div class="menu text-center">
            <ul>
                <li>
                    <a href="<?php echo SITEURL; ?>">Home</a>
                </li>
                <li>
                    <a href="<?php echo SITEURL; ?>categories.php">categories</a>
                </li>
                <li>
                    <a href="<?php echo SITEURL; ?>foods.php">Food</a>
                </li>
            </ul>
        </div>

        <div class="clearfix"></div>
    </div>
</section>
<!-- Navbar Section Ends Here -->
