
/*$(function() {
    var availableTags = [
      "ActionScript",
      "AppleScript",
      "Asp",
      "BASIC",
      "C",
      "C++",
      "Clojure",
      "COBOL",
      "ColdFusion",
      "Erlang",
      "Fortran",
      "Groovy",
      "Haskell",
      "Java",
      "JavaScript",
      "Lisp",
      "Perl",
      "PHP",
      "Python",
      "Ruby",
      "Scala",
      "Scheme"
    ];
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  });
  */
  $(function() {
  return $(document).on('click', 'td[data-link]', function(evt) {
    return window.location = this.dataset.link;
  });
});
  $(document).ready(function() 
    { 
        $("#myTable").tablesorter( 
            {sortList: [[0, 0]]}

            ); 
    } 
); 
