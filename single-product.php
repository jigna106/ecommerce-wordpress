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
      <div class="row  justify-content-between">
        <div class="col-6 img-thumbnail">
            <img src="<?php echo  get_the_post_thumbnail_url(get_the_ID()) ?>"   width="100%" height="100%"/>
           </div>
        <div class="col-4 d-flex align-items-center">
          <form method="post">
           
              <div class="pt-5">
               <b>Title: </b><?php the_title(); ?></div>
              <div class="pt-5">
                <b>Price: </b> <?php $price = get_post_meta($post->ID, 'ecommerce_price');
                        print_r($price[0]);
                        ?>
              </div>
              <div class ="pt-5">
               <b>Quantity</b>
                <input type="number" class="w-29" id="quantity" name="quantity" min="1" />
              </div>
              <div class="pt-5">
            <a href="<?php echo get_permalink(94); ?>"><input type="submit" name="submit" value="ADD TO CART" class="btn btn-secondary" /></a>
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