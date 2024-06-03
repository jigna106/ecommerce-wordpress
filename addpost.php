<?php /* Template Name: addpostform*/
get_header();



if (current_user_can('administrator')) {

    // if (isset($_POST['addnewpost'])) {
    //     $createdpostdata = wp_remote_post('http://192.168.1.16/wordpress/wp-json/v1/posts/createpost/', array("body" => $_POST));
    //     $postdata = json_decode($createdpostdata['body'], true);
    //     // print_r($postdata);

    //     echo $postdata['massage'];
    // }
?>
    <div class="container">
    <div class="result">
            <div class="error"> </div>
            <div class="success"></div>
        </div>
        <form method="post">
            <div class="row justify-content-lg-center">
                <div class="col-12 col-lg-9">
                    <div class="bg-white border rounded shadow-sm overflow-hidden">
                        <div class="row gy-4 gy-xl-5 p-4 p-xl-5">
                            <div class="col-12 col-md-6">
                                <label for="title" class="form-label">Title</label>
                                <div class="input-group">
                                    <input type="title" class="form-control" id="title" name="title" value="">
                                    <div class="title_error error"></div>
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                                <div class="description_error error"></div>
                            </div>
                            <div class="col-12 col-md-6">

                                <div class="input-group">
                                    <?php
                                    $args = array(
                                        'taxonomy' => 'category',

                                    );
                                    $cats = get_categories($args);
                                    ?>
                                    <label for="title" class="form-label">Select Categories</label>
                                    <select name="categories[]" id="categories" multiple="multiple">
                                        <option value="">select your categories</option>
                                        <?php
                                        foreach ($cats as $cat) {
                                        ?>
                                            <option value="<?php echo $cat->name ?>"><?php echo $cat->name ?></option>

                                        <?php
                                        } ?>


                                    </select>
                                </div>
                                <div class="selectcategories_error error"></div>
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
                                    <select name="tags" id="tags" multiple>
                                        <option value="">select your tags</option>
                                        <?php
                                        foreach ($tags as $tag) {
                                        ?>
                                            <option value=<?php echo $tag->name ?>><?php echo $tag->name ?></option>

                                        <?php
                                        } ?>


                                    </select>
                                </div>
                                <div class="tags_error error"></div>
                            </div>
                            <div class="col-12 col-md-6">

                                <div class="form-item-lable">
                                    <label>Hobbies: </label>
                                </div>
                                <div class="">
                                    <input type="checkbox" id="dance" name="hobbies[]" value="Dance" />
                                    <label for="dance" class="form-label"> Dance</label>
                                    <input type="checkbox" id="travelling" name="hobbies[]" value="Travelling" />
                                    <label for="travelling" class="form-label"> Travelling</label>
                                    <input type="checkbox" id="music" name="hobbies[]" value="Music" />
                                    <label for="music" class="form-label">music</label>
                                </div>
                                <div class="checkbox_error error"></div>
                            </div>
                            <div class="col-12">
                                <div class="d-grid">
                                    <input class="btn btn-primary" type="button" name="addnewpost" id="addnewpost" value="ADDNEWPOST" style="display: none " />
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