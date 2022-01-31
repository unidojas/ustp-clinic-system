<?php
session_start();
include("headers.php");
include("dbconnection.php");
if(isset($_GET[delid]))
{
	$sql ="DELETE FROM prescription WHERE prescriptionid='$_GET[delid]'";
	$qsql=mysqli_query($con,$sql);
	if(mysqli_affected_rows($con) == 1)
	{
		echo "<script>alert('prescription deleted successfully..');</script>";
	}
}
?>

<div class="wrapper col2">
  <div id="breadcrumb">
    <ul>
      <li class="first">Patient Prescription Records</li></ul>
  </div>
</div>
<div class="wrapper col4">
  <div id="container">
    <h1>View Prescription Records</h1>
<?php
$sql ="SELECT * FROM prescription where patientid='$_SESSION[patientid]'";
$qsql = mysqli_query($con,$sql);
while($rs = mysqli_fetch_array($qsql))
{
	$sqlpatient = "SELECT * FROM patient WHERE patientid='$rs[patientid]'";
	$qsqlpatient = mysqli_query($con,$sqlpatient);
	$rspatient = mysqli_fetch_array($qsqlpatient);
	
	$sqldoctor = "SELECT * FROM doctor WHERE doctorid='$rs[doctorid]'";
	$qsqldoctor = mysqli_query($con,$sqldoctor);
	$rsdoctor = mysqli_fetch_array($qsqldoctor);
?>			
    <table width="200" border="3"  
    style=" background-image: linear-gradient(rgba(0,0,0,0.40),rgba(0,0,0,0.40)),url(./images/3.png); font-weight: bold;">
          <tbody>
            <thead>
            <tr>
              <th><strong>Patient</strong></th>
              <th><strong>Doctor</strong></th>
              <th><strong>Prescription Date</strong></th>
              <th><strong>Status</strong></th>
              </thead>
            </tr>
              <?php
            echo "<tr>
              <td>&nbsp;$rspatient[patientname]</td>
              <td>&nbsp;$rsdoctor[doctorname]</td>
               <td>&nbsp;$rs[prescriptiondate]</td>
            <td>&nbsp;$rs[status]</td>
            
            </tr>";
    
            ?>
          </tbody>
        </table>
        
      <h1>View Prescription record</h1>
        <table width="200" border="3"    style=" background-image: linear-gradient(rgba(0,0,0,0.40),rgba(0,0,0,0.40)),url(./images/3.png); font-weight: bold;">
          <tbody>
            <thead>
            <tr>
              <th>Medicine</th>
              <th>Unit</th>
              <th>Dosage</th>
              </thead>
            </tr>
             <?php
             $sqlprescription_records ="SELECT * FROM prescription_records LEFT JOIN medicine ON prescription_records.medicine_name=medicine.medicineid WHERE prescription_records.prescription_id='$rs[0]'";
            $qsqlprescription_records = mysqli_query($con,$sqlprescription_records);
            while($rsprescription_records = mysqli_fetch_array($qsqlprescription_records))
            {
            echo "<tr>
              <td>&nbsp;$rsprescription_records[medicine_name]</td>
               <td>&nbsp;$rsprescription_records[unit]</td>
                <td>&nbsp;$rsprescription_records[dosage]</td>
                  
            </tr>";
            }
            ?>
          </tbody>
        </table>
        <h1>Treatment Records</h1>
    <form method="post" action="">
      <table width="692" border="3" 
      style="background-image: 
    linear-gradient(rgba(0,0,0,0.40),rgba(0,0,0,0.40)),url(./images/3.png); font-weight: bold;">
        <thead>
          <tr>
	          <th>Treatment type</th>
	          <th>Patient</th>
	          <th>Doctor</th>
	          <th>Treatment Description</th>
	          <th>Treatment date</th>
	          <th>Treatment time</th>
          </tr>
         </thead>
          <tbody>
          <?php
		$sql ="SELECT * FROM treatment_records where status='Active'";
		if(isset($_SESSION[patientid]))
		{
			$sql = $sql . " AND patientid='$_SESSION[patientid]'"; 
		}
		if(isset($_SESSION[doctorid]))
		{
			$sql = $sql . " AND doctorid='$_SESSION[doctorid]'";
		}
		$qsql = mysqli_query($con,$sql);
		while($rs = mysqli_fetch_array($qsql))
		{
			$sqlpat = "SELECT * FROM patient WHERE patientid='$rs[patientid]'";
			$qsqlpat = mysqli_query($con,$sqlpat);
			$rspat = mysqli_fetch_array($qsqlpat);
			
			$sqldoc= "SELECT * FROM doctor WHERE doctorid='$rs[doctorid]'";
			$qsqldoc = mysqli_query($con,$sqldoc);
			$rsdoc = mysqli_fetch_array($qsqldoc);
			
			$sqltreatment= "SELECT * FROM treatment WHERE treatmentid='$rs[treatmentid]'";
			$qsqltreatment = mysqli_query($con,$sqltreatment);
			$rstreatment = mysqli_fetch_array($qsqltreatment);
			
        echo "<tr>
          <td>&nbsp;$rstreatment[treatmenttype]</td>
		   <td>&nbsp;$rspat[patientname]</td>
		    <td>&nbsp;$rsdoc[doctorname]</td>
			<td>&nbsp;$rs[treatment_description]</td>
			 <td>&nbsp;$rs[treatment_date]</td>
			  <td>&nbsp;$rs[treatment_time]</td>";  
	
       echo " </tr>";
		}
    
		?>
                <tr>
              <td colspan="6"><div align="center">
                <input type="submit" name="print" id="print" value="Print" onclick="myFunction()"/>
              </div></td>
              </tr>
        </tbody>
      </table>
    </form>

<?php
}
?>        <p>&nbsp;</p>
  </div>
</div>
</div>
 <div class="clear"></div>
  </div>
</div>
<?php
include("footers.php");
?>
<script>
function myFunction()
{
	window.print();
}
</script>