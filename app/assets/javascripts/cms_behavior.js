(function() {
  $(function() {
    $("select").each(function() {
      return $(this).select2({
        allowClear: true,
        width: "220px"
      });
    });
    return $("textarea").redactor({
      css: "/assets/wysiwyg.css"
    });
  });

}).call(this);
