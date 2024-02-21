<?php /* Template Name: cart */ 
get_header();

// echo "<pre>";

// print_r($_SESSION);
// echo "</pre>";

if (isset($_SESSION['productitems'])) {
 
    foreach($_SESSION['productitems'] as $product_id => $qty){
        $product = get_post($product_id);
        ?>
        <div>
            <div>Image : <img src="<?php echo  get_the_post_thumbnail_url($product_id) ?>" width="200px" height="200px"></div>
            <div>Title : <?php echo get_the_title($product_id); ?></div>
            <div>Price : <?php echo get_post_meta($product_id,"ecommerce_price",true); ?></div>
            <div>Quantity : <?php echo $qty; ?></div>
            <div>Sub Total : <?php echo get_post_meta($product_id,"ecommerce_price",true) * (int)$qty; ?></div>
        </div>
        <?php
    }
  

}
else{ 
    echo "Your cart empty";
    
}
?>


<?php
get_footer();
?>




