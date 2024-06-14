<?php /* Template Name: listcontact */
get_header();
global $post;

$returncontactdata = wp_remote_get('http://192.168.1.8/wordpress/wp-json/v1/as-post/contactlist/');
$json = json_decode($returncontactdata['body'], true);
// echo "<pre>";
// print_r($json);
// echo "</pre>";
?>
<div class="contactlist" ng-app="app" ng-controller="AppCtrl">

  <div class="row text-center">
    <h3>LIST OF CONTACT DATA </h3>
  </div>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th scope="col">User_id</th>
        <th scope="col">Firstname</th>
        <th scope="col">Lastname</th>
        <th scope="col">Email</th>
        <th scope="col">PhoneNo</th>
        <th scope="col">Message</th>
        <th scope="col">Created_date</th>
        <th scope="col">Updated_date</th>
        <th scope="col">add_action</th>

      </tr>
    </thead>
    <?php
    foreach ($json as $jsondata) {
    ?>
      <tbody>
        <tr>
          <td><?php echo $jsondata['contact_user_id']; ?></td>
          <td><?php echo $jsondata['firstname']; ?></td>
          <td><?php echo $jsondata['lastname']; ?></td>
          <td><?php echo $jsondata['email']; ?></td>
          <td><?php echo $jsondata['phoneno']; ?></td>
          <td><?php echo $jsondata['message']; ?></td>
          <td><?php echo $jsondata['createddate']; ?></td>
          <td><?php echo $jsondata['updateddate']; ?></td>
          <td colspan="2">
            <input type="button" value="Edit" name="Edit" />
            <input type="button" value="delete" name="Delete" />
          </td>
        </tr>


      </tbody>
    <?php

    }
    ?>
  </table>
</div>


<?php
get_footer();
?>