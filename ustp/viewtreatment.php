<?php
session_start();
include("headers.php");
include("dbconnection.php");
if(isset($_GET[delid]))
{
	$sql ="DELETE FROM treatment WHERE treatmentid='$_GET[delid]'";
	$qsql=mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('treatment deleted successfully..');</script>";
	}
}
?>

<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">Treatment Records</li></ul>
  </div>
</div>
<div class="wrapper col4">
  <div id="container">
    <h1>View Treatment Records</h1>
    <table width="200" border="3"
    style="background-image: 
    linear-gradient(rgba(0,0,0,0.40),rgba(0,0,0,0.40)),url(./images/3.png); font-weight: bold;">
      <tbody>
        <thead>
        <tr>
          <th><strong>Treatment Type</strong></th>
          <th><strong>Note</strong></th>
          <th><strong>Status</strong></th>
          <?php
		  		if(isset($_SESSION[adminid]))
		{
		?>
          <th><strong>Action</strong></th>
          <?php
		}
		?>
        </tr>
        </thead>
          <?php
		$sql ="SELECT * FROM treatment";
		$qsql = mysqli_query($con,$sql);
		while($rs = mysqli_fetch_array($qsql))
		{
        echo "<tr>
          <td>&nbsp;$rs[treatmenttype]</td>
          <td>&nbsp;$rs[note]</td>
			 <td>&nbsp;$rs[status]</td>";
		if(isset($_SESSION[adminid]))
		{
		echo "<td>&nbsp;
			  <a href='treatment.php?editid=$rs[treatmentid]'>Edit</a> | <a href='viewtreatment.php?delid=$rs[treatmentid]'>Delete</a> </td>";
			}
        echo "</tr>";
		}
		?>
      </tbody>
    </table>
    <h1>&nbsp;</h1>
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