</div>
</div>
<?PHP
$returnpostdata = wp_remote_get('http://192.168.1.16/wordpress/wp-json/v1/as-post/list/');
//  print_r($returnpostdata)

$json = json_decode($returnpostdata['body'], true);
echo "<pre>";
// print_r($json);
echo "</pre>";
?>
<div class="container-fluid pt-5" style="background-color: rgb(217 230 236)" ;>
    <div class="row d-flex justify-content-center">
        <?php
        foreach ($json as $jsondata) {
        ?>
            <div class="col-md-3 col-12">
                <a href="<?php echo get_permalink($jsondata['ID']) ?>" class="font-weight-bold text-decoration-none text-body">
                    <div class="footer_image">
                        <img src="<?php echo $jsondata['post_image']; ?>" />
                    </div>

                    <?php
                    foreach ($jsondata['category'] as $cat) {
                    ?>
                        <p class="text-uppercase categories"><?php echo "Categories: " . $cat['name'];
                                                            } ?></p>


                        <?php
                        foreach ($jsondata['tags'] as $tag) {
                        ?>
                            <p class="text-uppercase categories"><?php echo "tags: " . $tag['name'];
                                                                } ?></p>



                            <h5 class=""><?php echo $jsondata['post_title']; ?></h5>
                            <p><?php echo $jsondata['post_content'] ?></p>
                            <p class="text-uppercase categories"><?php
                                                                    $dateofpost = $jsondata['post_date'];
                                                                    echo  date("F j, Y", strtotime($dateofpost));;
                                                                    ?></p>


                </a>
            </div>

        <?php
        }
        ?>
    </div>

</div>
<div class="footer">
    <?php wp_footer(); ?>

    <div class="text-center p-3" style="background-color: rgba(217 230 236);">
        ©2024 Copyright:AsEcommerce
    </div>
</div>
</body>

</html>