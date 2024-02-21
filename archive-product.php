<?php
get_header();
?>
<div>
<?php
if (have_posts()) {
  while (have_posts()) {
    the_post();
?>
    <a href="<?php echo get_permalink() ?>">
      <div class="title">
        <h1><?php the_title(); ?></h1>
      </div>
      <div class="content-here">
        <img src="<?php echo  get_the_post_thumbnail_url(get_the_ID()) ?>" width="200px" height="200px">
        <?php the_content();  ?>
      </div>
      <diV>
        <h1>Price: <?php $price = get_post_meta($post->ID, 'ecommerce_price');
                    print_r($price[0]);
                    ?>
        </h1>
      </div>
      <div>
      </div>

      </div>
    </a>
<?php
  }
}
?>
</div>



<?php
get_footer();
?>