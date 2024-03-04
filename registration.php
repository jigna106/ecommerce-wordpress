<?php /* Template Name: registration */
get_header();
if (isset($_POST['signup'])) {
    // print_r($_POST);
    $userdata = array(
        'user_login' =>  $_POST['firstname'],
        'user_email' =>  $_POST['email'],
        'user_pass'  =>   $_POST['password'],

    );

    $user_id = wp_insert_user($userdata);


    print_r($user_id);
}
?>
<div class="container">
    <h2>Registration Form</h2>
    <form method="post">
        <div class="form-group">
            <label for="firstname">First Name</label>
            <input type="text" class="form-control" id="firstname" name="firstname">
        </div>
        <div class="form-group">
            <label for="lastname">Last Name</label>
            <input type="text" class="form-control" id="lastname" name="lastname">
        </div>
        <div class="form-group">
            <label for="Email1">Email address</label>
            <input type="email" class="form-control" id="Email" name="email">
        </div>
        <div class="form-group">
            <label for="Password">Password</label>
            <input type="password" class="form-control" id="Password" name="password">
        </div>
        <a href="<?php echo get_permalink(160); ?>"><button type="submit" class="btn btn-primary" name="signup">Sign up</button></a>
    </form>
</div>


<?php
get_footer();
?>