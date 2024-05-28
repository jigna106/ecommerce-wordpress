jQuery(document).ready(function () {
  if (as_ecommerce_ajax_object && as_ecommerce_ajax_object.cart_itmes_data) {
    jQuery(".cart_itmes").append(
      "<span class='cart_total'>" +
        as_ecommerce_ajax_object.cart_itmes_data +
        "</span>"
    );
  }
  jQuery(document).on("change", ".ecommerce-payment-getway", function () {
    if (jQuery(this).val() == "credit") {
      jQuery(".payment-cedit-cash").show();
    } else {
      jQuery(".payment-cedit-cash").hide();
    }
    console.log(jQuery(this).val());
  });
});
jQuery(document).ready(function () {
  jQuery(document).on("click", "#apply", function () {
    make_ajax(1);
  });
});

jQuery(document).ready(function () {
  jQuery(document).on("click", ".remove-filter", function () {
    var id = jQuery(this).parent().attr("data-id");
    jQuery("input[data-id='" + id + "']").removeAttr("checked");
    var selctedsize = jQuery(".select-size").val();
    make_ajax(1, selctedsize);
  });
});

jQuery(document).ready(function () {
  jQuery("#filter").click(function () {
    jQuery(".filterShow").show();
  });
  jQuery(".filter-close").click(function () {
    jQuery(".filterShow").hide();
  });
});

jQuery(document).ready(function () {
  jQuery(document).on("click", ".page-number:not(.active)", function () {
    var text = jQuery(this).val();
    var selctedsize = jQuery(".select-size").val();
    console.log(selctedsize);
    make_ajax(text, selctedsize);
  });
});

jQuery(document).ready(function () {
  jQuery(document).on("change", ".select-size", function () {
    var selctedsize = jQuery(".select-size").val();
    // console.log(selctedsize);
    make_ajax(1, selctedsize);
  });
});

jQuery(document).ready(function () {
  jQuery(document).on("click", ".forward", function () {
    var forward = jQuery(".page-number-hidden").val();
    var selctedsize = jQuery(".select-size").val();
    var paginationNumber = parseInt(forward) + 1;
    console.log(paginationNumber);
    make_ajax(paginationNumber, selctedsize);
  });
});
jQuery(document).ready(function () {
  jQuery(document).on("click", ".backward", function () {
    var backward = jQuery(".page-number-hidden").val();
    var selctedsize = jQuery(".select-size").val();
    var pageNumber = parseInt(backward) - 1;
    make_ajax(pageNumber, selctedsize);
  });
});

function make_ajax(text = 1, selctedsize = 12) {
  var colors = [];
  var colors_ajax = [];
  var catgories = [];
  var catgories_ajax = [];
  var brands = [];
  var brands_ajax = [];
  jQuery('input[name="color"]:checked').each(function () {
    colors.push(
      '<div  class="filter-item" data-id="' +
        this.value +
        '" data-tax="colors">' +
        this.value +
        '<input type="submit" value="X" name="close" class="remove-filter"> </div>'
    );
    colors_ajax.push(this.value);
  });
  jQuery(".colors-filter").html(colors);
  if (colors.length > 0) {
    jQuery(".filter-list .colors").addClass("d-flex").removeClass("d-none");
  } else {
    jQuery(".filter-list .colors").removeClass("d-flex").addClass("d-none");
  }

  jQuery('input[name="catgorie"]:checked').each(function () {
    catgories.push(
      '<div class="filter-item" data-id="' +
        this.value +
        '" data-tax="catgorie">' +
        this.value +
        '<input type="submit" value="X" name="close" class="remove-filter"></div>'
    );
    catgories_ajax.push(this.value);
  });
  jQuery(".catgories-filter").html(catgories);
  if (catgories.length > 0) {
    jQuery(".filter-list .catgories").addClass("d-flex").removeClass("d-none");
  } else {
    jQuery(".filter-list .catgories").removeClass("d-flex").addClass("d-none");
  }

  jQuery('input[name="brand"]:checked').each(function () {
    brands.push(
      '<div class="filter-item" data-id="' +
        this.value +
        '" data-tax="brand">' +
        this.value +
        '<input type="submit" value="X" name="remove-filter" class="remove-filter"></div>'
    );
    brands_ajax.push(this.value);
  });
  jQuery(".brands-filter").html(brands);
  if (brands.length > 0) {
    jQuery(".filter-list .brand").addClass("d-flex").removeClass("d-none");
  } else {
    jQuery(".filter-list .brand").removeClass("d-flex").addClass("d-none");
  }
  // console.log(colors);
  // console.log(catgories);
  // console.log(brands);

  let data = {
    page: text,
    page_size: selctedsize,
    colors: colors_ajax,
    catgories: catgories_ajax,
    brands: brands_ajax,
    action: "as_get_product_filter_color",
  };
  jQuery.ajax({
    type: "post",
    url: as_ecommerce_ajax_object.ajax_url,
    data: data,
    success: function (resulet) {
      jQuery(".ajax_response").html(resulet);
      // console.log(resulet);
    },
  });
}

jQuery(document).ready(function () {
  jQuery(document).on("click", "#Contact_page_submit", function () {
    var contactdata = {};

    var firstname = jQuery("#firstname").val();
    var lastname = jQuery("#lastname").val();
    var email = jQuery("#email").val();
    var phone = jQuery("#phone").val();
    var message = jQuery("#message").val();

    contactdata.Firstname = firstname;
    contactdata.Lastname = lastname;
    contactdata.Email = email;
    contactdata.phone = phone;
    contactdata.Message = message;

    let contactdataajax = {
      data: contactdata,
      action: "as_contactdata",
    };
    jQuery.ajax({
      type: "post",
      url: as_ecommerce_ajax_object.ajax_url,
      data: contactdataajax,
      success: function (getdata) {
        console.log(getdata);
      },
    });
  });
});
jQuery(document).ready(function () {
  jQuery(".as_shop_menu").mouseenter(function () {
    jQuery(".as_shop_menu .sub-menu").show();
  });

  jQuery(".as_shop_menu").mouseleave(function () {
    jQuery(".as_shop_menu .sub-menu").hide();
  });
});

jQuery(document).on("keyup", "#firstname", function () {
  var letters = /^[A-Za-z]+$/;
  var firstname = jQuery("#firstname").val();

  if (firstname && !letters.test(firstname)) {
    jQuery("#firstname_error").text("Alphabets Only");

    return false;
  } else if (firstname == "") {
    jQuery("#firstname_error").text("Must be fill out");

    return false;
  } else {
    jQuery("#firstname_error").text("");
    return true;
  }
});
jQuery(document).on("keyup", "#lastname", function () {
  var letters = /^[A-Za-z]+$/;
  var lastname = jQuery("#lastname").val();

  if (lastname && !letters.test(lastname)) {
    jQuery("#lastname_error").text("Alphabets Only");

    return false;
  } else if (lastname == "") {
    jQuery("#lastname_error").text("Must be fill out");

    return false;
  } else {
    jQuery("#lastname_error").text("");
    return true;
  }
});

jQuery(document).on("keyup", "#email", function () {
  var pattern = /^\w+([.-]?\w+)*@\w+([.-]?\w+)*(\.\w{2,3})+$/;
  var email = jQuery("#email").val();
  if (email && !pattern.test(email)) {
    jQuery("#email_error").text("Enter a valid email address");
    return false;
  } else if (email == "") {
    jQuery("#email_error").text("Must be fill out");
    return false;
  } else {
    jQuery("#email_error").text("");
    return true;
  }
});

jQuery(document).on("keyup", "#password", function () {
  var password = jQuery("#password").val();
  if (password.length >= 8) {
    jQuery("#password_error").text(" ");

    return false;
  } else if (password == "") {
    jQuery("#password_error").text("Must be fill out");

    return false;
  } else {
    jQuery("#password_error").text("at least 8 or more characters");
    return true;
  }
});

jQuery(document).on("keyup", "#phone", function () {
  var re = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/im;
  var phone = jQuery("#phone").val();
  if (phone && !re.test(phone)) {
    jQuery("#phone_error").text("Enter a valiad mobile number");
    return false;
  } else if (phone == "") {
    jQuery("#phone_error").text("Must be fill out");

    return false;
  } else {
    jQuery("#phone_error").text(" ");
    return true;
  }
});

jQuery(document).on("click", ".increment", function () {
  // var quantity = jQuery(".quantity").val();
  var quantity = jQuery(this).siblings(".quantity").val();
  var id_increment = jQuery(this).attr("data-id");
  // console.log(id);
  var addqty = parseInt(quantity) + 1;
  // console.log(addqty);
  let data = {
    id: id_increment,
    qtyupdate: addqty,
    action: "as_update_qty",
  };
  jQuery.ajax({
    type: "post",
    url: as_ecommerce_ajax_object.ajax_url,
    data: data,
    success: function (sucess) {
      console.log(sucess);
      let data = JSON.parse(sucess);
      jQuery(".product-section").html(data.html);
    },
  });
});

jQuery(document).on("click", ".decrement", function () {
  var quantity = jQuery(this).siblings(".quantity").val();
  var id_decrement = jQuery(this).attr("data-id");
  // console.log(id);
  var addqty = parseInt(quantity) - 1;
  // console.log(addqty);
  let data = {
    id: id_decrement,
    qtyupdate: addqty,
    action: "as_update_decrement_qty",
  };

  jQuery.ajax({
    type: "post",
    url: as_ecommerce_ajax_object.ajax_url,
    data: data,
    success: function (sucess) {
      console.log(sucess);
      let data = JSON.parse(sucess);
      jQuery(".product-section").html(data.html);
    },
  });
});

jQuery(document).on("click", ".as_cart_item_remove", function () {
  var id_remove = jQuery(this).attr("data-id");
  let data = {
    id: id_remove,
    action: "as_removeproduct",
  };
  jQuery.ajax({
    type: "post",
    url: as_ecommerce_ajax_object.ajax_url,

    data: data,
    success: function (response) {
      console.log(response);
      let data = JSON.parse(response);
      jQuery(".product-section").html(data.html);
      jQuery(".cart_total").html(data.cartproductcount);
      if (data.cartproductcount == 0) {
        jQuery(".emptycart").hide();
      }
    },
  });
});

jQuery(document).on("click", ".emptycart", function () {
  let data = {
    action: "as_emptycart",
  };
  jQuery.ajax({
    type: "post",
    url: as_ecommerce_ajax_object.ajax_url,
    data: data,
    success: function (response) {
      jQuery(".product-section").html(response);
      jQuery(".cart_total").html(0);
      jQuery(".emptycart").hide();
    },
  });
});

jQuery(document).on("click", ".as_signup", function () {
  var userdata = {};
  var firstname = jQuery("#firstname").val();
  var lastname = jQuery("#lastname").val();
  var email = jQuery("#email").val();
  var password = jQuery("#password").val();

  userdata.Firstname = firstname;
  userdata.Lastname = lastname;
  userdata.Email = email;
  userdata.password = password;

  let userdataAjax = {
    data: userdata,
    action: "as_userRegister",
  };
  jQuery.ajax({
    type: "post",
    url: as_ecommerce_ajax_object.ajax_url,
    data: userdataAjax,
    success: function (response) {
      let data = JSON.parse(response);
      if (data.succes == true) {
        window.location.href = data.redirect_url;
      } else {
        jQuery(".error").html(data.message);
      }
      //  console.log(response);
    },
  });
});
jQuery(document).on("click", ".as_signin", function () {
  var email = jQuery("#email").val();
  var password = jQuery("#password").val();
  let data = {
    email: email,
    password: password,
    action: "as_userlogin",
  };

  jQuery.ajax({
    type: "post",
    url: as_ecommerce_ajax_object.ajax_url,
    data: data,
    success: function (response) {
      let data = JSON.parse(response);
      if (data.succes == true) {
        window.location.href = data.redirect_url;
      } else {
        jQuery(".error").html(data.message);
      }
      console.log(response);
    },
  });
});

jQuery(document).on("click", ".as_coupon", function () {
  var coupon = jQuery(".coupon").val();
  console.log(coupon);

  let coupondata = {
    coupon: coupon,
    action: "as_couponcode",
  };
  jQuery.ajax({
    type: "post",
    url: as_ecommerce_ajax_object.ajax_url,
    data: coupondata,
    success: function (response) {
      let data = JSON.parse(response);
      jQuery(".product-section").html(data.html);
    },
  });
});

jQuery(document).on("keyup", "#title", function () {
  addpostdisable();
  var letters = /^[A-Za-z]+$/;
  var title = jQuery("#title").val();

  if (title && !letters.test(title)) {
    jQuery(".title_error").text("Alphabets Only");
  } else if (title == "") {
    jQuery(".title_error").text("Must be fill out");
  } else {
    jQuery(".title_error").text("");
    return true;
  }
});

jQuery(document).on("keyup", "#description", function () {
  addpostdisable();
  var description = jQuery("#description").val();
  if (description.length >= 20) {
    jQuery(".description_error").text(" ");
  } else if (description == "") {
    jQuery(".description_error").text("Must be fill out");
  } else {
    jQuery(".description_error").text("entre detail description");
    return true;
  }
});

jQuery(document).on("change", "#categories", function () {
  checkcategories();
  addpostdisable();
});
function checkcategories() {
  var categories = jQuery("#categories").val();
  console.log(categories);
  if (categories == " ") {
    jQuery("#selectcategories_error").html("select any one");
  } else {
    jQuery("#selectcategories_error").html(" ");
  }
}
jQuery(document).on("change", "#tags", function () {
  checktags();
  addpostdisable();
});
function checktags() {
  var tags = jQuery("#tags").val();
  console.log(tags);
  if (tags == " ") {
    jQuery("#selecttags_error").html("select any one");
  } else {
    jQuery("#selecttags_error").html(" ");
  }
}
function addpostdisable() {
  var returnvalue = false;

  var letters = /^[A-Za-z]+$/;
  var title = jQuery("#title").val();

  if (!letters.test(title)) {
    console.log("10");
    returnvalue = true;
  } else if (title == "") {
    console.log("11");
    returnvalue = true;
  }

  var description = jQuery("#description").val();

  if (description.length <= 20) {
    console.log("12");
    returnvalue = true;
  } else if (description == "") {
    console.log("13");
    returnvalue = true;
  }

  var categories = jQuery("#categories").val();
  if (categories == "") {
    console.log("14");
    returnvalue = true;
  }
  var tags = jQuery("#tags").val();
  if (tags == "") {
    console.log("15");
    returnvalue = true;
  }

  if (returnvalue == true) {
    // true
    jQuery("#addnewpost").hide();
  } else {
    // false
    jQuery("#addnewpost").show();
  }
}

// insert post using api
jQuery(document).on("click", "#addnewpost", function () {
  var title = jQuery("#title").val();
  var description = jQuery("#description").val();
  var categories = jQuery("#categories").val();
  var tags = jQuery("#tags").val();
  let addpostdata = {
    title: title,
    description: description,
    categories: categories,
    tags: tags,
  };
  jQuery.ajax({
    method: "POST",
    url:  as_ecommerce_ajax_object.rest_url + "create/",
    data: addpostdata,
    success: function (response) {
      console.log(response);
    },
  });
});

// get data using ajax and api
jQuery(document).ready(function () {
  var postname = jQuery("#postname").val();

  jQuery.ajax({
    method: "GET",
    url:as_ecommerce_ajax_object.rest_url + postname,
    success: function (response) {
      // console.log(response);
      jQuery("#postid").val(response.ID);
      jQuery("#updatedtitle").val(response.post_title);
      jQuery("#updatedescription").val(response.post_content);
      jQuery("#categories").val(response.category[0].cat_name);
      jQuery("#tags").val(response.tags[0].name);
    },
  });
});


jQuery(document).on("click", "#updatepost", function () {
  var postid= jQuery("#postid").val();
  var updatedtitle = jQuery("#updatedtitle").val();
  var updatedescription = jQuery("#updatedescription").val();
  var categories = jQuery("#categories").val();
  var tags = jQuery("#tags").val();

  let upddateddata = {
    postid:postid,
    updatedtitle: updatedtitle,
    updatedescription: updatedescription,
    categories: categories,
    tags: tags,
  };
  jQuery.ajax({
    method: "POST",
    url: as_ecommerce_ajax_object.rest_url + "update/",
    data: upddateddata,
    success: function (response) {
      console.log(response);
     
    },
  });       
});

jQuery(document).on("click","#deletepost",function(){
 var postid = jQuery("#postid").val();
//  console.log(postid);

 let deletedata = {
  postid:postid,
 };

 jQuery.ajax({
  method: "DELETE",
  url: as_ecommerce_ajax_object.rest_url + "delete/",
  data: deletedata,
  success: function (response) {
    console.log(response);
   
  },
});  
});
