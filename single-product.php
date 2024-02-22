<?php
get_header();
if (isset($_POST['submit'])) {

  $id = get_the_ID();
  $title = get_the_title();
  $qty = $_POST['quantity'];
  if (isset($_SESSION['productitems'][$id])) {
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
      <div class="row">
        <div class="col-6 ">
          <div class="card">
            <img src="<?php echo  get_the_post_thumbnail_url(get_the_ID()) ?>">
            </div>
            </div>
            <div class="col-6">
            <form method="post">
              
                <h2 class="card-title"> Price:<?php the_title(); ?></h2>
              

                <h3>Price: <?php $price = get_post_meta($post->ID, 'ecommerce_price');
                                print_r($price[0]);
                                ?>
                    </h3>
               <label for="quantity">Quantity</label>
                <input type="number" id="quantity" name="quantity" min="1" />
                <input type="submit" name="submit" value="ADD TO CART" />
                 
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