<html <?php language_attributes(); ?>>

<head class="menu-header">
  <title>
    <?php wp_title(); ?>
  </title>

  <?php session_start();
  wp_head(); ?>
  <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
</head>

<body <?php body_class(); ?>>
  <nav class="navbar navbar-expand-lg bg-body-tertiary navbar-fixed-top" id="navigation">
    <div class="container">
      <div class="header-logo">
        <img src="<?php echo get_theme_file_uri('assets/images/logo1.png'); ?>" />
      </div>
      <div class="header-link">
        <?php
        if (is_user_logged_in()) {
          wp_nav_menu(array('menu' => 'Login_user_Menu'));
        } else {
          wp_nav_menu(array('menu' => 'Logout_user_Menu'));
        }
    ?>
      </div>
    </div>
  </nav>