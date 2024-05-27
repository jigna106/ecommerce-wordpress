<?php /* Template Name: updatepostform*/
get_header();



if (current_user_can('administrator')) {
    if (isset($_POST['updatepost'])) {
        $updatepostdata = wp_remote_post('http://192.168.1.16/wordpress/wp-json/v1/update/updatepost/',array("body" => $_POST));
        $updatedpostdata = json_decode($updatepostdata['body'], true);
        //  print_r($updatedpostdata);
        echo $updatedpostdata['sucessupdatemsg'];
    }

    if (have_posts()) {
        while (have_posts()) {
            the_post();

            $returnpostdata = wp_remote_get('http://192.168.1.16/wordpress/wp-json/test/singlepost/' . get_post($_GET['id'])->post_name);
            $singlepostdata = json_decode($returnpostdata['body'], true);

            // print_r($singlepostdata);
?>

            <div class="container">
                <form method="post">
                    <div class="row justify-content-lg-center">
                        <div class="col-12 col-lg-9">
                            <div class="bg-white border rounded shadow-sm overflow-hidden">
                                <div class="row gy-4 gy-xl-5 p-4 p-xl-5">
                                    <div class="col-12 col-md-6">
                                        <label for="title" class="form-label">Title</label>
                                        <div class="input-group">
                                            <input type="title" class="form-control" id="updatedtitle" name="updatedtitle" value="<?php echo $singlepostdata['post_title']; ?> ">
                                            <div class="title_error error"></div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label for="description" class="form-label">Description</label>
                                        <textarea class="form-control" id="updatedescription" name="updatedescription" rows="3"><?php echo $singlepostdata['post_content']; ?></textarea>
                                        <div class="description_error error"></div>
                                    </div>

                            <?PHP
                        }
                    }
                            ?>
                            <div class="col-12 col-md-6">

                                <div class="input-group">
                                    <?php
                                    $args = array(
                                        'taxonomy' => 'category',

                                    );
                                    $cats = get_categories($args);
                                    ?>
                                    <label for="title" class="form-label">Select Categories</label>
                                    <select name="categories" id="categories">
                                        <?php
                                        foreach ($cats as $cat) {
                                        ?>
                                            <option value="<?php echo $cat->name ?>" <?php if ($cat->name == $singlepostdata['category'][0]['name']) {
                                                                                            echo "selected='selected'";
                                                                                        } ?>> <?php echo $cat->name ?></option>

                                        <?php
                                        } ?>
                                        <div class="selectcategories_error error"></div>

                                    </select>
                                </div>
                            </div>
                            <div class="col-12 col-md-6">
                                <div class="input-group">
                                    <?php
                                    $args = array(
                                        'taxonomy' => 'post_tag'

                                    );
                                    $tags = get_categories($args);
                                    ?>
                                    <label for="title" class="form-label">Select tags</label>
                                    <select name="tags" id="tags">
                                        <?php
                                        foreach ($tags as $tag) {
                                        ?>
                                            <option value="<?php echo $tag->name ?>" <?php if ($tag->name == $singlepostdata['tags'][0]['name']) {
                                                                                            echo "selected='selected'";
                                                                                        } ?>><?php echo $tag->name ?></option>

                                        <?php
                                        } ?>
                                        <div class="selecttags_error error"></div>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="d-grid">
                                    <input class="btn btn-primary" type="submit" name="updatepost" id="updatepost" value="UPDATEPOST" />
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
        echo "You do not have access";
    }
    get_footer();
        ?>



        ?>