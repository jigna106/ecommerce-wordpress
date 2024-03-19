<?php /* Template Name: cart */
get_header();
session_start();
// echo "<pre>";
// print_r($_SESSION);
// echo "</pre>";
if (isset($_POST['emptycartsubmit'])) {
        unset($_SESSION['productitems']);
    }
    
    if (isset($_POST['remove'])) {
        $ProductId = $_POST['remove'];
    //    $_SESSION['productitems'][$ProductId ];
         unset($_SESSION['productitems'][$ProductId ]);
    }
    
    if (isset($_POST['qtysubmit'])) {
        $qty = $_POST['quantity'];
        $id = $_POST['hiddenid'];
        $_SESSION['productitems'][$id] = $qty;
    }
    
    if (isset($_SESSION['productitems'])) {
        $grandtotal = 100;
    ?>
        <div class="container mt-5 mb-5">
            <div class="row pt-3">
                <form method="post" class="d-flex justify-content-end align-items-center">
                    <button type="submit" name="emptycartsubmit" class="btn btn-danger">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-trash-fill" viewBox="0 0 16 16">
                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0" />
                        </svg> Empty Cart</button>
    
                </form>
            </div>
            <div class="row">
                <h1 class="d-flex justify-content-center align-items-center">Cart Details</h1>
            </div>
            <div class="row product-section">
                <div class="col-10 product-table">
                    <div class="row">
                        <div class="col-2 pt-3"><b>Image</b></div>
                        <div class="col-2 pt-3"><b>Product</b></div>
                        <div class="col-2 pt-3"><b>Price</b></div>
                        <div class="col-2 pt-3"><b>Quantity</b></div>
                        <div class="col-2 pt-3"><b>Sub Total</b></div>
                        <div class="col-2 pt-3"><b>Remove Product</b></div>
                    </div>
                    <?php
                    foreach ($_SESSION['productitems'] as $product_id => $qty) {
                        $product = get_post($product_id);
                    ?>
    
                        <div class="row">
                            <div class="col-2 pt-3">
                                <img src="<?php echo get_the_post_thumbnail_url($product_id) ?>" width="100px" height="100px">
                            </div>
                            <div class="col-2 pt-3">
                                <?php echo get_the_title($product_id); ?>
                            </div>
                            <div class="col-2 pt-3">
                                <?php echo get_post_meta($product_id, "ecommerce_price", true); ?>
                            </div>
                            <div class="col-2 pt-3">
                                <form method="post">
                                    <input type="hidden" name="hiddenid" value="<?php echo $product_id ?>" />
                                    <input type="number" class="w-75" id="quantity" name="quantity" min="1" value="<?php echo $qty; ?>" />
                                    <input type="submit" name="qtysubmit" value="Update Quantity" />
                                </form>
                            </div>
                            <div class="col-2 pt-3">
                                <?php
                                $subtotal = get_post_meta($product_id, "ecommerce_price", true) * (int) $qty; ?>
                                <?php echo $subtotal;
                                $grandtotal += $subtotal; ?>
    
                            </div>
                            <div class="col-2 pt-3">
                           <form method="post">
                                <button type="submit" name="remove" class="btn btn-danger" value="<?php echo $product_id ?>">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="black" class="bi bi-x" viewBox="0 0 16 16">
                                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708" />
                                    </svg>Remove</button>
                           </form>
                            </div>
                        </div>
    
    
                    <?php
                    }
                    ?>
                </div>
                <div class="col-2 billing-details pt-5">
                    <div class="totals">
                        <div class="totals-item">
                            Shipping:
                            <div class="totals-value" id="cart-shipping"><i class="fa fa-inr"></i>100</div>
                        </div>
                        <div class="totals-item totals-item-total">
                            Grand Total:
                            <div class="totals-value" id="cart-total">
                                <?php echo $grandtotal; ?>
                            </div>
                        </div>
                    </div>
                    <a href="<?php echo get_permalink(103); ?>"><button class="checkout">Checkout</button></a>
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