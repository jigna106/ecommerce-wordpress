<?php /* Template Name: orderdetails*/
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
  <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>
        <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
          <tbody>
            <tr>
              <td style="margin:0;padding:0">
                <table border="0" cellpadding="20" cellspacing="0" width="100%"
                  style="background:#ffffff;color:#1a1a1a;line-height:150%;text-align:center;border-bottom:1px solid #e9e9e9;font-family:300 14px &#39;Helvetica Neue&#39;,Helvetica,Arial,sans-serif">
                  <tbody>
                    <tr>
                      <td valign="top" align="center" width="100" style="background-color:#ffffff">
                        <img alt="Swiggy" style="width:134px"
                          src="<?php echo get_theme_file_uri('assets/images/logo1.png'); ?>" />
                      </td>
                    </tr>
                  </tbody>
                </table>

                <br>

                <table border="0" cellpadding="" cellspacing="0" width="100%"
                  style="background:#ffffff;color:#000000;line-height:150%;text-align:center;font:300 16px &#39;Helvetica Neue&#39;,Helvetica,Arial,sans-serif">
                  <tbody>
                    <tr>
                      <td valign="top" width="100">
                        <p>Payment method: <span style="font-size:18px;font-weight:bold">
                            <?php echo $order['paymentMethod'] ?>
                          </span></p>
                        <p>Delivery :<span style="font-size:18px;font-weight:bold">6-7
                            working days</span>
                        </p>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <br>
                <table border="0" cellpadding="20" cellspacing="0" width="100%"
                  style="color:#000000;line-height:150%;text-align:left;font:300 16px &#39;Helvetica Neue&#39;,Helvetica,Arial,sans-serif">
                  <tbody>
                    <tr>
                      <td valign="top" style="font-size:24px;">
                        <span style="text-decoration:underline;">Order No:
                          <?php echo $id ?>
                        </span>
                        <h2
                          style="display:inline-block;font-family:Arial;font-size:24px;font-weight:bold;margin-top:5px;margin-right:0;margin-bottom:5px;margin-left:0;text-align:left;line-height:100%">
                          <?php echo date(" jS F Y ") . "<br>"; ?>
                        </h2>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <table align="center" cellspacing="0" cellpadding="6" width="95%"
                  style="border:0;color:#000000;line-height:150%;text-align:left;font:300 14px/30px &#39;Helvetica Neue&#39;,Helvetica,Arial,sans-serif;"
                  border=".5px">

                  <thead>
                    <tr style="background:#efefef">
                      <th scope="col" width="30%" style="text-align:left;border:1px solid #eee">
                        Product</th>
                      <th scope="col" width="15%" style="text-align:right;border:1px solid #eee">
                        Quantity </th>
                      <th scope="col" width="20%" style="text-align:right;border:1px solid #eee">
                        Price</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $grandtotal = 100;
                    foreach ($cart as $product_id => $qty) {
                      ?>
                      <tr width="100%">
                        <td width="30%"
                          style="text-align:left;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:0;border-top:0;word-wrap:break-word">
                          <?php echo get_the_title($product_id); ?>
                        </td>
                        <td width="15%"
                          style="text-align:right;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:0;border-top:0">
                          x
                          <?php echo $qty ?>
                        </td>
                        <td width="20%"
                          style="text-align:right;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:1px solid #eee;border-top:0">
                          <span>
                            <?php
                            $totals = get_post_meta($product_id, "ecommerce_price", true);
                            $subtotal = (int) $totals * (int) $qty;
                            ?>

                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                              class="bi bi-currency-rupee" viewBox="0 0 16 16">
                              <path
                                d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                            </svg>
                            <?php echo $subtotal;
                            $grandtotal += $subtotal;
                            ?>
                          </span>
                        </td>
                      </tr>
                    </tbody>
                    <?php
                    }
                    ?>
                  <tfoot>
                    <!-- <tr>
                      <th scope="row" colspan="2"
                        style="text-align:right;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:0;border-top:0">
                        Cart Subtotal </th>
                      <th
                        style="text-align:right;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:1px solid #eee;border-top:0">
                        <span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-currency-rupee" viewBox="0 0 16 16">
                            <path
                              d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                          </svg>
                         
                        </span>
                      </th>
                    </tr> -->
                    <tr>
                      <th scope="row" colspan="2"
                        style="text-align:right;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:0;border-top:0">
                        Shipping Charges</th>
                      <td
                        style="text-align:right;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:1px solid #eee;border-top:0">
                        <span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-currency-rupee" viewBox="0 0 16 16">
                            <path
                              d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                          </svg>
                          <?php echo "100"; ?>
                        </span>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row" colspan="2"
                        style="text-align:right;background:#efefef;text-align:right;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:0;border-top:0">
                        Order Total</th>
                      <td
                        style="background:#efefef;text-align:right;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:1px solid #eee;border-top:0;color:#7db701;font-weight:bold">
                        <span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-currency-rupee" viewBox="0 0 16 16">
                            <path
                              d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                          </svg>
                          <?php echo $grandtotal; ?>
                        </span>
                      </td>
                    </tr>
                  </tfoot>
                </table>
                <br>
                <br>
                <table border="0" cellpadding="20" cellspacing="0" width="100%"
                  style="color:#000000;line-height:150%;text-align:left;font:300 14px &#39;Helvetica Neue&#39;,Helvetica,Arial,sans-serif">
                  <tbody>
                    <tr>
                      <td valign="top">
                        <h4 style="font-size:24px;margin:0;padding:0;margin-bottom:10px;">
                          Customer Details</h4>
                        <p style="margin:0;margin-bottom:10px;padding:0;">
                          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                            class="bi bi-envelope" viewBox="0 0 16 16">
                            <path
                              d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1zm13 2.383-4.708 2.825L15 11.105zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741M1 11.105l4.708-2.897L1 5.383z" />
                          </svg>
                          <?php echo $order['email'] ?>

                        </p>
                        <p style="margin:0;margin-bottom:10px;padding:0;"><svg xmlns="http://www.w3.org/2000/svg"
                            width="16" height="16" fill="currentColor" class="bi bi-telephone" viewBox="0 0 16 16">
                            <path
                              d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.6 17.6 0 0 0 4.168 6.608 17.6 17.6 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.68.68 0 0 0-.58-.122l-2.19.547a1.75 1.75 0 0 1-1.657-.459L5.482 8.062a1.75 1.75 0 0 1-.46-1.657l.548-2.19a.68.68 0 0 0-.122-.58zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.68.68 0 0 0 .178.643l2.457 2.457a.68.68 0 0 0 .644.178l2.189-.547a1.75 1.75 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.6 18.6 0 0 1-7.01-4.42 18.6 18.6 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877z" />
                          </svg>
                          8238437985</p>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <table border="0" cellpadding="20" cellspacing="0" width="100%"
                  style="color:#000000;line-height:150%;text-align:left;font:300 14px &#39;Helvetica Neue&#39;,Helvetica,Arial,sans-serif">
                  <tbody>
                    <tr>
                      <td valign="top">
                        <h4 style="font-size:24px;margin:0;padding:0;margin-bottom:10px;">
                          Delivery address</h4>
                        <p>
                          <?php echo $order['firstName'] . " " . $order['lastName']; ?>
                          <br />
                          <?php echo $order['address']; ?>
                          <br />
                          <br />
                          <?php echo $order['address2'] . " " . $order['state'] . "," . $order['zip']; ?>

                        </p>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <br>
                <br>

                <table cellspacing="0" cellpadding="6" width="100%"
                  style="color:#000000;line-height:150%;text-align:left;font:300 16px &#39;Helvetica Neue&#39;,Helvetica,Arial,sans-serif"
                  border="0">
                  <tbody>
                    <tr>
                      <td valign="top" style="text-transform:capitalize">
                        <p style="font-size:12px;line-height:130%"> Please reply back to email in case
                          of any issues with prices, packing charges and other
                          issues.</p>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <br>

                <br>

              </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
  </table>
</div>
<?php
get_footer();

?>