<!DOCTYPE html>
<html lang="en">
<head>

  <!-- Basic Page Needs
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta charset="utf-8">
  <title>Skeleton: Responsive CSS Boilerplate</title>
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Mobile Specific Metas
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- FONT
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link href='http://127.0.0.1:8000/css/fonts.css' rel='stylesheet' type='text/css'>

  <!-- CSS
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link rel="stylesheet" href="http://127.0.0.1:8000/dist/css/normalize.css">
  <link rel="stylesheet" href="http://127.0.0.1:8000/dist/css/skeleton.css">
  <link rel="stylesheet" href="http://127.0.0.1:8000/css/custom.css">


  <!-- Scripts
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <script src="http://127.0.0.1:8000/scripts/jquery.min.js"></script>
  <script src="http://127.0.0.1:8000/scripts/run_prettify.js"></script>
  <link rel="stylesheet" href="http://127.0.0.1:8000/css/github-prettify-theme.css">
  <script src="http://127.0.0.1:8000/js/site.js"></script>

  <!-- Favicon
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <link rel="icon" type="image/png" href="http://getskeleton.com/dist/images/favicon.png">






  <!-- SCRIPT -->

  <script type="text/javascript">
var xmlhttp;



  xmlhttp=new XMLHttpRequest();


// This will render the two output which substitute the
// elements id="raw" and id="forin"
function GetItems()
{
  if (xmlhttp.readyState==4 && xmlhttp.status==200) {
    // var jsonobj = eval ("(" + xmlhttp.responseText + ")"); 
    //var jsonobj = JSON.parse(xmlhttp.responseText); 

    var output = xmlhttp.responseText;
    document.getElementById("ajax_success").innerHTML = '<p>' + output + '</p>';

    // output = "";

    // for (i in jsonobj) {
    //   output += '<p>';
    //   output += i + " : " + jsonobj[i];
    //   output += '</p>';
    // }

    // document.getElementById("forin").innerHTML = output;

  } else {
    alert("data not available");
  }
}

// xmlhttp.onreadystatechange = GetArticles;
// the GetItems function will be triggered once the ajax
// request is terminated.
xmlhttp.onload = GetItems;
function form_sub()
{
  xmlhttp.open("GET", "/ajax_student_added", true);
 xmlhttp.send();


}

// send the request in an async way
// xmlhttp.open("GET", "/ajax_student_added", true);
// xmlhttp.send();
</script>



</head>
<body class="code-snippets-visible">

  <!-- Primary Page Layout
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
  <div class="container" id="all">
    <section class="header" style="margin-top:5rem;">
      <h2 class="title">HUST Dormitory Management System</h2>


    </section>

    <div class="navbar-spacer"></div>
    <nav class="navbar">
      <div class="container" id="navid">
        <ul class="navbar-list">
          
          <li class="navbar-item">
            <a class="navbar-link" href="#" data-popover="#codeNavPopover">Student</a>
            <div id="codeNavPopover" class="popover">
              <ul class="popover-list">
                <li class="popover-item">
                  <a class="popover-link" href="/show_students">Show students</a>
                </li>
                <li class="popover-item">
                  <a class="popover-link" href="/new_student">New student</a>
                </li>
                <li class="popover-item">
                  <a class="popover-link" href="/search_student">Search students</a>
                </li>
                
              </ul>
            </div>
          </li>
          <li class="navbar-item"><a class="navbar-link" href="#examples">Examples</a></li>
          
        </ul>
      </div>
    </nav>

    <!-- Why use Skeleton -->



<!-- <div class="docs-section" id="forms">
      <h6 class="docs-header">Add new student</h6>
      
      <div class="docs-example docs-example-forms">
        
<form action="/new_student" method="POST">
Name:
  <input type="text"  size="70" maxlength="70" name="name">
 <br>Student ID:
  <input type="number"  name="roll_no">
  <br>Year:
  <input type="number"  name="year">
  <br>Dormitory id:
  <input type="number"  name="hostel_id">
  <br>Flat:
  <input type="number"  min="100" max="999" name="flat">
  <br>Room:
  <input type="text"  size="1" maxlength="1" name="room">
  <br>
  <input type="submit" name="save" value="save">
</form>
      </div>
      </div> -->
<!-- `name`, `roll_no`, `dob`, `gender`, `address`, `contact_no`, `year`, `branch`, `hostel_id`, `flat`, `room`)  -->

<br/>




<div class="six columns">
<form id="show_it" action="/event" method="POST">
<label for="croll">Event description search</label>
      <select class="u-full-width" id="croll" name="5">
        <option value="0">Any</option>
        <option value="1">Specific</option>
      </select>
      
  <textarea class="u-full-width" id="ssroll" name="1" maxlength="190" style="display: none;" ></textarea>
      
      

  <label for="cvname" >Event status</label>
      <select class="u-full-width" id="cvstatus" name="9">
        <option value="0">Any</option>
        <option value="1">Upcoming</option>
        <option value="2">Earlier</option>
      </select>
      <input class="u-full-width" type="text" id="3sname" maxlength="39" name="10" value="2" style="display: none;" />
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
    var frm = $('#add');

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
    
</div>
<!-- End Document
  –––––––––––––––––––––––––––––––––––––––––––––––––– -->
</body>

</html>