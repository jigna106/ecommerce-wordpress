<?php /* Template Name: allorders */

get_header();
if ($current_user->ID) {
    $args = array(
        'post_type' => 'shoporder',
        'post_status' => 'draft',
        'author' => $current_user->ID,
    );

    $my_orders = new WP_Query($args);
    // echo "<pre>";
// print_r($my_orders);
// echo "</pre>";
    ?>
    <div class="container">
        <div class="admin-cartdata">
            <table style="width:100%">
                <thead>
                    <tr>
                        <th>Order_No</th>
                        <th>Name</th>
                        <th>Products</th>

                        <th>Grand total</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($my_orders->have_posts()) {
                        while ($my_orders->have_posts()) {
                            $my_orders->the_post();
                            global $post;
                            $orderdata = get_post_meta(get_the_ID(), 'ecommerce_billing_data', true);
                            $orderhistory = get_post_meta(get_the_ID(), 'ecommerce_cart_data', true);

                            $total_qty = 0;
                            $total_product = 0;
                            $grandtotal = 100;
                            if (isset($orderhistory['productitems']) && !empty($orderhistory['productitems'])) {
                                foreach ($orderhistory['productitems'] as $product_id => $qty) {

                                    $totalprice = get_post_meta($product_id, "ecommerce_price", true);

                                    $subtotal = (int) $totalprice * (int) $qty;

                                    $grandtotal += $subtotal;
                                    $total_qty += $qty;
                                    $total_product += 1;

                                }
                            }
                            $id = get_the_ID();
                            ?>
                            <tr>

                                <td>
                                    <?php echo $id ?>

                                </td>
                                <td>
                                    <?php echo get_the_title(); ?>


                                </td>
                                <td>
                                    <?php
                                    foreach ($orderhistory['productitems'] as $product_id => $qty) { ?>

                                        <div>

                                            <?php echo get_the_title($product_id); ?> X
                                            <?php echo $qty ?>

                                        </div>

                                    <?php }
                                    ?>


                                </td>

                                <td>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                        class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                        <path
                                            d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                                    </svg>
                                    <?php echo $grandtotal; ?>
                                </td>
                                <td>
                                    <a href="<?php echo get_permalink(233) . '?Order_id=' . $id; ?>">
                                        <button type="button" class="btn btn-info orderhostory">
                                            Your Order Details</button>
                                    </a>
                                </td>
                            </tr>

                            <?php

                        }
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>
    <?php
}
get_footer();
