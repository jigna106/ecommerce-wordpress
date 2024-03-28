<?php /* Template Name: orderdetails*/
get_header();
$id = $_GET['Order_id'];

$productcart = get_post_meta($id, 'ecommerce_cart_data', true);
//   echo "<pre>";
//   print_r($id);
//   print_r($productcart);
//   echo "</pre>";

$data = get_post_meta($id, 'ecommerce_billing_data', true);

echo '<p><strong>' . __('firstname') . ':</strong> ' . $data['firstName'] . '</p>';
echo '<p><strong>' . __('lastname') . ':</strong> ' . $data['lastName'] . '</p>';
echo '<p><strong>' . __('email') . ':</strong> ' . $data['email'] . '</p>';

?>

<div class="admin-cartdata">
  <table style="width:100%">
    <tr>
      <th>Image</th>
      <th>Title</th>
      <th>Qty</th>
      <th>Price</th>
      <th>subTotal</th>
      <th>Grand total</th>
    </tr>
    <?php
    $grandtotal = 100;
    foreach ($productcart['productitems'] as $product_id => $qty) {
      ?>
      <tr>
        <td><img src="<?php echo get_the_post_thumbnail_url($product_id) ?>" width="100px" height="100px"></td>
        <td>
          <?php echo get_the_title($product_id); ?>
        </td>
        <td>
          <?php echo $qty ?>
        </td>
        <td>
          <?php echo get_post_meta($product_id, "ecommerce_price", true); ?>
        </td>
        <td>
          <?php


          $totalprice = get_post_meta($product_id, "ecommerce_price", true);

          $subtotal = (int) $totalprice * (int) $qty;

          ?>
          <?php echo $subtotal;
          $grandtotal += $subtotal; ?>
        </td>
        <?php
    }
    ?>
      <td>
        <?php echo $grandtotal; ?>
      </td>
    </tr>
  </table>
</div>

<?Php
get_footer();
