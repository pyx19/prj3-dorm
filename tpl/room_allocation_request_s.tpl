% include('header1')

<div class="row">

  <!-- ADD NEW ROOM REQUEST -->
  <div class="six columns">
    <form id="register" action="/room_allocation_request" method="POST">
      <!-- "10" = "1" => add a new request -->
      <input type="hidden" name="10" value="1" />
      <!-- This might be the student's roll_no from the server side (e.g. from cookie / session). -->
      <input type="hidden" name="1" value="{{rolling}}" />

      <label for="ss">Start date</label>
      <input class="u-full-width" type="date" id="ss" name="30" />

      <label for="se">End date</label>
      <input class="u-full-width" type="date" id="se" name="40" />

      <!-- Possibly let them specify hostel/flat/room or do that on admin side. 
           If you want them to choose hostel etc. add more fields:
             <label for="hostel_id">Dormitory</label> 
             <input type="number" name="2" ... > 
           etc...
      -->

      <input class="button-primary" type="submit" value="Add request">
    </form>
  </div>

  <!-- SEARCH EXISTING REQUEST(S) -->
  <div class="six columns">
    <form id="show_it" action="/room_allocation_request" method="POST">
      <!-- "10" = "3" => search requests -->
      <input type="hidden" name="10" value="3" />
      <!-- Force 'Specific' because a student can only see their own (roll_no) -->
      <input type="hidden" name="5" value="1" />
      <input type="hidden" name="7" value="{{rolling}}" />

      <label for="cvstatus">Request state</label>
      <select class="u-full-width" id="cvstatus" name="9">
        <option value="0">Any</option>
        <option value="1">Pending</option>
        <option value="2">Approved</option>
        <!-- or Rejected if you want to handle that state -->
      </select>

      <input class="button-primary" type="submit" value="Search">
    </form>
  </div>

</div>

<div id='ajax_success' class="u-full-width"></div>

<script type="text/javascript">
  // Searching
  var frm3 = $('#show_it');
  frm3.submit(function (e) {
    e.preventDefault();
    $.ajax({
      type: frm3.attr('method'),
      url: frm3.attr('action'),
      data: frm3.serialize(),
      success: function (data) {
        document.getElementById("ajax_success").innerHTML = data;
        $('html, body').animate({ scrollTop: ($("#navid").offset().top) }, 'slow');
        console.log('Submission was successful.', data);
      },
      error: function (data) {
        alert("error");
        console.log('An error occurred.', data);
      }
    });
  });

  // Adding request
  var frm = $('#register');
  frm.submit(function (e) {
    e.preventDefault();
    $.ajax({
      type: frm.attr('method'),
      url: frm.attr('action'),
      data: frm.serialize(),
      success: function (data) {
        document.getElementById("ajax_success").innerHTML = data;
        $('html, body').animate({ scrollTop: ($("#navid").offset().top) }, 'slow');
        console.log('Submission was successful.', data);
      },
      error: function (data) {
        alert("error");
        console.log('An error occurred.', data);
      }
    });
  });
</script>

</body>
</html>
