
<?php

// Registers a new post status like completed, processing, shipped
function my_custom_status_creation(){
    $statuses = array(
        'completed' => 'Completed',
        'processing' => 'Processing',
        'shipped' => 'Shipped',
    );

    foreach ($statuses as $status => $label) {
        register_post_status($status, array(
            'label' => _x($label, 'orders'),
            'label_count' => _n_noop("$label <span class=\"count\">(%s)</span>", "$label <span class=\"count\">(%s)</span>"),
            'public' => true,
            'exclude_from_search' => false,
            'show_in_admin_all_list' => true,
            'show_in_admin_status_list' => true,
        ));
    }
}
add_action('init', 'my_custom_status_creation');


// edit page dropdown add 
function add_to_post_status_dropdown(){
    global $post;
    if ($post->post_type != 'orders') {
        return false;
    }
    $statuses = array('completed', 'processing', 'shipped');
    $current_status_script = '';

    foreach ($statuses as $status) {
        $current_status_script .= ($post->post_status == $status) ? "jQuery('#post-status-display').text('" . ucfirst($status) . "'); jQuery('select[name=\"post_status\"]').val('$status');" : '';
    }

    echo "<script> 
        jQuery(document).ready(function() { " 
            . implode('', array_map(function ($status) {
                return "jQuery('select[name=\"post_status\"]').append('<option value=\"$status\">" . ucfirst($status) . "</option>');";
            }, $statuses)) . " " . $current_status_script . "

        jQuery('select[name=\"post_status\"]').on('change', function(){
            var new_status = jQuery(this).val();
            jQuery('#post_status').val(new_status);
            jQuery('#post').submit();
        });
        
        jQuery('#post-status-display').text('" . ucfirst($status) . "'); jQuery('select[name=\"post_status\"]').val('$status'); : '';
    }); </script>";
}
add_action('post_submitbox_misc_actions', 'add_to_post_status_dropdown');


// quick edit page dropdown add
function custom_status_add_in_quick_edit(){
    global $post;
    if ($post->post_type != 'orders') {
        return false;
    }

    $statuses = array('completed', 'processing', 'shipped');

    echo "<script>
    jQuery(document).ready(function() {
        " . implode('', array_map(function ($status) {
        return "jQuery('select[name=\"_status\"]').append('<option value=\"$status\">" . ucfirst($status) . "</option>');";
    }, $statuses)) . "
    });
    </script>";
}
add_action('admin_footer-edit.php', 'custom_status_add_in_quick_edit');


// display in archive page
function display_archive_state($states){
    global $post;

    // Check if the global $post is set and is an object
    if (!isset($post) || !is_object($post)) {
        return $states;
    }

    $arg = get_query_var('post_status');
    $statuses = array('completed', 'processing', 'shipped');

    foreach ($statuses as $status) {
        if ($arg != $status && $post->post_status == $status) {
            $states[] = ucfirst($status);
            break;
        }
    }

    return $states;
}
add_filter('display_post_states', 'display_archive_state');