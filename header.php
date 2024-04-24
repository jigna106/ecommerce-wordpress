<html <?php language_attributes(); ?>>

<head class="menu-header">
  <title>
    <?php wp_title(); ?>
  </title>

  <?php 
  wp_head(); ?>
  <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
</head>

<body <?php body_class(); ?>>
  <nav class="navbar navbar-expand-lg bg-body-tertiary navbar-fixed-top" id="navigation">
    <div class="container">
      <div class="header-logo">
        <a href="<?php echo get_home_url(); ?>"><img
            src="<?php echo get_theme_file_uri('assets/images/logo1.png'); ?>" /></a>
      </div>
      <div class="header-link">
        <?php wp_nav_menu(array('menu' => '22')); ?>

      </div>
    </div>
  </nav>
  <div class="main">