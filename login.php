<?php /* Template Name: login */

if(isset($_POST['signin'])){
    $creds = array(
		'user_login'    => $_POST['email'],
		'user_password' => $_POST['password'],
		'remember'      => true
	);

	$user = wp_signon( $creds, false );
    
    wp_redirect(site_url());
    exit;
}
get_header();
?>
<div class="container">
    <h2>Login Form</h2>
    <form method="post">
        <div class="form-group">
            <label for="Email1">Email address</label>
            <input type="email" class="form-control" id="Email" name="email">
        </div>
        <div class="form-group">
            <label for="Password">Password</label>
            <input type="password" class="form-control" id="Password" name="password">
        </div>
        <button type="submit" class="btn btn-primary" name="signin">Sign in</button>
    </form>
</div>


<?php
get_footer();

?>