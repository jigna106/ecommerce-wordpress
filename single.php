<?php
get_header();

$returnpostdata = wp_remote_get('http://192.168.1.16/wordpress/wp-json/test/singlepost/slug');
//  print_r($returnpostdata)
$json = json_decode($returnpostdata['body']);

// print_r($json);


?>
<div class="container">
    <div class="row  justify-content-between">
        <div class="col-12 col-md-12 col-lg-6 img-thumbnail as-img-thumbnail">
            <div class="row category-list-wrapper">
                <?php
                foreach ($json as $jsondata) {
                ?>
        <span>
            <?php
$categories= wp_get_post_terms($jsondata['category']);
                echo $categories;
                ?> 
                   </span>
                
                <?php
                }
                ?>
            </div>
            <img src="<?php echo wp_get_attachment_url(get_post_thumbnail_id($jsondata->ID)) ?>" height=600px , width=600px />
        </div>
        <div class="col-12 col-md-12 col-lg-6 d-flex align-items-center">
            <div class="pt-2">


                <div class="product-title text-bold my-3">

                    <div class="about">
                        <span class="font-weight-bold">
                            <h1 class="text-uppercase">
                                <?php echo $jsondata->post_title; ?></h5>
                                <p><?php echo $jsondata->post_content ?></p>
                        </span>

                    </div>


                </div>
            </div>





        </div>




    </div>
</div>


<?php

get_footer();
?>