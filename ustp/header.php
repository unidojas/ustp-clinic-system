<?php
error_reporting(0);
include("dbconnection.php");
$dt = date("Y-m-d");
$tim = date("H:i:s");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>USTP Clinic Management System</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />

<img src="images/header.png" style="width: 100%;
    height: 25%; padding-top: 10px;">
    
<!-- the purpose is to be able to submit form/ store in database -->

<script type="application/javascript">  
(function(document) {
	'use strict';

	var LightTableFilter = (function(Arr) {

		var _input;

		function _onInputEvent(e) {
			_input = e.target;
			var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
			Arr.forEach.call(tables, function(table) {
				Arr.forEach.call(table.tBodies, function(tbody) {
					Arr.forEach.call(tbody.rows, _filter);
				});
			});
		}

		function _filter(row) {
			var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
			row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
		}

		return {
			init: function() {
				var inputs = document.getElementsByClassName('light-table-filter');
				Arr.forEach.call(inputs, function(input) {
					input.oninput = _onInputEvent;
				});
			}
		};
	})(Array.prototype);

	document.addEventListener('readystatechange', function() {
		if (document.readyState === 'complete') {
			LightTableFilter.init();
		}
	});

})(document);
</script>
<style>
input[type=submit]{
background-color: #4fa891; /* Green */ border: none; 
cursor:pointer;
color: black; padding: 15px 32px; margin: 15px; 
text-align: center; text-decoration: none; 
display: inline-block; font-size: 16px;
font-weight: bold
}
input[type=reset]{
background-color: #4fa891; /* Green */ border: none; color: black; padding: 15px 32px; 
text-align: center; text-decoration: none; 
display: inline-block; font-size: 16px;
font-weight: bold
}
input[type=text]{
	display: block;
    width: 75%;
    height: 24px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
input[type=password]{
	display: block;
    width: 75%;
    height: 24px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}

input[type=number]{
	display: block;
    width: 75%;
    height: 24px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
</style>
</head>
<body>

  <div id="head">
    <br>
    <!-- <center><h1>USTP Clinic Management System</h1></center> -->
    <div class="wrapper col1">
    <div id="topnav">
      <ul>
        <li><a  href="index.php" <?php if(basename($_SERVER['PHP_SELF']) == "index.php"){ echo ' class="active"'; } ?> >Home</a></li>
        <li><a href="aboutus.php" <?php if(basename($_SERVER['PHP_SELF']) == "aboutus.php"){ echo ' class="active"'; } ?>>About US</a></li>
<?php
if(!isset($_SESSION[patientid]))
{
?>        
        <li><a href="patientappointmenthome.php" <?php if(basename($_SERVER['PHP_SELF']) == "patientappointmenthome.php"){ echo ' class="active"'; } ?>>Online Appointment</a></li>
        <li><a href="patientlogin.php" <?php if(basename($_SERVER['PHP_SELF']) == "patientlogin.php"){ echo ' class="active"'; } ?>>Login</a></li>        
        <li><a href="patient.php" <?php if(basename($_SERVER['PHP_SELF']) == "patient.php"){ echo ' class="active"'; } ?>>Registration</a></li>
<?php
}
else
{
?>
<li><a href="patientappointmenthome.php" <?php if(basename($_SERVER['PHP_SELF']) == "patientappointmenthome.php"){ echo ' class="active"'; } ?>>Online Appointment</a></li>
<?php
}
?>        
        <li class="last"><a href="contactus.php" <?php if(basename($_SERVER['PHP_SELF']) == "contactus.php"){ echo ' class="active"'; } ?>>Contact US</a></li></ul>
    </div>
   
  </div>
</div>
<div style="text-align:center">
<?php
include("menu.php");
?>
</div>