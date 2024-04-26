<?php /* Template Name: checkout */
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
if (is_user_logged_in()) {
  if (isset($_POST['placeorder'])) {
    $post_arr = array(
      'post_title' => $_POST['firstName'] . " " . $_POST['lastName'],
      'post_content' => $_POST['firstName'] . " " . $_POST['lastName'],
      'post_status' => 'draft',
      'post_type' => 'shoporder'
    );
    $id = wp_insert_post($post_arr);
    
    // print_r($id);




     update_post_meta(
      $id,
      'ecommerce_billing_data',
      $_POST
    );
    $retrieve_data = $wpdb->get_results("SELECT * FROM session_management WHERE cart_user_id='$user_id'", ARRAY_A);
    if (isset($retrieve_data[0])) {
    $data = maybe_unserialize($retrieve_data[0]['session_data']);
    }
    update_post_meta(
      $id,
      'ecommerce_cart_data',
      $data
    );
    // exit;
    unset($_POST);
     $wpdb->delete('session_management', ['cart_user_id' => $user_id]);
 
    // unset($_SESSION['productitems']);
    wp_redirect(get_permalink(147) . '?Order_id=' . $id);

  }
  get_header();

  ?>
  <div class="container py-20">
    <form class="" method="post">
      <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
          <h4 class="d-flex justify-content-between align-items-center mb-3">
            <span class="text-secondary">Your cart</span>
          </h4>
          <?php
          
            $retrieve_data = $wpdb->get_results("SELECT * FROM session_management WHERE cart_user_id='$user_id'", ARRAY_A);
            if (isset($retrieve_data[0])) {
            $data = maybe_unserialize($retrieve_data[0]['session_data']);
        }
          $grandtotal = 100;
          foreach ($data as $productId => $qty) {
            $product = get_post($productId);
            ?>
            <ul class="list-group mb-3">
              <li class="list-group-item d-flex justify-content-between lh-condensed">
                <div>
                  <h6 class="my-0">
                    <?php echo get_the_title($productId); ?>
                  </h6>
                  <small class="text-muted">Quantity:
                    <?php echo $qty; ?>
                  </small>
                </div>
                <span class="text-muted"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                    class="bi bi-currency-rupee" viewBox="0 0 16 16">
                    <path
                      d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                  </svg>
                  <?php $subtotal = get_post_meta($productId, "ecommerce_price", true) * (int) $qty; ?>
                  <?php echo $subtotal;
                  $grandtotal += $subtotal;
                  ?>
                </span>
              </li>
              <?php
          }
          ?>
            <li class="list-group-item d-flex justify-content-between">
              <span>Shipping Cost:</span>
              <strong><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                  class="bi bi-currency-rupee" viewBox="0 0 16 16">
                  <path
                    d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                </svg>100</strong>
            </li>
            <li class="list-group-item d-flex justify-content-between">
              <span>GrandTotal(INR)</span>
              <strong> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                  class="bi bi-currency-rupee" viewBox="0 0 16 16">
                  <path
                    d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                </svg>
                <?php echo $grandtotal; ?>
              </strong>
            </li>
          </ul>

          <div class="input-group-append">
            <button class="btn btn-success btn-lg btn-block" type="submit" name="placeorder">Place Order</button>

          </div>
        </div>

        <div class="col-md-8 order-md-1">
          <h4 class="mb-3">Billing address</h4>

          <div class="row">
            <div class="col-md-6 mb-3">
              <label for="firstName">First name</label>
              <input type="text" class="form-control" id="firstName" name="firstName" placeholder="" value="">
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="lastName">Last name</label>
              <input type="text" class="form-control" id="lastName" name="lastName" placeholder="" value="">
              <div class="invalid-feedback">
                Valid last name is required.
              </div>
            </div>
          </div>
          <div class="mb-3">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email">
            <div class="invalid-feedback">
              Please enter a valid email address for shipping updates.
            </div>
          </div>
          <div class="mb-3">
            <label for="address">Address</label>
            <input type="text" class="form-control" id="address" placeholder="" name="address">
            <div class="invalid-feedback">
              Please enter your shipping address.
            </div>
          </div>

          <div class="mb-3">
            <label for="address2">Address 2 <span class="text-muted">(Optional)</span></label>
            <input type="text" class="form-control" id="address2" placeholder="" name="address2">
          </div>

          <div class="row">
            <div class="col-md-5 mb-3">
              <label for="country">Country</label>
              <select class="custom-select d-block w-100" id="country" name="country">
                <option value="">Choose...</option>
                <option>India</option>
              </select>
              <div class="invalid-feedback">
                Please select a valid country.
              </div>
            </div>
            <div class="col-md-4 mb-3">
              <label for="state">State</label>
              <select class="custom-select d-block w-100" id="state" name="state">
                <option value="">Choose...</option>
                <option value="Gujarat">Gujarat</option>
                <option value="Goa">Goa</option>
                <option value="Assam">Assam</option>
                <option value="ArunachalPradesh">ArunachalPradesh</option>
                <option value="Maharashtra">Maharashtra</option>
                <option value="Punjab">Punjab</option>
                <option value="Punjab">Punjab</option>
              </select>
              <div class="invalid-feedback">
                Please provide a valid state.
              </div>
            </div>
            <div class="col-md-3 mb-3">
              <label for="zip">Zip</label>
              <input type="text" class="form-control" id="zip" placeholder="" name="zip">
              <div class="invalid-feedback">
                Zip code required.
              </div>
            </div>
          </div>
          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="same-address">
            <label class="custom-control-label" for="same-address">Shipping address is the same as my billing
              address</label>
          </div>
          <hr class="mb-4">

          <h4 class="mb-3">Payment</h4>
          <div class="d-block my-3">
            <div class="custom-control custom-radio">
              <input type="radio" name="paymentMethod" value="credit" id="credit"
                class="custom-control-input ecommerce-payment-getway" />
              <label class="custom-control-label" for="credit">Credit card</label>
            </div>
            <div class="custom-control custom-radio">
              <input type="radio" name="paymentMethod" value="cash-on-delivery" id="cash-on-delivery"
                class="custom-control-input ecommerce-payment-getway" />
              <label class="custom-control-label" for="cash-on-delivery">Cash On Delivery </label>
            </div>
          </div>
          <div class="payment-cedit-cash">
            <div class="row">
              <div class="col-md-6 mb-3">
                <label for="cc-name">Name on card</label>
                <input type="text" class="form-control" id="cc-name" placeholder="">
                <small class="text-muted">Full name as displayed on card</small>
                <div class="invalid-feedback">
                  Name on card is required
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="cc-number">Credit card number</label>
                <input type="text" class="form-control" id="cc-number" placeholder="">
                <div class="invalid-feedback">
                  Credit card number is required
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-3 mb-3">
                <label for="cc-expiration">Expiration</label>
                <input type="text" class="form-control" id="cc-expiration" placeholder="">
                <div class="invalid-feedback">
                  Expiration date required
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="cc-cvv">CVV</label>
                <input type="text" class="form-control" id="cc-cvv" placeholder="">
                <div class="invalid-feedback">
                  Security code required
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>
  </div>
  <?php
} else {
  get_header();
  echo do_shortcode("[as_authentication_login]");
  ?>


  <?php
}
get_footer();
?>