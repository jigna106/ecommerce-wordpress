jQuery(document).ready(function ($) {
  var meta_image_frame;
  jQuery(document).on("click", "#upload_image_btn", function (e) {
    e.preventDefault();

    // If the frame already exists, re-open it.
    if (meta_image_frame) {
      meta_image_frame.open();
      return;
    }

    // Sets up the media library frame
    meta_image_frame = wp.media.frames.meta_image_frame = wp.media({
      title: "select image",
      button: { text: "select image" },
      library: { type: "image" },
    });

    // Runs when an image is selected.
    meta_image_frame.on("select", function () {
      // Grabs the attachment selection and creates a JSON representation of the model.
      var media_attachment = meta_image_frame
        .state()
        .get("selection")
        .first()
        .toJSON();

      // Sends the attachment URL to our custom image input field.
      jQuery("#txt_upload_image").val(media_attachment.url);
    });

    meta_image_frame.open();
  });
});













