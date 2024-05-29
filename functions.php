<?php
function as_get_image_data_array($attechment_id)
{
    $sizes = get_intermediate_image_sizes();
    $sizes_data = array();
    foreach ($sizes as $size) {
        $src = wp_get_attachment_image_src($attechment_id, $size);
        if ($src) {
            $sizes_data[$size]['url'] = $src[0];
            $sizes_data[$size]['width'] = $src[1];
            $sizes_data[$size]['height'] = $src[2];
        }
    }
    return $sizes_data;
}
function create_custom_post_type()
{
    $products = array(
        'name' => 'Product',
        'label' => __('Product'),
        'supports' => array('title', 'editor', 'author', 'thumbnail', 'excerpt', 'comments', 'custom-fields'),
        'public' => true,
        'has_archive' => true,
        'menu_icon' => 'dashicons-products',
        'show_in_rest' => true,
        'rest_base'          => 'result',
        'rest_controller_class' => 'WP_REST_Posts_Controller',
    );
    add_theme_support('custom-header');
    add_theme_support('automatic-feed-links');
    add_image_size('product-thumb', 300, 300, false);
    add_theme_support('post-thumbnails');

    register_post_type('product', $products);
}
add_action('init', 'create_custom_post_type');


function ecommerce_price_metabox()
{
    add_meta_box('test-meta-id', 'Product Price', 'product_price_display', 'product');
}
add_action('add_meta_boxes', 'ecommerce_price_metabox');
function product_price_display($post)
{

    $Pricevalue = get_post_meta($post->ID, 'ecommerce_price', true);
    $salepricevalue = get_post_meta($post->ID, 'ecommerce_sale_price', true);
?>
    <label for="new_meta"> Product price</label>
    <input type="text" id="price" name="price" value="<?php echo $Pricevalue ?>" /><br>
    <lable for="sale price">Sale price</lable>
    <input type="text" id="saleprice" name="saleprice" value="<?php echo $salepricevalue ?>" />
<?php
}

function save_postdata($post_id)
{
    if (array_key_exists('price', $_POST)) {
        update_post_meta(
            $post_id,
            'ecommerce_price',
            $_POST['price']
        );
    }
}
add_action('save_post', 'save_postdata');
function save_saleprice($post_id)
{
    if (array_key_exists('saleprice', $_POST)) {
        update_post_meta(
            $post_id,
            'ecommerce_sale_price',
            $_POST['saleprice']
        );
    }
}
add_action('save_post', 'save_saleprice');
function add_product_taxonomy()
{
    $args = array(
        'label' => __('Brand'),
        'slug' => __('brand'),
        'hierarchical' => true,
        'public' => true,
        'has_archive' => true,
        'publicly_queryable' => true,
        'show_ui' => true,
        'show_in_menu' => true,
        'show_in_nav_menus' => true,

    );
    register_taxonomy('brand', 'product', $args);
    $args = array(
        'label' => __('Category'),
        'slug' => __('product_cat'),
        'hierarchical' => true,
        'has_archive' => true,
        'public' => true,
        'publicly_queryable' => true,
        'show_ui' => true,
        'show_in_menu' => true,
        'show_in_nav_menus' => true,

    );
    register_taxonomy('product_cat', 'product', $args);

    $args = array(
        'label' => __('Color'),
        'slug' => __('color'),
        'hierarchical' => true,
        'has_archive' => true,
        'public' => true,
        'publicly_queryable' => true,
        'show_ui' => true,
        'show_in_menu' => true,
        'show_in_nav_menus' => true,

    );
    register_taxonomy('color', 'product', $args);
}
add_action('init', 'add_product_taxonomy');

add_action('brand_add_form_fields', 'add_term_image', 10, 2);
add_action('product_cat_add_form_fields', 'add_term_image', 10, 2);
add_action('color_add_form_fields', 'add_term_image', 10, 2);

function add_term_image()
{
?>
    <div class="form-field term-group">
        <label for="">Upload and Image</label>
        <input type="text" name="txt_upload_image" id="txt_upload_image" value="" style="width: 77%">
        <input type="button" id="upload_image_btn" class="button" value="Upload an Image" />
    </div>
<?php
}

add_action('brand_edit_form_fields', 'edit_image_upload', 10, 2);
add_action('product_cat_edit_form_fields', 'edit_image_upload', 10, 2);
add_action('Color_edit_form_fields', 'edit_image_upload', 10, 2);


function edit_image_upload($term, $taxonomy)
{
    $txt_upload_image = get_term_meta($term->term_id, 'term_image', true);
?>
    <div class="form-field term-group">
        <label for="">Upload and Image</label>
        <input type="text" name="txt_upload_image" id="txt_upload_image" value="<?php echo $txt_upload_image ?>" style="width: 77%">
        <input type="button" id="upload_image_btn" class="button" value="Upload an Image" />
    </div>
<?php
}

add_action('created_brand', 'save_term_image', 10, 2);
add_action('created_product_cat', 'save_term_image', 10, 2);
add_action('created_Color', 'save_term_image', 10, 2);
function save_term_image($term_id, $tt_id)
{
    if (isset($_POST['txt_upload_image']) && '' !== $_POST['txt_upload_image']) {
        $group = ($_POST['txt_upload_image']);
        add_term_meta($term_id, 'term_image', $group, true);
    }
}
add_action('edited_brand', 'update_image_upload', 10, 2);
add_action('edited_product_cat', 'update_image_upload', 10, 2);
add_action('edited_Color', 'update_image_upload', 10, 2);
function update_image_upload($term_id, $tt_id)
{
    if (isset($_POST['txt_upload_image']) && '' !== $_POST['txt_upload_image']) {
        $group = ($_POST['txt_upload_image']);
        update_term_meta($term_id, 'term_image', $group);
    }
}

function wpdocs_theme_name_scripts()
{

    global $wpdb;
    if (is_user_logged_in()) {
        $current_user = wp_get_current_user();
        $user_id = (string) $current_user->ID;
    } else if (isset($_COOKIE['user_cart_id'])) {
        $user_id = $_COOKIE['user_cart_id'];
    } else {
        $user_cart_id = random_strings(8);
        setcookie('user_cart_id', $user_cart_id, time() + (86400 * 30), "/");
        $user_id = $user_cart_id;
    }
    $retrieve_data = $wpdb->get_results("SELECT * FROM session_management WHERE cart_user_id='$user_id'", ARRAY_A);
    if (isset($retrieve_data[0])) {
        $data = maybe_unserialize($retrieve_data[0]['session_data']);
    }
    // $data = maybe_unserialize($retrieve_data[0]['session_data']);
    wp_enqueue_style('ecommerce-boostrap-icon-css', get_template_directory_uri() . '/assets/css/bootstrap-icons.css');
    wp_enqueue_style('ecommerce-style-css', get_template_directory_uri() . '/assets/css/style.css', rand(), true);
    wp_enqueue_style('ecommerce-boostrap-css', get_template_directory_uri() . '/assets/css/bootstrap.min.css', rand(), true);
    wp_enqueue_style('ecommerce-swiper-css', get_template_directory_uri() . '/assets/css/swiper.css', rand(), true);
    wp_enqueue_script('jquery');
    wp_enqueue_editor();
    wp_enqueue_script('ecommerce-swiper-script', get_template_directory_uri() . '/assets/js/swiper-bundle.min.js');
    wp_enqueue_script('ecommerce-script', get_template_directory_uri() . '/assets/js/bootstrap.bundle.min.js', array(), rand(), true);
    wp_enqueue_script('ecommerce-script-texteditor', get_template_directory_uri() . '/assets/js/texteditor.js', array('jquery'), rand(), true);
    wp_enqueue_script('ecommerce-main-script', get_template_directory_uri() . '/assets/js/main.js', array('jquery'), rand(), true);


    wp_localize_script(
        'ecommerce-main-script',
        'as_ecommerce_ajax_object',
        array(
            'ajax_url' => admin_url('admin-ajax.php'),
            'cart_itmes_data' => count(isset($data['product']) ? $data['product'] : array()),
            'rest_url' => get_rest_url() . "v1/as-post/"
        )
    );
}
add_action('wp_enqueue_scripts', 'wpdocs_theme_name_scripts');


add_action('wp_ajax_nopriv_as_get_product_filter_color', 'as_get_product_filter_color');
add_action('wp_ajax_as_get_product_filter_color', 'as_get_product_filter_color');

add_action('wp_ajax_nopriv_as_contactdata', 'as_contactdata');
add_action('wp_ajax_as_contactdata', 'as_contactdata');






function as_contactdata()
{
    print_r($_POST);

    $Contactdata = array(

        'post_title' => $_POST['data']['Firstname'] . " " . $_POST['data']['Lastname'],
        'post_content' => $_POST['data']['Firstname'] . " " . $_POST['data']['Lastname'],
        'post_type' => 'contact'
    );
    $id = wp_insert_post($Contactdata);
    print_r($id);


    update_post_meta(
        $id,
        'contact_data',
        $_POST
    );
}

function as_get_product_filter_color()
{
    $tax_query = array('relation' => 'AND');
    if (isset($_POST['colors'])) {
        array_push(
            $tax_query,
            array(
                'taxonomy' => 'color',
                'field' => 'name',
                'terms' => $_POST['colors'],
            )
        );
    }

    if (isset($_POST['catgories'])) {
        array_push(
            $tax_query,
            array(
                'taxonomy' => 'product_cat',
                'field' => 'name',
                'terms' => $_POST['catgories'],
            )
        );
    }
    if (isset($_POST['brands'])) {
        array_push(
            $tax_query,
            array(
                'taxonomy' => 'brand',
                'field' => 'name',
                'terms' => $_POST['brands'],
            )
        );
    }
    $args = array(
        'post_type' => 'product',
        'tax_query' => $tax_query,
        'posts_per_page' => $_POST['page_size'],
        'paged' => $_POST['page']

    );

    // echo "<pre>";
    // print_r($args);
    // echo "</pre>";
    $color = new WP_Query($args);

?>
    <?php
    if ($color->have_posts()) {
        while ($color->have_posts()) {
            $color->the_post();
            global $post;
    ?>
            <div class="col-3 pt-3 ">
                <?php
                $catgories = wp_get_post_terms($post->ID, "product_cat");
                //print_r($catgories)
                ?>
                <div class="row category-list-wrapper">
                    <?php
                    foreach ($catgories as $catgoriy) {
                    ?>
                        <span>
                            <?php echo $catgoriy->name; ?>
                        </span>
                    <?php
                    }
                    ?>
                </div>
                <a href="<?php echo get_permalink() ?>" class="font-weight-bold text-decoration-none text-body">
                    <div class="col-4">
                        <img src="<?php echo get_the_post_thumbnail_url(get_the_ID()) ?>" width="200px" height="200px">
                    </div>
                    <div class="col-12 pt-3 text-uppercase text-lg">
                        <?php the_title(); ?>
                    </div>
                    <div>
                        Price:
                        <?php
                        $product_id = $post->ID;
                        $price = apply_filters("get_product_discountprice", get_post_meta($post->ID, 'ecommerce_price', true), $product_id);

                        if ($price['sale_price'] != $price['regular_price']) {
                            echo '<del><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                . number_format($price['regular_price'], ((int) $price['regular_price'] == $price['regular_price'] ? 0 : 2), '.', ',') . '</del><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                . number_format($price['sale_price'], ((int) $price['sale_price'] == $price['sale_price'] ? 0 : 2), '.', ',');
                        } else {
                        ?>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                            </svg>
                        <?php
                            echo number_format($price['regular_price'], ((int) $price['regular_price'] == $price['regular_price'] ? 0 : 2), '.', ',');
                        }
                        // print_r($product_id);
                        ?>

                    </div>
                </a>
            </div>
    <?php
        }
    }
    ?>

    <div class="pagination-size">
        <div class="page-size">
            <label> Select Size</label>
            <select name="select-size" id="select-size" class="select-size" value="select size">
                <option value="1" <?php if (isset($_POST['page_size']) && $_POST['page_size'] == "1") {
                                        echo "selected='selected'";
                                    } ?>> 1 </option>
                <option value="2" <?php if (isset($_POST['page_size']) && $_POST['page_size'] == "2") {
                                        echo "selected='selected'";
                                    } ?>> 2 </option>
                <option value="3" <?php if (isset($_POST['page_size']) && $_POST['page_size'] == "3") {
                                        echo "selected='selected'";
                                    } ?>> 3 </option>
                <option value="4" <?php if (isset($_POST['page_size']) && $_POST['page_size'] == "4") {
                                        echo "selected='selected'";
                                    } ?>> 4 </option>
                <option value="12" <?php if (isset($_POST['page_size']) && $_POST['page_size'] == "12") {
                                        echo "selected='selected'";
                                    } ?>> 12 </option>

            </select>
        </div>



        <div class="as-page-number">
            <input type="hidden" class="page-number-hidden" value="1" />
            <ul class="pagination justify-content-center">
                <li class="page-item"><input type="button" name="backward" value="<" class="backward page-link" <?php if ($_POST['page'] == 1) {
                                                                                                                    echo "disabled='disabled'";
                                                                                                                } ?> /></li>
                <?php
                for ($i = 1; $i <= ($color->max_num_pages); $i++) {
                ?>
                    <li class="page-item"><input type="button" name="page-number" value="<?php echo $i ?>" class="page-number page-link <?php
                                                                                                                                        if ($i == $_POST['page']) {
                                                                                                                                            echo "active";
                                                                                                                                        }
                                                                                                                                        ?>" />
                    </li>
                <?php
                }
                ?>
                <li class="page-item"> <input type="button" name="forward" value=">" class="forward page-link" <?php if ($_POST['page'] == $color->max_num_pages) {
                                                                                                                    echo "disabled='disabled'";
                                                                                                                } ?> /></li>

        </div>
    </div>
    <?php
    exit;
    ?>
<?php
}
function admin_css()
{
    wp_enqueue_style('ecommerce-admin-style-css', get_template_directory_uri() . '/assets/css/admin.css', rand(), true);
    wp_enqueue_media();
    wp_enqueue_script('ecommerce-admin-script', get_template_directory_uri() . '/assets/js/admin.js', array(), rand(), true);
}
add_action('admin_enqueue_scripts', 'admin_css');

function register_my_menus()
{
    register_nav_menus(
        array(
            'header-menu' => __('header-menu'),

        )
    );
}
add_action('init', 'register_my_menus');


function shop_orders()
{
    $Orders = array(
        'name' => 'Shoporder',
        'label' => __('Shoporder'),
        'supports' => array('title', 'editor', 'author'),
        'public' => true,
        'has_archive' => true,
        'menu_icon' => 'dashicons-update'
    );

    register_post_type('shoporder', $Orders);
}
add_action('init', 'shop_orders');

function my_custom_status_creation()
{
    register_post_status(
        'completed',
        array(
            'label' => _x('Completed', 'post'),
            'label_count' => _n_noop('Completed <span class="count">(%s)</span>', 'Completed <span class="count">(%s)</span>'),
            'public' => true,
            'exclude_from_search' => false,
            'show_in_admin_all_list' => true,
            'show_in_admin_status_list' => true
        )
    );
    register_post_status(
        'proccesing',
        array(
            'label' => _x('Proccesing', 'post'),
            'label_count' => _n_noop('Proccesing <span class="count">(%s)</span>', 'Proccesing <span class="count">(%s)</span>'),
            'public' => true,
            'exclude_from_search' => false,
            'show_in_admin_all_list' => true,
            'show_in_admin_status_list' => true
        )
    );
    register_post_status(
        'pending_payment',
        array(
            'label' => _x('Pending_Payment', 'post'),
            'label_count' => _n_noop('pending_payment <span class="count">(%s)</span>', 'Pending Payment <span class="count">(%s)</span>'),
            'public' => true,
            'exclude_from_search' => false,
            'show_in_admin_all_list' => true,
            'show_in_admin_status_list' => true
        )
    );
}
add_action('init', 'my_custom_status_creation');

function my_custom_status_add_in_quick_edit()
{
    echo "<script>
    jQuery(document).ready( function() {
        jQuery( 'select[name=\"_status\"]' ).append( '<option value=\"completed\">Completed</option>' );  
        jQuery( 'select[name=\"_status\"]' ).append( '<option value=\"proccesing\">Proccesing</option>' );   
        jQuery( 'select[name=\"_status\"]' ).append( '<option value=\"pending_payment\">pending_payment</option>' );       
    }); 
    </script>";
}
add_action('admin_footer-edit.php', 'my_custom_status_add_in_quick_edit');

function my_custom_status_add_in_post_page()
{
    echo "<script>
    jQuery(document).ready( function() {        
        jQuery( 'select[name=\"post_status\"]' ).append( '<option value=\"completed\">completed</option>' );
        jQuery( 'select[name=\"post_status\"]' ).append( '<option value=\"Proccesing\">Proccesing</option>' );
        jQuery( 'select[name=\"post_status\"]' ).append( '<option value=\"pending_payment\">pending_payment</option>' );
      });
 </script>";
}
add_action('admin_footer-post.php', 'my_custom_status_add_in_post_page');
add_action('admin_footer-post-new.php', 'my_custom_status_add_in_post_page');


function ecommerce_billingdata_()
{
    add_meta_box('billing-id', 'Billing-Data', 'billingdata_display', 'shoporder');
}
add_action('add_meta_boxes', 'ecommerce_billingdata_');

function billingdata_display($post)
{
    $data = get_post_meta($post->ID, 'ecommerce_billing_data', true);
    // print_r($data);
    echo '<p><strong>' . __('firstname') . ':</strong> ' . $data['firstName'] . '</p>';
    echo '<p><strong>' . __('lastname') . ':</strong> ' . $data['lastName'] . '</p>';
    echo '<p><strong>' . __('email') . ':</strong> ' . $data['email'] . '</p>';
    echo '<p><strong>' . __('Address') . ':</strong> ' . $data['address'] . '</p>';
    echo '<p><strong>' . __('paymentmethod') . ':</strong> ' . $data['paymentMethod'] . '</p>';
}

function ecommerce_cartdata()
{
    add_meta_box('cart-id', 'Cart-Data', 'ecommerce_cartdata_display', 'shoporder');
}
add_action('add_meta_boxes', 'ecommerce_cartdata');
function ecommerce_cartdata_display($post)
{

    $cartdata['product'] = get_post_meta($post->ID, 'ecommerce_cart_data', true);
    // print_r($cartdata);
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
            foreach ($cartdata['product'] as $product_id => $qty) {
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
<?php
}
function contact()
{
    $Contact = array(
        'name' => 'Contact',
        'label' => __('Contact'),
        'supports' => array('title', 'editor', 'author'),
        'public' => true,
        'has_archive' => true,
        'menu_icon' => 'dashicons-format-chat'
    );

    register_post_type('contact', $Contact);
}
add_action('init', 'contact');
function contact_data_()
{
    add_meta_box('contact_data_id', 'Contact-Data', 'contact_data__display', 'contact');
}
add_action('add_meta_boxes', 'contact_data_');

function contact_data__display($post)
{

    $contactdata = get_post_meta($post->ID, 'contact_data', true);
    //  print_r($contactdata);
    echo '<p><strong>' . __('firstname') . ':</strong> ' . $contactdata['data']['Firstname'] . '</p>';
    echo '<p><strong>' . __('lastname') . ':</strong> ' . $contactdata['data']['Lastname'] . '</p>';
    echo '<p><strong>' . __('email') . ':</strong> ' . $contactdata['data']['Email'] . '</p>';
    echo '<p><strong>' . __('phonenumber') . ':</strong> ' . $contactdata['data']['phone'] . '</p>';
    echo '<p><strong>' . __('Message') . ':</strong> ' . $contactdata['data']['Message'] . '</p>';
}
function random_strings($length_of_string)
{

    // String of all alphanumeric character
    $str_result = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';

    // Shuffle the $str_result and returns substring
    // of specified length
    return substr(
        str_shuffle($str_result),
        0,
        $length_of_string
    );
}

function userid_login_replce()
{
    global $wpdb;
    if (is_user_logged_in() && isset($_COOKIE['user_cart_id'])) {
        $user_id = $_COOKIE['user_cart_id'];
        //  print_r($user_id);
        $wpdb->update(
            'session_management',
            array(
                "cart_user_id" => get_current_user_id()
            ),
            array(
                "cart_user_id" => $user_id
            )
        );
        unset($_COOKIE['user_cart_id']);
    }
}
add_action('init', 'userid_login_replce');


add_action('wp_ajax_nopriv_as_update_qty', 'as_update_qty');
add_action('wp_ajax_as_update_qty', 'as_update_qty');

function as_update_qty()
{
    // print_r($_POST);
    if (is_user_logged_in()) {
        $current_user = wp_get_current_user();
        $user_id = (string) $current_user->ID;
    } else if (isset($_COOKIE['user_cart_id'])) {
        $user_id = $_COOKIE['user_cart_id'];
    } else {
        $user_cart_id = random_strings(8);
        setcookie('user_cart_id', $user_cart_id, time() + (86400 * 30), "/");
        $user_id = $user_cart_id;
    }
    global $wpdb;
    $retrieve_data = $wpdb->get_results("SELECT * FROM session_management WHERE cart_user_id='$user_id'", ARRAY_A);
    $data = maybe_unserialize($retrieve_data[0]['session_data']);
    $qty = $_POST['qtyupdate'];
    $id = $_POST['id'];
    if ($data['product'][$id] > 0) {
        $data['product'][$id] = (int) $qty;
        $wpdb->update(
            'session_management',
            array(
                'session_data' => serialize($data),
            ),
            array(
                "cart_user_id" => $user_id
            )
        );
    }

    $html = as_cartdata_display();

    echo json_encode(array("html" => $html, "cartproductcount" => count($data['product'])));
    exit;
}
add_action('wp_ajax_nopriv_as_update_decrement_qty', 'as_update_decrement_qty');
add_action('wp_ajax_as_update_decrement_qty', 'as_update_decrement_qty');

function as_update_decrement_qty()
{
    // print_r($_POST);
    if (is_user_logged_in()) {
        $current_user = wp_get_current_user();
        $user_id = (string) $current_user->ID;
    } else if (isset($_COOKIE['user_cart_id'])) {
        $user_id = $_COOKIE['user_cart_id'];
    } else {
        $user_cart_id = random_strings(8);
        setcookie('user_cart_id', $user_cart_id, time() + (86400 * 30), "/");
        $user_id = $user_cart_id;
    }
    global $wpdb;
    $retrieve_data = $wpdb->get_results("SELECT * FROM session_management WHERE cart_user_id='$user_id'", ARRAY_A);
    $data = maybe_unserialize($retrieve_data[0]['session_data']);
    $qty = $_POST['qtyupdate'];
    $id = $_POST['id'];

    $data['product'][$id] = (int) $qty;
    $wpdb->update(
        'session_management',
        array(
            'session_data' => serialize($data),
        ),
        array(
            "cart_user_id" => $user_id
        )
    );

    $html = as_cartdata_display();
    echo json_encode(array("html" => $html, "cartproductcount" => count($data['product'])));
    exit;
}

add_action('wp_ajax_nopriv_as_removeproduct', 'as_removeproduct');
add_action('wp_ajax_as_removeproduct', 'as_removeproduct');

function as_removeproduct()
{
    if (is_user_logged_in()) {
        $current_user = wp_get_current_user();
        $user_id = (string) $current_user->ID;
    } else if (isset($_COOKIE['user_cart_id'])) {
        $user_id = $_COOKIE['user_cart_id'];
    } else {
        $user_cart_id = random_strings(8);
        setcookie('user_cart_id', $user_cart_id, time() + (86400 * 30), "/");
        $user_id = $user_cart_id;
    }
    global $wpdb;
    $retrieve_data = $wpdb->get_results("SELECT * FROM session_management WHERE cart_user_id='$user_id'", ARRAY_A);
    $data = maybe_unserialize($retrieve_data[0]['session_data']);
    //  print_r($data);
    unset($data['product'][$_POST['id']]);

    $wpdb->update(
        'session_management',
        array(
            'session_data' => serialize($data),
        ),
        array(
            "cart_user_id" => $user_id
        )
    );
    $html = as_cartdata_display();
    echo json_encode(array("html" => $html, "cartproductcount" => count($data['product'])));
    exit;
}

add_action('wp_ajax_nopriv_as_emptycart', 'as_emptycart');
add_action('wp_ajax_as_emptycart', 'as_emptycart');

function as_emptycart()
{
    if (is_user_logged_in()) {
        $current_user = wp_get_current_user();
        $user_id = (string) $current_user->ID;
    } else if (isset($_COOKIE['user_cart_id'])) {
        $user_id = $_COOKIE['user_cart_id'];
    } else {
        $user_cart_id = random_strings(8);
        setcookie('user_cart_id', $user_cart_id, time() + (86400 * 30), "/");
        $user_id = $user_cart_id;
    }
    global $wpdb;
    $wpdb->delete('session_management', ['cart_user_id' => $user_id]);
    ob_start();
?>
    <div class="container-fluid  mt-100">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body cart">
                        <div class="col-sm-12 empty-cart-cls text-center">
                            <img src="https://i.imgur.com/dCdflKN.png" width="130" height="130" class="img-fluid mb-4 mr-3">
                            <h3><strong>Your Cart is Empty</strong></h3>
                            <h4>Add something to make me happy </h4>
                            <a href="<?php echo get_post_type_archive_link('product'); ?>" class=" btn btn-primary cart-btn-transform m-3" data-abc="true">continue
                                shopping <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2" />
                                </svg></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
<?php
    exit;
}

add_action("wp", "product_discount");

function product_discount()
{
    $obj = get_queried_object();

    // print_r($obj);
    if (is_singular('product') && $obj->post_type == "product") {
        global $wpdb;
        if (is_user_logged_in()) {
            $current_user = wp_get_current_user();
            $user_id = (string) $current_user->ID;
            $post_id = $obj->ID;
            $product_data = $wpdb->get_results("SELECT * FROM product_discount WHERE user_id=$user_id AND product_id=$post_id");
            if (!empty($product_data)) {
                $addcount = $product_data[0]->count_product + 1;

                $wpdb->update(
                    'product_discount',
                    array(
                        'count_product' => $addcount,
                    ),
                    array(
                        'user_id' => $user_id,
                        'product_id' => $post_id,
                    )
                );
            } else {
                $wpdb->insert(
                    'product_discount',
                    array(
                        'user_id' => $user_id,
                        'product_id' => $post_id,
                        'count_product' => 1
                    )
                );
            }
        }
    }
}
add_filter("get_product_discountprice", "get_product_discountprice", 10, 2);

function get_product_discountprice($price, $product_id)
{
    global $wpdb;
    if (is_user_logged_in()) {
        $current_user = wp_get_current_user();
        $user_id = (string) $current_user->ID;
        $product_data = $wpdb->get_results("SELECT * FROM product_discount WHERE user_id=$user_id AND product_id=$product_id", ARRAY_A);

        if ($product_data && $product_data[0]['count_product'] > 3) {
            $discounted_price = (int) $price - ((int) $price * 0.10);
            $discounted_price = round($discounted_price, 2);
            return array("sale_price" => $discounted_price, "regular_price" => (int) $price);
        } else {
            return array("sale_price" => (int) $price, "regular_price" => (int) $price);
        }
    }
    return array("sale_price" => (int) $price, "regular_price" => (int) $price);
}



// register a custom post type for coupon

function as_coupon()
{
    $Coupon = array(
        'name' => 'Coupon',
        'label' => __('Coupon'),
        'supports' => array('title', 'editor', 'author'),
        'public' => true,
        'has_archive' => true,
        'menu_icon' => 'dashicons-money-alt'
    );

    register_post_type('as_coupon', $Coupon);
}
add_action('init', 'as_coupon');

add_action('wp_ajax_nopriv_as_couponcode', 'as_couponcode');
add_action('wp_ajax_as_couponcode', 'as_couponcode');

function as_couponcode()
{
    // print_r($_POST);
    global $wpdb;

    $args = array(
        'post_type' => 'as_coupon',
        's' => $_POST['coupon']

    );
    $posts = new WP_Query($args);
    // echo "<pre>";
    // print_r($posts);

    if ($posts->have_posts()) {
        $coupon_id = $posts->post->ID;
        if (is_user_logged_in()) {
            $current_user = wp_get_current_user();
            $user_id = (string) $current_user->ID;
        } else if (isset($_COOKIE['user_cart_id'])) {
            $user_id = $_COOKIE['user_cart_id'];
        } else {
            $user_cart_id = random_strings(8);
            setcookie('user_cart_id', $user_cart_id, time() + (86400 * 30), "/");
            $user_id = $user_cart_id;
        }
        global $wpdb;
        $retrieve_data = $wpdb->get_results("SELECT * FROM session_management WHERE cart_user_id='$user_id'", ARRAY_A);
        $data = maybe_unserialize($retrieve_data[0]['session_data']);

        $data['coupen_code'] = $coupon_id;
        $wpdb->update(
            'session_management',
            array(
                'session_data' => serialize($data),
            ),
            array(
                "cart_user_id" => $user_id
            )
        );
    }


    $html = as_cartdata_display();
    echo json_encode(array("html" => $html, "cartproductcount" => count($data['product'])));
    exit;
}


function as_couponcode_metabox()
{
    add_meta_box('test-meta-id', 'Coupon Discount', 'Coupon_Discount_display', 'as_coupon');
}
add_action('add_meta_boxes', 'as_couponcode_metabox');

function Coupon_Discount_display($post)
{

    $coupon_discount = get_post_meta($post->ID, 'as_coupon_discount', true);
    $type_discount = get_post_meta($post->ID, 'type_discount', true);
?>
    <label for="new_meta"> Coupon amount</label>
    <input type="text" id="as_discount_id" name="as_discount_id" value="<?php echo $coupon_discount ?>" /></br>
    <label for="new_meta">Discount type:</label><br>
    <input type="radio" name="type_discount" value="fix_discount" <?php checked($type_discount, 'fix_discount'); ?>>Fix Discount
    <input type="radio" name="type_discount" value="percentage_discount" <?php checked($type_discount, 'percentage_discount'); ?>>Percentage Discount<br>
    <?php
}
function save_coupon_discount($post_id)
{
    if (array_key_exists('as_discount_id', $_POST)) {
        update_post_meta(
            $post_id,
            'as_coupon_discount',
            $_POST['as_discount_id']
        );
    }
    if (array_key_exists('type_discount', $_POST)) {
        update_post_meta(
            $post_id,
            'type_discount',
            $_POST['type_discount']
        );
    }
}
add_action('save_post', 'save_coupon_discount');

function as_cartdata_display()
{
    if (is_user_logged_in()) {
        $current_user = wp_get_current_user();
        $user_id = (string) $current_user->ID;
    } else if (isset($_COOKIE['user_cart_id'])) {
        $user_id = $_COOKIE['user_cart_id'];
    } else {
        $user_cart_id = random_strings(8);
        setcookie('user_cart_id', $user_cart_id, time() + (86400 * 30), "/");
        $user_id = $user_cart_id;
    }
    global $wpdb;
    $retrieve_data = $wpdb->get_results("SELECT * FROM session_management WHERE cart_user_id='$user_id'", ARRAY_A);
    $data = maybe_unserialize($retrieve_data[0]['session_data']);


    $coupon_id = $data['coupen_code'];
    $coupon_discount = get_post_meta($coupon_id, 'as_coupon_discount', true);
    $type_discount = get_post_meta($coupon_id, 'type_discount', true);

    ob_start();


    if (!empty($data['product'])) {
    ?>
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

            // $grandtotal_withoutdiscount = 100;
            $as_subtotal_withoutdiscount = 0;
            $as_newsubtotal_withdiscount = 0;
            // $as_newgrandtotal_withdiscount = 100;
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
                        if ($price['sale_price'] != $price['regular_price']) {
                            echo '<del><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                . number_format($price['regular_price'], 2, '.', ',') . '</del>
                                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                . number_format($price['sale_price'], 2, '.', ',');
                        } else {
                        ?>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                            </svg>
                        <?php
                            echo number_format($price['regular_price'], 2, '.', ',');
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
                        <?php
                        $subtotal_withoutdiscount = get_post_meta($productId, "ecommerce_price", true) * (int) $qty;
                        $newsubtotal_withdiscount = $price['sale_price'] * (int) $qty;

                        if ($subtotal_withoutdiscount != $newsubtotal_withdiscount) {
                            echo '<del><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                      <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                                  </svg>'
                                . number_format($subtotal_withoutdiscount, 2) . '</del>
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                  <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                              </svg>'
                                . number_format($newsubtotal_withdiscount, 2);
                        } else {
                        ?>
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                <path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                            </svg>
                        <?php
                            echo number_format($subtotal_withoutdiscount, 2);
                        }
                        $as_subtotal_withoutdiscount += $subtotal_withoutdiscount;
                        $as_newsubtotal_withdiscount += $newsubtotal_withdiscount;
                        // $grandtotal_withoutdiscount += $subtotal_withoutdiscount;
                        // $as_newgrandtotal_withdiscount += $newsubtotal_withdiscount;
                        ?>
                    </div>
                    <div class="col-2 pt-3">
                        <form method="post">
                            <button name="remove" type="button" class="btn btn-danger as_cart_item_remove" data-id="<?php echo $productId ?>">
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
            <div class="form-group"> <label>Have coupon?</label>
                <div class="input-group">
                    <input type="text" class="form-control coupon" placeholder="Coupon code" value="" />
                    <span class="input-group-append"><button class="btn btn-primary btn-apply as_coupon">Apply</button>
                    </span>
                    <?php
                    if (isset($coupon_id) && $coupon_id = $data['coupen_code']) { ?>
                        <div>
                            <span>
                                Copen code "<?php echo get_the_title($coupon_id = $data['coupen_code']) ?>" apply sucessfully
                            </span>
                        </div>
                    <?php
                    }
                    ?>
                </div>
            </div>
            <div class="totals">
                <div class="totals-item">
                    Total Products
                    <div class="totals-value" id="cart-shipping"><i class="fa fa-inr"></i>
                        <?php
                        if (isset($data['coupen_code']) && $data['coupen_code'] > 0) {
                            if ($type_discount == 'percentage_discount') {
                                $coupenprice_without_discount_totalproduct = (int) $as_subtotal_withoutdiscount * (100 - $coupon_discount) / 100;
                                $coupenprice_without_discount_totalproduct = round($coupenprice_without_discount_totalproduct, 2);

                                $coupenprice_with_disount_totalproduct = (int) $as_newsubtotal_withdiscount * (100 - $coupon_discount) / 100;
                                $coupenprice_with_disount_totalproduct = round($coupenprice_with_disount_totalproduct, 2);

                                echo '<del><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                    . number_format($coupenprice_without_discount_totalproduct, 2) . '</del>
                                       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                    . number_format($coupenprice_with_disount_totalproduct, 2);
                            } else if ($type_discount == 'fix_discount') {

                                $coupenprice_without_discount_totalproduct = (int) $as_subtotal_withoutdiscount - $coupon_discount;
                                $coupenprice_with_disount_totalproduct = (int) $as_newsubtotal_withdiscount - $coupon_discount;

                                echo '<del>
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                    . number_format($coupenprice_without_discount_totalproduct, 2) . '</del>
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                    . number_format($coupenprice_with_disount_totalproduct, 2);
                            }
                        } else {
                            if ($as_subtotal_withoutdiscount != $as_newsubtotal_withdiscount) {
                                echo '<del>
                                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                    . number_format($as_subtotal_withoutdiscount, 2) . '</del>
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                    . number_format($as_newsubtotal_withdiscount, 2);
                            } else {
                                echo number_format($as_subtotal_withoutdiscount, 2);
                            }
                        }
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

                        <div class="totals-value" id="cart-total">
                            <?php
                            if ($as_subtotal_withoutdiscount != $as_newsubtotal_withdiscount) {
                                echo '<del>
                                     <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                    . number_format($as_subtotal_withoutdiscount + 100, 2) . '</del>
                                   <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16"><path d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" /></svg>'
                                    . number_format($as_newsubtotal_withdiscount + 100, 2);
                            } else {
                                echo number_format($as_subtotal_withoutdiscount + 100, 2);
                            }
                            ?>
                        </div>
                    </div>
                </div>
                <a href="<?php echo get_permalink(103); ?>"><button class="checkout">Checkout</button></a>
            </div>
        </div>
    <?php
    } else {
    ?>
        <div class="container-fluid  mt-100">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-body cart">
                            <div class="col-sm-12 empty-cart-cls text-center">
                                <img src="https://i.imgur.com/dCdflKN.png" width="130" height="130" class="img-fluid mb-4 mr-3">
                                <h3><strong>Your Cart is Empty</strong></h3>
                                <h4>Add something to make me happy </h4>
                                <a href="<?php echo get_post_type_archive_link('product'); ?>" class=" btn btn-primary cart-btn-transform m-3" data-abc="true">continue
                                    shopping <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2" />
                                    </svg></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
<?php
    }
    $html = ob_get_clean();

    return $html;
}

// rest-api 
add_action('rest_api_init', 'test_api');

function test_api()
{
    register_rest_route('v1/as-post', '/list/', array(
        'methods' => 'GET',
        'callback' => 'get_test_data',
        'args' => [
            'id',
            'Categories'
        ]
    ));
    register_rest_route('v1/as-post', '/(?P<slug>[a-zA-Z0-9-]+)',  array(
        'methods' => 'GET',
        'callback' => 'post_single',

    ));

    register_rest_route('v1/as-post', '/create/', array(
        'methods' => 'POST',
        'callback' => 'createpostapi'

    ));

    register_rest_route('v1/as-post', '/delete/', array(
        'methods' => 'DELETE',
        'callback' => 'deletepostapi'

    ));
    register_rest_route('v1/as-post', '/update/', array(
        'methods' => 'POST',
        'callback' => 'updatepostapi'

    ));
}

function get_test_data($request)
{
    $params = $request->get_params();
    $args = array(
        'type'                     => 'post',
        'taxonomy'                 => 'category',

    );
    $resulte = array();
    foreach (get_posts($args) as $post) {
        $data = (array)$post;
        $data["category"] = get_the_category($post->ID);
        $data["post_image"] = wp_get_attachment_url(get_post_thumbnail_id($post->ID));
        $data["tags"] = wp_get_post_terms($post->ID);
        $resulte[] = $data;
    }
    echo json_encode($resulte);
    die();
}
function post_single($request)
{
    $params = $request->get_params();

    $args = [
        'name' => $params['slug'],
        'type' => 'post'
    ];
    $post = get_posts($args)[0];

    $data = (array)$post;
    $data["category"] = get_the_category($data['ID']);
    $data["post_image"] = wp_get_attachment_url(get_post_thumbnail_id($data['ID']));
    $data["tags"] = wp_get_post_terms($data['ID']);

    echo json_encode($data);
    die();
}

function createpostapi($request)
{
    $params = $request->get_params();
    $post_arr = array(
        'post_title' => $params['title'],
        'post_content' => $params['description'],
        'post_author'   => get_current_user_id(),
        'post_status' => 'draft',
        'post_type' => 'post'
    );
    $id = wp_insert_post($post_arr);
    // set_post_thumbnail($id, $params['image_upload']);
    wp_set_object_terms($id, $params['categories'], 'category');
    wp_set_object_terms($id, $params['tags'], 'post_tag');


    return new WP_REST_Response(
        array(
            'success' => true,
            "massage" => "post created success fully",
            "created_id" => $id
        )
    );
}

function deletepostapi($request)
{
    $params = $request->get_params();

    $deleteData = wp_delete_post($params['postid']);

    return new WP_REST_Response(
        array(
            'success' => true,
            "sucessupdatemsg" => "Delete post  success fully",
        )
    );
}

function updatepostapi($request)
{
    $params = $request->get_params();


    // print_R($params);
    // exit;
    $args = [
        'ID' => $params['postid'],
        'post_title' => $params['updatedtitle'],
        'post_content' => $params['updatedescription'],
        'post_date'     => date('Y-m-d H:i:s')
    ];

    $updatedData = wp_update_post($args);
    // set_post_thumbnail($updatedData, $request['image_upload']);
    wp_set_object_terms($updatedData, $params['categories'], 'category');
    wp_set_object_terms($updatedData, $params['tags'], 'post_tag');
    return new WP_REST_Response(
        array(
            'success' => true,
            "sucessupdatemsg" => "post updated success fully",
        )
    );
    // $post = get_posts($args)[0];
    //  echo json_encode($updatedData);
    die();
}
