<?php
session_start();
include("headers.php");
include("dbconnection.php");
if(isset($_GET[delid]))
{
	$sql ="DELETE FROM doctor WHERE doctorid='$_GET[delid]'";
	$qsql=mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('doctor record deleted successfully..');</script>";
	}
}
?>

<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">Doctor Records</li></ul>
  </div>
</div>
<div class="wrapper col4">
  <div id="container">
 
<section class="container">
<h2>Search Patient - <input type="search" class="light-table-filter" data-table="order-table" placeholder="Filter" /></h2>

    <table width="200" border="3"
    style="background-image: 
    linear-gradient(rgba(0,0,0,0.40),rgba(0,0,0,0.40)),url(./images/3.png); font-weight: bold;">
      <tbody>
        <thead>
        <tr>
          <th>Doctor Name</th>
          <th>Mobile Number</th>
          <th>Login ID</th>
          <th>Education</th>
          <th>Experience</th>
          <th>Status</th>
          <th>Action</th>
        </thead>
        </tr>
          <?php
		$sql ="SELECT * FROM doctor";
		$qsql = mysqli_query($con,$sql);
		while($rs = mysqli_fetch_array($qsql))
		{
			
			$qsqldept = mysqli_query($con,$sqldept);
			$rsdept = mysqli_fetch_array($qsqldept);
        echo "<tr>
          <td>&nbsp;$rs[doctorname]</td>
          <td>&nbsp;$rs[mobileno]</td>
			<td>&nbsp;$rs[loginid]</td>
			 <td>&nbsp;$rs[education]</td>
			<td>&nbsp;$rs[experience]</td>
          <td>$rs[status]</td>
           <td>&nbsp;
		   <a href='doctor.php?editid=$rs[doctorid]'>Edit</a> | <a href='viewdoctor.php?delid=$rs[doctorid]'>Delete</a> </td>
        </tr>";
		}
		?>      
  </tbody>
    </table>
    <p>&nbsp;</p>
  </div>
</div>
</div>
 <div class="clear"></div>
  </div>
</div>
<?php
include("footers.php");
?>