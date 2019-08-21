(function() {
  $(function() {
    return $("a[data-remote]").on("ajax:success", function(event) {
      return alert("The article was deleted.");
    });
  });

}).call(this);