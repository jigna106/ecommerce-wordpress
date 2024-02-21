<?php
get_header();
if (isset($_POST['submit'])) {

  $id = get_the_ID();
  $title = get_the_title();
$qty = $_POST['quantity'];
  if (isset($_SESSION['productitems'][$id])) 
  {
    $_SESSION['productitems'][$id] += $qty;
  } 
  else {

    $_SESSION['productitems'][$id] = $qty;
  }
  echo "<pre>";
  print_r($_SESSION);
  echo "</pre>";
}
if (have_posts()) {
  while (have_posts()) {
    the_post();
?>
    <div class="product-wrapp">
      <div class="product-picture">
        <img src="<?php echo  get_the_post_thumbnail_url(get_the_ID()) ?>">
        <?php the_content();  ?>
      </div>
      <div class="item-details">
        <div class="title">
          <h1><?php the_title(); ?></h1>
        </div>
        <diV>
          <h1>Price: <?php $price = get_post_meta($post->ID, 'ecommerce_price');
                      print_r($price[0]);
                      ?>
          </h1>
        </div>
        <form method="post">
          <label for="quantity">Quantity</label>
          <input type="number" id="quantity" name="quantity">
          <input type="submit" name="submit" value="ADD TO CART" />
        </form>
      </div>
    </div>

<?php
  }
}
get_footer();
?>