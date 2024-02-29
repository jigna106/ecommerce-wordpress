<?php /* Template Name: Thankyou */
get_header();
echo "<pre>";
$id = $_GET['Orderid'];
$order = get_post_meta($id, 'ecommerce_billing_data', true);
// print_r(get_post_meta($id));
print_r($order);
echo "</pre>";
?>

<div class="container">
    <div class="row">
    <h3>Thank you.Your order has been received</h3>
    </div>
<div class="row">
<div class="d-flex flex-row  mb-3">
  <div class="p-3 text-secondary">order_id
<div class="text-dark" ><?php echo $id?></div>
</div>
  
  <div class="p-3 text-secondary">Date
  <div class="text-dark"><?php echo date(" jS F Y ") . "<br>"; ?></div></div>
  <div class="p-3 text-secondary">Email
    <div class="text-dark">
        <?php echo $order['email']?>
    </div>
  </div>
  <div class="p-3 text-secondary">PaymentMethod
    <div class="text-dark">
<?php echo $order['paymentMethod'] ?>
  </div>
  </div>
</div>

<h3><strong>Order details</strong></h3>
</div>
</div>
<?php
get_footer();
?>


