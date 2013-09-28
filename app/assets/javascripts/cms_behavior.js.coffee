$ ->
  $("select").each ->
    $(this).select2
      allowClear: true
      width: "220px"

  $("textarea").redactor
    css: "/assets/wysiwyg.css"
