<h1>Summary Bill</h1>

<div class="shopping-cart">

  <div class="column-labels">
    <label class="product-image">Image</label>
    <label class="product-details">Product</label>
    <label class="product-price">Price</label>
    <label class="product-quantity">Quantity</label>
    <label class="product-removal">Remove</label>
    <label class="product-line-price">Sub Total</label>
  </div>

  <div class="product">
    <div class="product-image">
    <img src="<?php echo  get_the_post_thumbnail_url($product_id) ?>" width="100px" height="100px">
    </div>
    <div class="product-details">
      <div class="product-title"><?php echo get_the_title($product_id); ?></div>
      </div>
    <div class="product-price"><?php echo get_post_meta($product_id, "ecommerce_price", true); ?></div>
    <div class="product-quantity">
    <input type="number" id="quantity" name="quantity" min="1" />
    </div>
    <div class="product-removal">
      <button class="remove-product">
        Remove
      </button>
    </div>
    <div class="product-line-price">
   <p> <?php
                                $subtotal = get_post_meta($product_id, "ecommerce_price", true) * (int)$qty; ?>
                               <?php echo  $subtotal;
                                            $grandtotal += $subtotal ?></p></div>
  </div>
<div class="totals">
    <div class="totals-item">
      <label>Subtotal</label>
      <div class="totals-value" id="cart-subtotal"><?php echo  $subtotal;
                                            $grandtotal += $subtotal ?></div>
    </div>
    <div class="totals-item">
      <label>Shipping</label>
      <div class="totals-value" id="cart-shipping">100</div>
    </div>
    <div class="totals-item totals-item-total">
      <label>Grand Total</label>
      <div class="totals-value" id="cart-total"><?php echo $grandtotal; ?></div>
    </div>
  </div>
      
      <button class="checkout">Checkout</button>

</div>