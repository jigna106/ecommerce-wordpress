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










<body>
    <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%"
        style="max-width:100%;background:#e9e9e9;padding:50px 0px">
        <tr>
            <td>
                <table border="0" align="center" cellpadding="0" cellspacing="0" width="100%"
                    style="max-width:600px;background:#ffffff;padding:0px 25px">
                    <tbody>
                        <tr>
                            <td style="margin:0;padding:0">
                                <table border="0" cellpadding="20" cellspacing="0" width="100%"
                                    style="background:#ffffff;color:#1a1a1a;line-height:150%;text-align:center;border-bottom:1px solid #e9e9e9;font-family:300 14px &#39;Helvetica Neue&#39;,Helvetica,Arial,sans-serif">
                                    <tbody>
                                        <tr>
                                            <td valign="top" align="center" width="100"
                                                style="background-color:#ffffff">
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
                                                <h3 style="text-align:center;text-transform:uppercase">Restaurant: China
                                                    Town</h3>
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
                                        foreach ($cart['productitems'] as $product_id => $qty) {
                                            ?>
                                            <tr width="100%">
                                                <td width="30%"
                                                    style="text-align:left;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:0;border-top:0;word-wrap:break-word">
                                                    <?php echo get_the_title($product_id); ?>
                                                </td>
                                                <td width="15%"
                                                    style="text-align:right;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:0;border-top:0">
                                                    <?php echo $qty ?>
                                                </td>
                                                <td width="20%"
                                                    style="text-align:right;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:1px solid #eee;border-top:0">
                                                    <span>
                                                        <?php
                                                        $totals = get_post_meta($product_id, "ecommerce_price", true);
                                                        $subtotal = (int) $totals * (int) $qty;
                                                        ?>

                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                            fill="currentColor" class="bi bi-currency-rupee"
                                                            viewBox="0 0 16 16">
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
                                        <tr>
                                            <th scope="row" colspan="2"
                                                style="text-align:right;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:0;border-top:0">
                                                Cart Subtotal </th>
                                            <th
                                                style="text-align:right;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:1px solid #eee;border-top:0">
                                                <span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                        fill="currentColor" class="bi bi-currency-rupee"
                                                        viewBox="0 0 16 16">
                                                        <path
                                                            d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                                                    </svg>
                                                    <?php echo $grandtotal; ?>
                                                </span>
                                            </th>
                                        </tr>
                                        <tr>
                                            <th scope="row" colspan="2"
                                                style="text-align:right;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:0;border-top:0">
                                                Shipping Charges</th>
                                            <td
                                                style="text-align:right;vertical-align:middle;border-left:1px solid #eee;border-bottom:1px solid #eee;border-right:1px solid #eee;border-top:0">
                                                <span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                        fill="currentColor" class="bi bi-currency-rupee"
                                                        viewBox="0 0 16 16">
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
                                                <span><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                        fill="currentColor" class="bi bi-currency-rupee"
                                                        viewBox="0 0 16 16">
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
                                                    <strong>Email:</strong> <a href="mailto:remuleo@gmail.com"
                                                        target="_blank">
                                                        <?php echo $order['email'] ?>
                                                    </a>
                                                </p>
                                                <p style="margin:0;margin-bottom:10px;padding:0;"><strong>Tel:</strong>
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
                                                <p style="font-size:12px;line-height:130%">Please call <b> 212456</b> in
                                                    case of any doubts or questions. Please reply back to email in case
                                                    of any issues with prices, packing charges, taxes and other menus
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