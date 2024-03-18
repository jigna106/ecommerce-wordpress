<?php /* Template Name: allorders */

get_header();
if($current_user->ID){
$args = array(
    'post_type' => 'shoporder',
    'post_status' => 'draft',
    'author'        =>  $current_user->ID,
);

$my_orders = new WP_Query($args);
// echo "<pre>";
// print_r($my_orders);
// echo "</pre>";]
?>
<div class="container">   
            <div class="admin-cartdata">
                <table style="width:100%">
                    <thead>
                        <tr>
                            <th>order-Id</th>
                            <th>Post Title</th>
                            <th>Total Qty</th>
                            <th>Total Products</th>
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
                $total_product=0;
                $grandtotal = 100;
                foreach ($orderhistory['productitems'] as $product_id => $qty) {
                    $subtotal = get_post_meta($product_id, "ecommerce_price", true) * (int) $qty; 
                   
                    $grandtotal += $subtotal; 
                    $total_qty += $qty;
                    $total_product += 1;
                    
                }
                $id= get_the_ID();
            ?>      
                    <tr>

                        <td><?php  echo get_the_ID() ?></td>
                        <td><?php echo get_the_title(); ?></td>
                        <td><?php echo $total_qty ?></td>
                        <td><?php echo $total_product ?></td>
                        <td><?php echo $grandtotal; ?></td>
                        <td><a href="<?php echo get_permalink(233).'?Order_id=' . $id; ?>"><button class="orderhostory">Your order Details</button></a></td>
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
