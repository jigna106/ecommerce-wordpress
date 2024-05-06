<?php /* Template Name: cart */

if (is_user_logged_in()) {
    $current_user = wp_get_current_user();
    $user_id = (string)$current_user->ID;
} else if (isset($_COOKIE['user_cart_id'])) {
    $user_id = $_COOKIE['user_cart_id'];
} else {
    $user_cart_id = random_strings(8);
    setcookie('user_cart_id', $user_cart_id, time() + (86400 * 30), "/");
    $user_id = $user_cart_id;
}
$retrieve_data = $wpdb->get_results("SELECT * FROM session_management WHERE cart_user_id='$user_id'", ARRAY_A);
if (isset($retrieve_data[0])) {
    $data = maybe_unserialize($retrieve_data[0]['session_data']);
}
// if (isset($_POST['emptycartsubmit'])) {
//     $wpdb->delete('session_management', ['cart_user_id' => $user_id]);
// }

// if (isset($_POST['remove'])) {
//     // print_r($_POST);
//     $data = maybe_unserialize($retrieve_data[0]['session_data']);
//     unset($data[$_POST['remove']]);
//     // print_r($data);
//     $wpdb->update(
//         'session_management',
//         array(
//             'session_data' => serialize($data),
//         ),
//         array(
//             "cart_user_id" => $user_id
//         )
//     );
// }

// if (isset($_POST['increment'])) {
//     $qty = $_POST['quantity'];
//     $id = $_POST['hiddenid'];
//     // $_SESSION['productitems'][$id] = (int) $qty + 1;
//     $data = maybe_unserialize($retrieve_data[0]['session_data']);
//     $data[$id] = (int) $qty + 1;
//     $wpdb->update(
//         'session_management',
//         array(
//             'session_data' => serialize($data),
//         ),
//         array(
//             "cart_user_id" => $user_id
//         )
//     );
// }

// if (isset($_POST['decrement'])) {
//     $qty = $_POST['quantity'];
//     $id = $_POST['hiddenid'];
//     if ($data[$id] > 0) {
//         $data[$id] = (int) $qty - 1;
//         $wpdb->update(
//             'session_management',
//             array(
//                 'session_data' => serialize($data),
//             ),
//             array(
//                 "cart_user_id" => $user_id
//             )
//         );
//     }
// }

get_header();
if (!empty($data['product'])) {
    $grandtotal = 100;
    $as_subtotal = 0;
?>
    <div class="container mt-5 mb-5">
        <div class="row pt-3 emptycart">
            <form method="post" class="d-flex justify-content-end align-items-center">
                <button type="button" name="emptycartsubmit" class="btn btn-danger emptycart ">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-trash-fill" viewBox="0 0 16 16">
                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0" />
                    </svg> Empty Cart</button>
            </form>
        </div>
        <div class="row">
            <h1 class="d-flex justify-content-center align-items-center">Cart Details</h1>
        </div>
        <div class="row product-section">
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
                            // echo number_format($price, ((int) $price == $price ? 0 : 2), '.', ',');

                            if ($price['sale_price'] != $price['regular_price']) {
                                echo '<del><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>' . number_format($price['regular_price'], ((int) $price['regular_price'] == $price['regular_price'] ? 0 : 2), '.', ',') . '</del><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>' . number_format($price['sale_price'], ((int) $price['sale_price'] == $price['sale_price'] ? 0 : 2), '.', ',');
                            } else {
                            ?>
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                    <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                                </svg>
                            <?php
                                echo number_format($price['regular_price'], ((int) $price['regular_price'] == $price['regular_price'] ? 0 : 2), '.', ',');
                            }
                            ?>


                        </div>
                        <div class="col-2 pt-3">
                            <form method="post" class="product-form">
                                <input type="hidden" name="hiddenid" class="id" value="<?php echo $productId ?>" />
                                <input type="button" value="-" name="decrement" class="decrement" data-id="<?php echo $productId ?>" <?php if ($qty == 1) {
                                                                                                                                            echo "disabled='disabled'";
                                                                                                                                        } ?> />
                                <input type="text" class="w-20 quantity" name="quantity" value="<?php echo $qty; ?>" readonly />
                                <input type="button" value="+" name="increment" class="increment" data-id="<?php echo $productId ?>" />
                            </form>
                        </div>
                        <div class="col-2 pt-3">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                            </svg>
                            <?php

                            $subtotal = $price['sale_price'] * (int) $qty; ?>
                            <?php echo number_format($subtotal);
                            $as_subtotal += $subtotal;
                            $grandtotal += $subtotal; ?>
                        </div>
                        <div class="col-2 pt-3">
                            <form method="post">
                                <button name="remove" type="button" class="btn btn-danger as_cart_item_remove" value="<?php echo $productId ?>" data-id="<?php echo $productId ?>">
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
                        <input type="text" class="form-control coupon" placeholder="Coupon code">
                        <span class="input-group-append"><button class="btn btn-primary btn-apply as_coupon">Apply</button>
                        </span>

                    </div>
                </div>
                <div class="totals">
                    <div class="totals-item">
                        Total Products
                        <div class="totals-value" id="cart-shipping"><i class="fa fa-inr"></i><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                            </svg>
                            <?php
                            echo number_format($as_subtotal)
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
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                            </svg>
                            <?php echo number_format($grandtotal);
                            ?>
                        </div>
                    </div>
                </div>
                <a href="<?php echo get_permalink(103); ?>"><button class="checkout">Checkout</button></a>
            </div>

        </div>
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
                            <a href="<?php echo get_post_type_archive_link('product'); ?>" class=" btn btn-primary cart-btn-transform m-3" data-abc="true">continue shopping <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2" />
                                </svg></a>
                        </div>
                    </div>
                </div>


            </div>

        </div>

    </div>
<?PHP
}
?>
<?php
get_footer();
?>