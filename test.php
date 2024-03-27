<?php
get_header();
if (isset ($_POST['submit'])) {
    $id = get_the_ID();
    $title = get_the_title();
    $qty = $_POST['quantity'];
    if (isset ($_SESSION['productitems'][$id])) {
        $_SESSION['productitems'][$id] += $qty;
    } else {

        $_SESSION['productitems'][$id] = $qty;
    }
    // echo "<pre>";
    // print_r($_SESSION);
    // echo "</pre>";
}
if (have_posts()) {
    while (have_posts()) {
        the_post();
        ?>




        <section class="bg-light">
            <div class="container pb-5">
                <div class="row">
                    <div class="col-lg-5 mt-5">
                        <div class="card mb-3">
                            <img src="<?php echo get_the_post_thumbnail_url(get_the_ID()) ?>" class="card-img img-fluid"
                                alt="Card image cap" />

                        </div>

                    </div>
                </div>

                <div class="col-lg-7 mt-5">
                    <div class="card">
                        <div class="card-body">

                            <h1 class="h2">
                                <?php the_title(); ?>
                            </h1>
                            <p class="h3 py-2"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                    fill="currentColor" class="bi bi-currency-rupee" viewBox="0 0 16 16">
                                    <path
                                        d="M4 3.06h2.726c1.22 0 2.12.575 2.325 1.724H4v1.051h5.051C8.855 7.001 8 7.558 6.788 7.558H4v1.317L8.437 14h2.11L6.095 8.884h.855c2.316-.018 3.465-1.476 3.688-3.049H12V4.784h-1.345c-.08-.778-.357-1.335-.793-1.732H12V2H4z" />
                                </svg>
                                <?php $price = get_post_meta($post->ID, 'ecommerce_price');
                                echo number_format($price[0], ((int) $price[0] == $price[0] ? 0 : 2), '.', ',');
                                ;
                                ?>
                            </p>



                            <h6>Description:</h6>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temp incididunt ut
                                labore et dolore magna aliqua. Quis ipsum suspendisse. Donec condimentum elementum
                                convallis. Nunc sed orci a diam ultrices aliquet interdum quis nulla.</p>

                            <h6>Specification:</h6>
                            <ul class="list-unstyled pb-3">
                                <li>Lorem ipsum dolor sit</li>
                                <li>Amet, consectetur</li>
                                <li>Adipiscing elit,set</li>
                                <li>Duis aute irure</li>
                                <li>Ut enim ad minim</li>
                                <li>Dolore magna aliqua</li>
                                <li>Excepteur sint</li>
                            </ul>

                            <form action="" method="GET">
                                <input type="hidden" name="product-title" value="Activewear">
                                <div class="row">

                                    <div class="col-auto">
                                        <ul class="list-inline pb-3">
                                            <li class="list-inline-item text-right">
                                                Quantity
                                                <input type="number" class="form-control" id="quantity" name="quantity"
                                                    min="1" />
                                            </li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-minus">-</span>
                                            </li>
                                            <li class="list-inline-item"><span class="badge bg-secondary"
                                                    id="var-value">1</span></li>
                                            <li class="list-inline-item"><span class="btn btn-success" id="btn-plus">+</span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="row pb-3">

                                    <div class="col d-grid">



                                        <a href="<?php echo get_permalink(94); ?>"><input type="submit" name="submit"
                                                value="ADD TO CART" class="btn btn-success btn-lg" /></a>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
            </div>
        </section>
        <?php
    }
}
get_footer();
?>