<?php session_start();
if (isset($_POST['submit'])) {

  $id = get_the_ID();
  $title = get_the_title();
  $qty = $_POST['quantity'];
  if (isset($_SESSION['productitems'][$id])) {
    $_SESSION['productitems'][$id] += $qty;
  } else {
    $_SESSION['productitems'][$id] = $qty;
  }


  // print_r($_SESSION);
  // echo "</pre>";
  // echo "<pre>";

}
get_header();

if (have_posts()) {
  while (have_posts()) {
    the_post();
    ?>
    <div class="container">
      <?php
      $catgories = wp_get_post_terms($post->ID, "product_cat");
      //print_r($catgories)
      ?>

      <div class="row  justify-content-between">
        <div class="col-12 col-md-12 col-lg-6 img-thumbnail as-img-thumbnail">
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
          <img src="<?php echo get_the_post_thumbnail_url(get_the_ID(), 'full') ?>" height=600px , width=600px />
        </div>
        <div class="col-12 col-md-12 col-lg-6 d-flex align-items-center">
          <form method="post">

            <div class="pt-2">


              <div class="product-title text-bold my-3">

                <div class="about"> <span class="font-weight-bold">
                    <h1>
                      <?php the_title(); ?>
                    </h1>
                  </span>

                </div>


              </div>
            </div>
            <div class="pt-2">
              <h4 class="font-weight-bold"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                  fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                  <path
                    d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                </svg>
                <?php $price = get_post_meta($post->ID, 'ecommerce_price');
                echo number_format($price[0], ((int) $price[0] == $price[0] ? 0 : 2), '.', ',');
                ?>
              </h4>
            </div>
            <div class="pt-2">
              <b>Quantity</b>
              <input type="number" class="w-29" id="quantity" name="quantity" min="1" />
            </div>
            <div class="pt-2">

              <div class="buttons"><a href="<?php echo get_permalink(94); ?>"><input type="submit" name="submit"
                    value="ADD TO CART" class="btn btn-warning btn-long cart" /></a> </div>

            </div>

            <div class="pt-5">

              <div class="product-description">
                <div class="mt-2"> <span class="font-weight-bold">Description</span>
                  <p>The minimalist collaboration features chairs, lightening, Shelves, Sofas, Desks and various
                    home accessories, all offering form and function at the same point.We use high-strength
                    clamps and joinery techniques specially designed for engineered wood beds. Ergo, no irksome
                    creaks - and you can sleep like a baby, well into adulthood!</p>
                  <div class="bullets">
                    <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Best in
                        Quality</span> </div>
                    <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Anti-creak
                        joinery</span> </div>
                    <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Sturdy
                        laminate surfaces</span> </div>
                    <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Relocation
                        friendly design</span> </div>
                    <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">High gloss,
                        high style</span> </div>
                    <div class="d-flex align-items-center"> <span class="dot"></span> <span class="bullet-text">Easy-access
                        hydraulic storage</span> </div>
                  </div>
                </div>


              </div>
            </div>

          </form>
        </div>




      </div>
    </div>
    <?php
  }
}
get_footer();
?>