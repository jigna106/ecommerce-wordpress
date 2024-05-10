<?php

function as_cartdata_display()
{

    if (is_user_logged_in()) {
        $current_user = wp_get_current_user();
        $user_id = (string) $current_user->ID;
    } else if (isset($_COOKIE['user_cart_id'])) {
        $user_id = $_COOKIE['user_cart_id'];
    } else {
        $user_cart_id = random_strings(8);
        setcookie('user_cart_id', $user_cart_id, time() + (86400 * 30), "/");
        $user_id = $user_cart_id;
    }
    global $wpdb;
    $retrieve_data = $wpdb->get_results("SELECT * FROM session_management WHERE cart_user_id='$user_id'", ARRAY_A);
    $data = maybe_unserialize($retrieve_data[0]['session_data']);


    $coupon_id = $data['coupen_code'];
    $coupon_discount = get_post_meta($coupon_id, 'as_coupon_discount', true);
    $type_discount = get_post_meta($coupon_id, 'type_discount', true);
}
ob_start();
if (!empty($data['product'])) {
?>
    <div class="col-9 product-table">
        <div class="row">
            <div class="col-2 pt-3"><b>Image</b></div>
            <div class="col-2 pt-3"><b>Product</b></div>
            <div class="col-2 pt-3"><b>Price</b></div>
            <div class="col-2 pt-3"><b>Quantity</b></div>
            <div class="col-2 pt-3"><b>Sub Total</b></div>
            <div class="col-2 pt-3"><b>Remove Product</b></div>
        </div>
        <?php

        $grandtotal_withoutdiscount = 100;
        $as_subtotal_withoutdiscount = 0;
        $as_newsubtotal_withdiscount = 0;
        $as_newgrandtotal_withdiscount = 100;
        foreach ($data['product'] as $productId => $qty) {
        ?>
            <div class="row">
                <div class="col-2 pt-3">
                    <img src="<?php echo get_the_post_thumbnail_url($productId) ?>" width="100px" height="100px">

                </div>
                <div class="col-2 pt-3">
                    <?php echo get_the_title($productId);
                    ?>

                </div>
                <div class="col-2 pt-3">
                    <?php
                    $product_id = $productId;
                    $price = apply_filters("get_product_discountprice", get_post_meta($product_id, 'ecommerce_price', true), $product_id);
                    if ($price['sale_price'] != $price['regular_price']) {
                        echo '<del><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                            . number_format($price['regular_price'], 2, '.', ',') . '</del>
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                            . number_format($price['sale_price'], 2, '.', ',');
                    } else {
                    ?>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                            <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                        </svg>
                    <?php
                        echo number_format($price['regular_price'], 2, '.', ',');
                    }
                    ?>

                </div>
                <div class="col-2 pt-3">
                    <form method="post" class="product-form">

                        <input type="button" value="-" name="decrement" class="decrement" data-id="<?php echo $productId ?>" <?php if ($qty == 1) {
                                                                                                                                    echo "disabled='disabled'";
                                                                                                                                } ?> />
                        <input type="text" class="w-20 quantity" name="quantity" value="<?php echo $qty; ?>" readonly />
                        <input type="button" value="+" name="increment" class="increment" data-id="<?php echo $productId ?>" />
                    </form>
                </div>
                <div class="col-2 pt-3">
                    <?php
                    $subtotal_withoutdiscount = get_post_meta($productId, "ecommerce_price", true) * (int) $qty;
                    $newsubtotal_withdiscount = $price['sale_price'] * (int) $qty;

                    if ($subtotal_withoutdiscount != $newsubtotal_withdiscount) {
                        echo '<del><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                              <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                          </svg>'
                            . number_format($subtotal_withoutdiscount, 2) . '</del>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                          <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                      </svg>'
                            . number_format($newsubtotal_withdiscount, 2);
                    } else {
                    ?>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                            <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                        </svg>
                    <?php
                        echo number_format($subtotal_withoutdiscount, 2);
                    }
                    $as_subtotal_withoutdiscount += $subtotal_withoutdiscount;
                    $as_newsubtotal_withdiscount += $newsubtotal_withdiscount;
                    $grandtotal_withoutdiscount += $subtotal_withoutdiscount;
                    $as_newgrandtotal_withdiscount += $newsubtotal_withdiscount;
                    ?>
                </div>
                <div class="col-2 pt-3">
                    <form method="post">
                        <button name="remove" type="button" class="btn btn-danger as_cart_item_remove" data-id="<?php echo $productId ?>">
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
    <div class="col-3 billing-details pt-5">
        <div class="form-group"> <label>Have coupon?</label>
            <div class="input-group">
                <input type="text" class="form-control coupon" placeholder="Coupon code" value="" />
                <span class="input-group-append"><button class="btn btn-primary btn-apply as_coupon">Apply</button>
                </span>
                <?php
                if (isset($coupon_id) && $coupon_id = $data['coupen_code']) { ?>
                    <div>
                        <span>
                            Copen code "<?php echo get_the_title($coupon_id = $data['coupen_code']) ?>" apply sucessfully
                        </span>
                    </div>
                <?php
                }

                ?>
            </div>
        </div>
        <div class="totals">
            <div class="totals-item">
                Total Products
                <div class="totals-value" id="cart-shipping"><i class="fa fa-inr"></i>
                    <?php
                    if (isset($data['coupen_code']) && $data['coupen_code'] > 0) {
                        if ($type_discount == 'percentage_discount') {
                            $coupenprice_without_discount_totalproduct = (int) $as_subtotal_withoutdiscount * (100 - $coupon_discount) / 100;
                            $coupenprice_without_discount_totalproduct = round($coupenprice_without_discount_totalproduct, 2);

                            $coupenprice_with_disount_totalproduct = (int) $as_newsubtotal_withdiscount * (100 - $coupon_discount) / 100;
                            $coupenprice_with_disount_totalproduct = round($coupenprice_with_disount_totalproduct, 2);
                            
                            echo '<del><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                . number_format($coupenprice_without_discount_totalproduct, 2) . '</del>
                               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                . number_format($coupenprice_with_disount_totalproduct, 2);
                        }  
                         else if ($type_discount == 'fix_discount') {

                            $coupenprice_without_discount_totalproduct = (int) $as_subtotal_withoutdiscount - $coupon_discount;
                            $coupenprice_with_disount_totalproduct = (int) $as_newsubtotal_withdiscount - $coupon_discount;

echo '<del>
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                . number_format($coupenprice_without_discount_totalproduct, 2) . '</del>
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                . number_format($coupenprice_with_disount_totalproduct, 2);
                        }
                    } else {
                        if ($as_subtotal_withoutdiscount != $as_newsubtotal_withdiscount) {
                            echo '<del>
                                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                . number_format($as_subtotal_withoutdiscount, 2) . '</del>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                . number_format($as_newsubtotal_withdiscount, 2);
                        } else {
                            echo number_format($as_subtotal_withoutdiscount, 2);
                        }
                    }
                    ?>
                </div>
            </div>
            <div class="totals-item">
                Delivery charges
                <div class="totals-value" id="cart-shipping"><i class="fa fa-inr"></i><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                        <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                    </svg>100</div>
            </div>
            <div class="totals-item totals-item-total">
                Grand Total
                <div class="totals-value" id="cart-total">

                    <div class="totals-value" id="cart-total">
                        <?php
                        if ($as_subtotal_withoutdiscount != $as_newsubtotal_withdiscount) {
                            echo '<del>
                                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                . number_format($as_subtotal_withoutdiscount, 2) . '</del>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                . number_format($as_newsubtotal_withdiscount, 2);
                        } else {
                            echo number_format($as_subtotal_withoutdiscount, 2);
                        }
                        ?>
                    </div>
                </div>
            </div>
            <a href="<?php echo get_permalink(103); ?>"><button class="checkout">Checkout</button></a>
        </div>
    <?php
} else {
    ?>
        <div class="container-fluid  mt-100">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body cart">
                            <div class="col-sm-12 empty-cart-cls text-center">
                                <img src="https://i.imgur.com/dCdflKN.png" width="130" height="130" class="img-fluid mb-4 mr-3">
                                <h3><strong>Your Cart is Empty</strong></h3>
                                <h4>Add something to make me happy </h4>
                                <a href="<?php echo get_post_type_archive_link('product'); ?>" class=" btn btn-primary cart-btn-transform m-3" data-abc="true">continue
                                    shopping <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2" />
                                    </svg></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    <?php
}
$html = ob_get_clean();

return $html;
