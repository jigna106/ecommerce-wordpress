<?php
get_header();
if (isset ($_POST['submit'])) {

  $id = get_the_ID();
  $title = get_the_title();
  $qty = $_POST['quantity'];
  if (isset ($_SESSION['productitems'][$id])) {
    $_SESSION['productitems'][$id] += $qty;
  } else {

    $_SESSION['productitems'][$id] = $qty;
  }
  // echo "<pre>";
  // print_r($_SESSION);
  // echo "</pre>";
}
if (have_posts()) {
  while (have_posts()) {
    the_post();
    ?>
    <div class="container">
      <div class="row m-0">
        <div class="col-lg-4 left-side-product-box pb-3">
          <?php
          $catgories = wp_get_post_terms($post->ID, "product_cat");
          //print_r($catgories)
          ?>
          <div class="row category-list-wrapper">
            <?php
            foreach ($catgories as $catgoriy) {
              ?>
              <span>
                <?php echo $catgoriy->name; ?>
              </span>
              <?php
            }
            ?>
          </div>
          <img src="<?php echo get_the_post_thumbnail_url(get_the_ID()) ?>" class="border p-3" />
        </div>
        <div class="col-lg-8">
          <div class="right-side-pro-detail border p-3 m-0">
            <div class="row">
              <div class="col-lg-12">
                <span>Who What Wear</span>
                <p class="m-0 p-0">
                  <?php the_title(); ?>
                </p>
              </div>
              <div class="col-lg-12">
                <p class="m-0 p-0 price-pro">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                    class="bi bi-currency-rupee" viewBox="0 0 16 16">
                    <path
                      d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                  </svg>
                  <?php $price = get_post_meta($post->ID, 'ecommerce_price');
                  echo number_format($price[0], ((int) $price[0] == $price[0] ? 0 : 2), '.', ',');
                  ;
                  ?>
                </p>
                <hr class="p-0 m-0">
              </div>
              <div class="col-lg-12 pt-2">
                <h5>Product Detail</h5>
                <span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                  quis nostrud exercitation ullamco laboris.</span>
                <hr class="m-0 pt-2 mt-2">
              </div>
              <div class="col-lg-12">
                <h6>Quantity :</h6>
                <input type="number" class="form-control text-center w-100" id="quantity" name="quantity" min="1" />

              </div>
              <div class="col-lg-12 mt-3">
                <div class="row">
                  <div class="col-lg-6 pb-2">

                    <a href="<?php echo get_permalink(94); ?>"><input type="submit" name="submit" value="ADD TO CART"
                        class="btn btn-secondary" /></a>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
    <?php
  }
}
get_footer();
?>