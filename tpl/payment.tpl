%x=(lolcat!='0')*1
%y='header{}'.format(x)
% include(y)

<div class="row">

<div class="four columns">
<form id="register" action="/payment" method="POST">
  <label for="sroll">Student ID</label>
  <input class="u-full-width" type="number" id="sroll" max="999999999" name="1"/>

  <label for="purp">Amount</label>
  <textarea class="u-full-width" id="purp" name="2" maxlength="190"></textarea>
  <input class="u-full-width" type="text" id="3sname" maxlength="39" name="10" value="1" style="display: none;" />

  <label for="purp3">Start date</label>
  <input class="u-full-width" type="datetime-local" id="purp" name="3"/>

  <label for="purp3">End date</label>
  <input class="u-full-width" type="datetime-local" id="purp" name="4"/>

  <input class="button-primary" type="submit" name="search" value="Add payment">

</form>
</div>
<div class="four columns">
<form id="resolve" action="/payment" method="POST">
  <label for="sroll">Payment id</label>
  <input class="u-full-width" type="number" id="sroll" max="999999999" name="1"/>
  <input class="u-full-width" type="text" id="3sname" maxlength="39" name="10" value="2" style="display: none;" />

  <label for="sroll2">Student id</label>
  <input class="u-full-width" type="number" id="sroll2" max="999999999" name="2"/>

  <label for="purp">Status</label>
  <select class="u-full-width" id="up" name="3">
        <option value="0">Paid</option>
        <option value="1">Unpaid</option>
      </select>

  <input class="button-primary" type="submit" name="search" value="Update status">

</form>
</div>
<div class="four columns">
<form id="show_it" action="/payment" method="POST">
<label for="croll">Student ID</label>
      <select class="u-full-width" id="croll" name="5">
        <option value="0">Any</option>
        <option value="1">Specific</option>
      </select>
  <input class="u-full-width" type="number"  placeholder="123456789" id="ssroll" max="999999999" name="7" style="display: none;"/>
      
      

  <label for="cvname" >Payment status</label>
      <select class="u-full-width" id="cvstatus" name="9">
        <option value="0">Any</option>
        <option value="1">Paid</option>
        <option value="2">Unpaid</option>
      </select>
      <input class="u-full-width" type="text" id="3sname" maxlength="39" name="10" value="3" style="display: none;" />

      <input class="button-primary" type="submit" name="search" value="Search">
  
</form>
</div>

</div>
<div id='ajax_success' class="u-full-width"></div>

<script>
        $(document).ready(function() {
            $("#croll").on('change', function(){
                $('#ssroll').toggle();
                
            });   
        });
   </script>

<script type="text/javascript">
    var frm3 = $('#show_it');

    frm3.submit(function (e) {

        e.preventDefault();

        $.ajax({
            type: frm3.attr('method'),
            url: frm3.attr('action'),
            data: frm3.serialize(),
            success: function (data) {

              
                var output = data;
                document.getElementById("ajax_success").innerHTML =  output ;
              
$('html, body').animate({
    scrollTop: ($("#navid").offset().top ) 
}, 'slow');

                console.log('Submission was successful.');
                console.log(data);
            },
            error: function (data) {
              alert("error");
                console.log('An error occurred.');
                console.log(data);
            },
        });

    });
</script>


<script type="text/javascript">
    var frm = $('#register');

    frm.submit(function (e) {

        e.preventDefault();

        $.ajax({
            type: frm.attr('method'),
            url: frm.attr('action'),
            data: frm.serialize(),
            success: function (data) {

              
                var output = data;
                document.getElementById("ajax_success").innerHTML =  output ;
              
$('html, body').animate({
    scrollTop: ($("#navid").offset().top ) 
}, 'slow');

                console.log('Submission was successful.');
                console.log(data);
            },
            error: function (data) {
              alert("error");
                console.log('An error occurred.');
                console.log(data);
            },
        });

    });
</script>
<script type="text/javascript">
    var frm2 = $('#resolve');

    frm2.submit(function (e) {

        e.preventDefault();

        $.ajax({
            type: frm2.attr('method'),
            url: frm2.attr('action'),
            data: frm2.serialize(),
            success: function (data) {

              
                var output = data;
                document.getElementById("ajax_success").innerHTML =  output ;

              $('html, body').animate({
    scrollTop: ($("#navid").offset().top ) 
}, 'slow');


                console.log('Submission was successful.');
                console.log(data);
            },
            error: function (data) {
              alert("error");
                console.log('An error occurred.');
                console.log(data);
            },
        });

    });
</script>



    
</div>
<!-- End Document
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
</body>

</html>