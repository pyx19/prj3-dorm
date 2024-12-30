%include('header0.tpl')

<div class="row">

  <!-- ADD NEW REQUEST FORM (Admin can also add requests on behalf of students if needed) -->
  <div class="four columns">
    <form id="register" action="/room_allocation_request" method="POST">
      <!-- The hidden field "10" = "1" indicates creation of a new record -->
      <input type="hidden" name="10" value="1" />

      <label for="sroll">Roll no.</label>
      <input class="u-full-width" type="number" id="sroll" max="999999999" name="1" />

      <label for="hostel_id">Hostel ID</label>
      <input class="u-full-width" type="number" id="hostel_id" name="2" />

      <label for="flat">Flat</label>
      <input class="u-full-width" type="number" id="flat" name="3" />

      <label for="room">Room</label>
      <input class="u-full-width" type="number" id="room" name="4" />

      <label for="ss">Start date</label>
      <input class="u-full-width" type="date" id="ss" name="30" />

      <label for="se">End date</label>
      <input class="u-full-width" type="date" id="se" name="40" />

      <input class="button-primary" type="submit" value="Add request">
    </form>
  </div>

  <!-- RESOLVE/UPDATE REQUEST FORM -->
  <div class="four columns">
    <form id="resolve" action="/room_allocation_request" method="POST">
      <!-- The hidden field "10" = "2" indicates an update -->
      <input type="hidden" name="10" value="2" />

      <label for="sroll2">Roll no.</label>
      <input class="u-full-width" type="number" id="sroll2" max="999999999" name="1"/>

      <label for="reqid">Request ID</label>
      <input class="u-full-width" type="number" id="reqid" max="999999999" name="2"/>

      <!-- If admin wants to update the hostel_id, fill it in, else leave blank -->
      <label for="hostel_id2">Hostel ID (leave blank if no change)</label>
      <input class="u-full-width" type="number" id="hostel_id2" name="h_id" />

      <label for="flat2">Flat (leave blank if no change)</label>
      <input class="u-full-width" type="number" id="flat2" name="flt" />

      <label for="room2">Room (leave blank if no change)</label>
      <input class="u-full-width" type="number" id="room2" name="rm" />

      <!-- Choose from a drop-down for the state (or leave blank if no change) -->
      <label for="remark">New state (leave blank if no change)</label>
      <select class="u-full-width" id="remark" name="3">
        <option value="">(no change)</option>
        <option value="Pending">Pending</option>
        <option value="Approved">Approved</option>
        <option value="Rejected">Rejected</option>
      </select>

      <input class="button-primary" type="submit" value="Update request">
    </form>
  </div>

  <!-- SEARCH REQUEST FORM -->
  <div class="four columns">
    <form id="show_it" action="/room_allocation_request" method="POST">
      <!-- The hidden field "10" = "3" indicates we are searching -->
      <input type="hidden" name="10" value="3" />

      <label for="croll">Roll no. filter</label>
      <select class="u-full-width" id="croll" name="5">
        <option value="0">Any</option>
        <option value="1">Specific</option>
      </select>

      <!-- Shown/hidden based on JS toggle -->
      <input class="u-full-width" type="number" placeholder="123456789"
             id="ssroll" max="999999999" name="7" style="display: none;" />

      <label for="cvstatus">Request state</label>
      <select class="u-full-width" id="cvstatus" name="9">
        <option value="0">Any</option>
        <option value="1">Pending</option>
        <option value="2">Approved</option>
      </select>

      <input class="button-primary" type="submit" value="Search">
    </form>
  </div>

</div>

<div id="ajax_success" class="u-full-width"></div>

<script>
  $(document).ready(function() {
    // Toggle "specific roll no" input field
    $("#croll").on('change', function() {
      $('#ssroll').toggle();
    });
  });
</script>

<!-- Ajax for Search -->
<script type="text/javascript">
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
</script>

<!-- Ajax for Add Request -->
<script type="text/javascript">
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

<!-- Ajax for Update Request -->
<script type="text/javascript">
  var frm2 = $('#resolve');
  frm2.submit(function (e) {
    e.preventDefault();
    $.ajax({
      type: frm2.attr('method'),
      url: frm2.attr('action'),
      data: frm2.serialize(),
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
