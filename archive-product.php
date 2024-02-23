<?php
get_header();
?>
<div>
  <div class="container">
    <div class="row">
      <?php
      if (have_posts()) {
        while (have_posts()) {
          the_post();
      ?>
          <div class="col-3 pt-3 ">
            <a href="<?php echo get_permalink() ?>" class="font-weight-bold text-decoration-none text-body">
              <div class="col-3 ">
                <img src="<?php echo  get_the_post_thumbnail_url(get_the_ID()) ?>" width="200px" height="200px">
              </div>
              <div class="col-3 pt-3 text-uppercase text-lg">
                <?php the_title(); ?>
              </div>
              <div>
                Price: <?php $price = get_post_meta($post->ID, 'ecommerce_price');
                        print_r($price[0]);
                        ?>

              </div>
            </a>
          </div>

      <?php
        }
      }
      ?>
    </div>
  </div>
</div>



<?php
get_footer();
?>