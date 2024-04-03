<?php


get_header();
$current_user = wp_get_current_user();
?>


<div id="user-profile-wrapper">
    <div id="user-profile-container">
        <div id="user-profile-content">
            <div class="user-profile-section">
                <div class="user-profile-value">
                    <div title="" class="profile-value user-profile-value-username"
                        style="font-size:16px;font-weight:500;padding-bottom:2px">
                        <?php
                        echo $current_user->user_firstname;
                        ?>
                    </div>
                    <div class="profile-value user-profile-value-email" style="font-size:14px;font-weight:400">
                        <?php
                        echo $current_user->user_email; ?>
                    </div>
                </div>
            </div>
            <div class="user-profile-list-section">
                <div class="user-profile-list-items">
                    <div class="user-profile-list-item one">
                        <div class="upl-list-item-logo"><i class="bi bi-building-fill-check"></i></div>
                        <div class="upl-list-item-content"><a href="https://www.google.com"
                                class="upl-list-item-link">Order History</a></div>
                    </div>
                    <div class="user-profile-list-item three">
                        <div class="upl-list-item-logo">
                            <i class="fas fa-sign-out-alt"></i>
                        </div>
                        <div class="upl-list-item-content">
                            <form action="/logout" method="post" class="logout-form">
                                <input type="submit" name="logout" value="Logout"
                                    class="upl-list-item-link signout-input">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<?php
get_footer();
?>