<?php session_start();
$issucess = "";

global $wpdb;
if (isset($_POST['addtocart'])) {

  if (is_user_logged_in()) {
    $current_user = wp_get_current_user();
    $user_id = (string)$current_user->ID;
  } else if (isset($_COOKIE['user_cart_id'])) {
    $user_id = $_COOKIE['user_cart_id'];
  } else {
    $user_cart_id = random_strings(8);
    setcookie('user_cart_id', $user_cart_id, time() + (86400 * 30), "/");
    $user_id = $user_cart_id;
  }
  $retrieve_data = $wpdb->get_results("SELECT * FROM session_management WHERE cart_user_id='$user_id'", ARRAY_A);
  if (isset($retrieve_data[0])) {
    $data = maybe_unserialize($retrieve_data[0]['session_data']);
    if (isset($data[get_the_ID()])) {
      $data[get_the_ID()] = (int)$data[get_the_ID()] + (int)$_POST['quantity'];
    } else {
      $data[get_the_ID()] = (int)$_POST['quantity'];
    }
    // print_r($data);
    $wpdb->update(
      'session_management',
      array(
        'session_data' => serialize($data),
      ),
      array(
        "cart_user_id" => $user_id
      )
    );
  } else {
    $data[get_the_ID()] = (int)$_POST['quantity'];
    $wpdb->insert(
      'session_management',
      array(
        'cart_user_id' => $user_id,
        'session_data' => serialize($data),
      )
    );
  }
  $issucess = "yes";
}

if (is_user_logged_in()) {
  $current_user = wp_get_current_user();
  $user_id = (string)$current_user->ID;
} else if (isset($_COOKIE['user_cart_id'])) {
  $user_id = $_COOKIE['user_cart_id'];
} else {
  $user_cart_id = random_strings(8);
  setcookie('user_cart_id', $user_cart_id, time() + (86400 * 30), "/");
  $user_id = $user_cart_id;
}
$retrieve_data = $wpdb->get_results("SELECT * FROM session_management WHERE cart_user_id='$user_id'", ARRAY_A);
// print_r($retrieve_data);
get_header();

if (have_posts()) {
  while (have_posts()) {
    the_post();
?>
    <div class="container">
      <?php
      if ($issucess == "yes") { ?>
        <div class="Sucess">
          <div class="alert alert-success" role="alert">
            Item addded to cart!
          </div>
        </div>
      <?php } ?>


      <div id="messages" class="hide" role="alert">
        <div id="messages_content"></div>
      </div>
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
              <h4 class="font-weight-bold"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                  <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                </svg>
                <?php $price = get_post_meta($post->ID, 'ecommerce_price');
                echo number_format($price[0], ((int) $price[0] == $price[0] ? 0 : 2), '.', ',');
                ?>
              </h4>
            </div>
            <div class="pt-2">
              <b>Quantity</b>
              <input type="number" class="w-29" id="quantity" name="quantity" min="1" max="200" value="1"/>
            </div>
            <div class="pt-2">

              <div class="buttons"><a href="<?php echo get_permalink(94); ?>">
                  <input type="submit" name="addtocart" value="ADD TO CART" class="btn btn-warning btn-long cart" id="addtocart" /></a> </div>

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