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
            <button type="submit" name="emptycartsubmit" class="btn btn-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="red" class="bi bi-trash-fill" viewBox="0 0 16 16">
                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0" />
                </svg> Empty Cart</button>
            <!-- <input type="submit" name=emptycartsubmit value="Empty Cart" /> -->
        </form>
    </div>
    <?php
    $grandtotal = 100;
    ?>
    <h1>Bill Summary</h1>
    <div class="container">
    <div class="shopping-cart">
    
    <div class="column-labels">
            <label class="product-image">Image</label>
            <label class="product-details">Product</label>
            <label class="product-price">Price</label>
            <label class="product-quantity">Quantity</label>
            <label class="product-removal">Remove</label>
            <label class="product-line-price">Total</label>
        </div>
    
       
        <?php
        foreach ($_SESSION['productitems'] as $product_id => $qty) {
            $product = get_post($product_id);
        ?>
    
            <div class="product">
                <div class="product-image">
                    <img src="<?php echo  get_the_post_thumbnail_url($product_id) ?>" width="100px" height="100px">
                </div>
                <div class="product-details">
                    <div class="product-title"> <?php echo get_the_title($product_id); ?> </div>
                </div>
                <div class="product-price"><?php echo get_post_meta($product_id, "ecommerce_price", true); ?></div>
                <div class="product-quantity">

                    <form method="post">
                        Quantity :
                        <input type="hidden" name="hiddenid" value="<?php echo $product_id ?>" />
                        <input type="number" id="quantity" name="quantity" min="1" value="<?php echo $qty; ?>" />
                        <input type="submit" name="qtysubmit" value="update quantity" />
                    </form>


                </div>
                <div class="product-removal">
                    <button class="remove-product">
                        Remove
                    </button>
                </div>
                <div class="product-line-price">

                    <p> <?php
                        $subtotal = get_post_meta($product_id, "ecommerce_price", true) * (int)$qty; ?>
                        <?php echo  $subtotal;
                        $grandtotal += $subtotal ?></p>
                </div>
            </div>


        <?php
        }
        ?>
        <div class="totals">
            <div class="totals-item">
                <label>Shipping</label>
                <div class="totals-value" id="cart-shipping">100</div>
            </div>
            <div class="totals-item totals-item-total">
                <label>Grand Total</label>
                <div class="totals-value" id="cart-total"><?php echo $grandtotal; ?></div>
            </div>
        </div>


        <button class="checkout">Checkout</button>
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