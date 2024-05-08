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

      $grandtotal = 100;
      $as_subtotal = 0;
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
            $subtotal = get_post_meta($productId, "ecommerce_price", true) * (int) $qty; ?>
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
      <div class="totals">
      <div class="form-group"> <label>Have coupon?</label>
      <div class="input-group">
        <input type="text" class="form-control coupon" placeholder="Coupon code"  value=<?php echo $_POST['coupon']; ?> />
        <span class="input-group-append"><button class="btn btn-primary btn-apply as_coupon">Apply</button>
        </span>
        <div>
          <span class="input-group-append">Coupen Code "<?php echo $_POST['coupon']; ?>" Apply Sucessfully</span></div>
      </div>
    </div>
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