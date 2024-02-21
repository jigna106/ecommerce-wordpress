<?php /* Template Name: cart */
get_header();

// echo "<pre>";

// print_r($_SESSION);
// echo "</pre>";

if (isset($_SESSION['productitems'])) {

    foreach ($_SESSION['productitems'] as $product_id => $qty) {
        $product = get_post($product_id);
?>
        <div class="cart-item">
            <div class="cart-image">
       
        <img src="<?php echo  get_the_post_thumbnail_url($product_id) ?>" width="100px" height="100px"></div>
            <div class="cart-header">
            Title : <?php echo get_the_title($product_id); ?></div>
            <div class="price-section">
            Price : <?php echo get_post_meta($product_id, "ecommerce_price", true); ?></div>
            <div class="cart-qty">
            Quantity : 
            <input type="number" id="quantity" name="quantity" value="<?php echo $qty; ?>">
            <input type="submit" name="submit" value="update quantity"/></div>
            <div class="price-section">
            Sub Total : <?php echo get_post_meta($product_id, "ecommerce_price", true) * (int)$qty; ?></div>
        </div>
<?php
    }
} else {
    echo "Your cart empty";
}
?>
<?php
get_footer();
?>