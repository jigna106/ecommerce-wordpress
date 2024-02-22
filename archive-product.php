<?php
get_header();
?>
<div>
<?php
if (have_posts()) {
  while (have_posts()) {
    the_post();
?>
<div class="product-itmes">
    <a href="<?php echo get_permalink() ?>">
      <div class="content-here">
        <img src="<?php echo  get_the_post_thumbnail_url(get_the_ID()) ?>" width="200px" height="200px">
       </div>
      <diV>
      <div class="title">
        <p><?php the_title(); ?></p>
      </div>
      <h1>Price: <?php $price = get_post_meta($post->ID, 'ecommerce_price');
                    print_r($price[0]);
                    ?>
        </h1>
      </div>
    </a>
  </div>
<?php
  }
}
?>
</div>



<?php
get_footer();
?>