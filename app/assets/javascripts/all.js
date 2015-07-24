
  //allows for the table elemetns to be clicked on and go to correct location/circuit
  $(function() {
  return $(document).on('click', 'td[data-link]', function(evt) {
    return window.location = this.dataset.link;
  });
});
  //sorts the table based on the title originally
  $(document).ready(function() 
    { 
        $("#myTable").tableosrter( 
            {sortList: [[0, 0]]}

            ); 
    } 
); 
  