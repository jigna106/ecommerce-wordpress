<?php /* Template Name: addpostform*/
get_header();

if ( current_user_can( 'administrator' ) ) { 
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
                                <input type="title" class="form-control" id="title" name="title" value="">
                            </div>
                        </div>
                        <div class="col-12">
                            <label for="description" class="form-label">Description</label>
                            <textarea class="form-control" id="description" name="description" rows="3"></textarea>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="title" class="form-label">Select Categories</label>
                            <div class="input-group">
                                <?php wp_dropdown_categories('show_option_none=Select any one &taxonomy=category'); ?>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <label for="title" class="form-label">Select Tags</label>
                            <div class="input-group">
                                
                                
                                <?php wp_dropdown_categories('show_option_none=Select any one &taxonomy=post_tag'); ?>
                             
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="d-grid">
                                <input class="btn btn-primary" type="button" name="addnewpost" id="addnewpost" value="ADDNEWPOST" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<?php
   }else{
           echo "You do not have access";
       
}
get_footer();
?>