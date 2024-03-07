<?php
get_header();
$args = array(
  'taxonomy' => 'Color',
  'orderby' => 'name',
  'order'   => 'ASC'
);

$Colors = get_categories($args);
// print_r($Colors );
?>

<div class="container-fluid">
  <div class="row">
    <div class="col-3 color pt-4">
      <h3>Colors</h3>
      <?php
      foreach ($Colors  as $Color) {
      ?>
        <div class="col-12 col-sm-6 col-md-4 col-lg-4">
          <div class="list-item">
            <label>
                <?php echo $Color->name; ?>
            </label>
            <input type="checkbox" id="color" value=" <?php echo $Color->name; ?>" name="color" /></a>
             </div>
        </div>

      <?php
      }
      ?>
      <input type="submit" value="Apply" name="apply" id="apply" class="btn btn-secondary">
    </div>
    <div class="col-9">
      <div class="row ajax_response">
        <?php
        if (have_posts()) {
          while (have_posts()) {
            the_post();
        ?>
            <div class="col-3 pt-3 ">

              <a href="<?php echo get_permalink() ?>" class="font-weight-bold text-decoration-none text-body">
                <div class="col-3">
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
</div>
<?php
get_footer();
?>