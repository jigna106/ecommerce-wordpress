<html <?php language_attributes(); ?>>

<head class="menu-header">
  <title>
    <?php wp_title(); ?>
  </title>

  <?php session_start();
  wp_head(); ?>
</head>

<body <?php body_class(); ?>>


  <nav class="navbar navbar-expand-lg bg-body-tertiary" id="navigation">
    <div class="container-fluid">
      <div class="header-logo">
        <img src="<?php echo get_theme_file_uri('assets/images/logo1.png'); ?>" />
      </div>
      <div class="header-link">
        <?php wp_nav_menu(array('menu' => 'header-menu')); ?>
      </div>
    </div>
  </nav>