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
    <form method="post">
        <input type="submit" name=emptycartsubmit value="Empty Cart" />
    </form>

    <?php

    $grandtotal = 100;
    ?>
    <h1>Your Bill Summery</h1>
    <?php
    foreach ($_SESSION['productitems'] as $product_id => $qty) {
        $product = get_post($product_id);
    ?>
        <div class="wrapper">

            <div class="project">
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
                            <p class="btn-area"><i class="bi bi-trash"></i><span class="btn2">Remove</span></p>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    <?php
    }
    ?>
    <div class="right-bar">
        <p><span>Shipping Cost</span> <span>100</span></p>
        <hr>
        <p><span>Grand Total</span> <span><?php echo $grandtotal; ?></span>

    </div>
<?php
} else {
    echo "Your cart empty";
}
?>
<?php
get_footer();
?>