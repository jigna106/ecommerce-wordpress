<?php /* Template Name: cart */
get_header();

// echo "<pre>";
// print_r($_SESSION);
// echo "</pre>";

if (isset($_POST['emptycartsubmit'])) {
    unset($_SESSION['productitems']);
}
if (isset($_POST['qtysubmit'])) {
    $qty = $_POST['quantity'];
    $id = $_POST['hiddenid'];
    $_SESSION['productitems'][$id] = $qty;
}

if (isset($_SESSION['productitems'])) {
?>
    <div class="empty-cart">
        <form method="post">
        
        <i class="bi bi-cart">     <input type="submit" name=emptycartsubmit value="Empty Cart" /></i>
        </form>
    </div>
    <?php
 $grandtotal = 100;
    ?>
 <div class="wrapper">
        <h1>Your Bill Summery</h1>
        <div class="project">
            <?php

            foreach ($_SESSION['productitems'] as $product_id => $qty) {
                $product = get_post($product_id);
            ?>
                <div class="shop">

                    <div class="box">

                        <img src="<?php echo  get_the_post_thumbnail_url($product_id) ?>" width="100px" height="100px">
                        <div class="content">
                            Title : <?php echo get_the_title($product_id); ?>
                            Price : <?php echo get_post_meta($product_id, "ecommerce_price", true); ?>
                            <form method="post">
                                Quantity :
                                <input type="hidden" name="hiddenid" value="<?php echo $product_id ?>" />
                                <input type="number" id="quantity" name="quantity" value="<?php echo $qty; ?>">
                                <input type="submit" name="qtysubmit" value="update quantity" />
                            </form>
                            <p> <?php
                                $subtotal = get_post_meta($product_id, "ecommerce_price", true) * (int)$qty; ?>
                                Sub Total : <?php echo  $subtotal;
                                            $grandtotal += $subtotal ?></p>

                        </div>
                    </div>
                </div>




            <?php
            }
            ?>
            <div class="right-bar">
               
                <p><span>Shipping Cost</span><span>100</span></p>
                <hr>
                <p><span>Grand Total</span> <span><?php echo $grandtotal; ?></span>
            </div>
        </div>
    </div>
<?php
} else {
    echo "Your cart empty";
}
?>
<?php
get_footer();
?>