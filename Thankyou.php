<?php /* Template Name: Thankyou */
get_header();
echo "<pre>";
$id = $_GET['Order_id'];
$order = get_post_meta($id, 'ecommerce_billing_data', true);
$cart = get_post_meta($id, 'ecommerce_cart_data', true);
// print_r($cart);
// print_r($order);
echo "</pre>";
?>
<div class="container">
  <div class="row">
    <h2><strong>Thank you.Your order has been received</strong></h2>
  </div>
  <div class="row">
    <div class="d-flex flex-row  mb-3">
      <div class="p-3 text-secondary border-end ">order_id
        <div class="text-dark">
          <?php echo $id ?>
        </div>
      </div>

      <div class="p-3 text-secondary border-end ">Date
        <div class="text-dark">
          <?php echo date(" jS F Y ") . "<br>"; ?>
        </div>
      </div>
      <div class="p-3 text-secondary border-end">Email
        <div class="text-dark">
          <?php echo $order['email'] ?>
        </div>
      </div>
      <div class="p-3 text-secondary border-end">PaymentMethod
        <div class="text-dark">
          <?php echo $order['paymentMethod'] ?>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <h3><strong>Order details</strong></h3>
  </div>

  <table class="table">
    <thead>
      <tr>
        <th scope="col">Product</th>
        <th scope="col">Quantity</th>
        <th scope="col">Total</th>
      </tr>
    </thead>
    <tbody>
      <?php
      $grandtotal = 100;
      foreach ($cart['productitems'] as $product_id => $qty) {
        ?>
        <tr>
          <td>
            <?php echo get_the_title($product_id); ?>
          </td>
          <td>
            <?php echo $qty ?>
          </td>
          <td>
            <?php $subtotal = get_post_meta($product_id, "ecommerce_price", true) * (int) $qty; ?>
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
              class="bi bi-currency-rupee" viewBox="0 0 16 16">
              <path
                d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
            </svg>
            <?php echo $subtotal;
            $grandtotal += $subtotal;
            ?>
          </td>
        </tr>
        <?php
      }
      ?>
      <tr>

        <td colspan="1">
          <strong> Shipping Charge</strong>
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
            class="bi bi-currency-rupee" viewBox="0 0 16 16">
            <path
              d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
          </svg>
          <?php echo "100"; ?>
        </td>
      </tr>
      <tr>
        <td>
          <strong> PaymentMethod</strong>
          <?php echo $order['paymentMethod'] ?>
        </td>
      </tr>
      <tr>
        <td>
          <strong> GrandTotal</strong>
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
            class="bi bi-currency-rupee" viewBox="0 0 16 16">
            <path
              d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
          </svg>
          <?php echo $grandtotal; ?>
      </tr>
      </td>
      </tr>
    </tbody>
  </table>
  <div class="row">
    <h3><strong>Billing address</strong></h3>

    <div>
      <?php echo $order['firstName'] . " " . $order['lastName']; ?>
    </div>
    <div>
      <?php echo $order['address']; ?>
    </div>
    <div>
      <?php echo $order['address2'] . " " . $order['state'] . "," . $order['zip']; ?>
    </div>
    <div><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-telephone"
        viewBox="0 0 16 16">
        <path
          d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z" />
      </svg>
      <?php echo "8238437985" ?>
    </div>
    <div><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-envelope"
        viewBox="0 0 16 16">
        <path
          d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1zm13 2.383-4.708 2.825L15 11.105zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741M1 11.105l4.708-2.897L1 5.383z" />
      </svg>
      <?php echo $order['email'] ?>
    </div>
  </div>
</div>
<?php
get_footer();
?>