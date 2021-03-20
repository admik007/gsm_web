<?php
if(isset($_GET["FSIZE"])) { 
 $FSIZE="5"; 
 $FSIZE_data="4"; 
 $BRB="<br>"; 
 $BRE="<br><br>";
 $ipaddress="&nbsp;&nbsp;&nbsp;".shell_exec('ip a | grep inet | grep wlan0 | awk {\'print $2\'}');
 $filename_cpu="tmp_fs/cpu_temp.txt";
 $filecpu=fopen($filename_cpu,'r');
 $line_counter="0";
 $linecpu="1";
 while ($line_counter < $linecpu) { if ($cputemp = fgets($filecpu,1048576)) { $cputemp = str_replace("\n", '', $cputemp); $line_counter++; } }
 fclose($filecpu);
 $cpu_temp="&nbsp;&nbsp;&nbsp;&nbsp;(CPU ".$cputemp.")";
}

if (empty($_GET["FSIZE"])) { 
 $FSIZE="2"; 
 $FSIZE_data="2"; 
 $BRB=""; 
 $BRE=""; 
 $ipaddress="";
 $cpu_temp="";
}


$filename_bts="tmp_fs/bts.log";
$filename_gps="tmp_fs/gps.gpx";
$file = fopen($filename_bts,'r');
$line_counter = 0;
$line1 = 1;
$line1color='Orange';
$line2 = 2;
$line2color='Magenta';
$line3 = 3;
$line3color='Green';
$line4 = 4;
$line4color='DodgerBlue';

while ($line_counter < $line1) { if ($l1 = fgets($file,1048576)) { $l1 = str_replace("\n", '', $l1); $line_counter++; } }
while ($line_counter < $line2) { if ($l2 = fgets($file,1048576)) { $l2 = str_replace("\n", '', $l2); $line_counter++; } }
while ($line_counter < $line3) { if ($l3 = fgets($file,1048576)) { $l3 = str_replace("\n", '', $l3); $line_counter++; } }
while ($line_counter < $line4) { if ($l4 = fgets($file,1048576)) { $l4 = str_replace("\n", '', $l4); $line_counter++; } }
fclose($file);
?>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title> General info </title>
 <meta http-equiv="Expires" CONTENT="Sun, 12 May 2003 00:36:05 GMT">
 <meta http-equiv="Pragma" CONTENT="no-cache">
 <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <meta http-equiv="Cache-control" content="no-cache">
 <meta http-equiv="Content-Language" content="sk">
 <meta http-equiv="refresh" content="5"> 
 <meta name="google-site-verification" content="GHY_X_yeijpdBowWr_AKSMWAT8WQ-ILU-Z441AsYG9A">
 <meta name="GOOGLEBOT" CONTENT="noodp">
 <meta name="pagerank" content="10">
 <meta name="msnbot" content="robots-terms">
 <meta name="msvalidate.01" content="B786069E75B8F08919826E2B980B971A">
 <meta name="revisit-after" content="2 days">
 <meta name="robots" CONTENT="index, follow">
 <meta name="alexa" content="100">
 <meta name="distribution" content="Global">
 <meta name="keywords" lang="sk" content="date, time, ip, browswer, operating system">
 <meta name="description" content="Webpage for general info">
 <meta name="Author" content="ZTK-Comp WEBHOSTING">
 <meta name="copyright" content="(c) 2016 ZTK-Comp">
</head>
<body bgcolor="black" color="white">
<p align="center">
<?php echo $BRE;?>

<table align="center" border="1">
 <tr>
  <td align="center">
   <a href="./"><font size="<?php echo $FSIZE;?>" face="Verdana" color="white"><b>Current : </b></font></a>
  </td>
  <td align="center"> 
   <font size="<?php echo $FSIZE;?>" face="Verdana" color="white"><b><?php echo  Date("d.m.Y - H:i:s T");?></b></font>
  </td>
 </tr>

 <tr>
  <td align="center">
   <font size="<?php echo $FSIZE_data;?>" face="Verdana" color="white"><b>Modified BTS: </b></font>
  </td>
  <td align="center">
   <font size="<?php echo $FSIZE_data;?>" face="Verdana" color="white"><b><?php echo  Date("d.m.Y - H:i:s T", filemtime($filename_bts));?></b></font>
   <font size="<?php echo $FSIZE_data;?>" face="Verdana" color="white"><?php echo $cpu_temp;?></font>
  </td>
 </tr>

 <tr>
  <td align="center">
   <font size="<?php echo $FSIZE_data;?>" face="Verdana" color="white"><b>Modified GPS: </b></font>
  </td>
  <td align="center">
   <font size="<?php echo $FSIZE_data;?>" face="Verdana" color="white"><b><?php echo  Date("d.m.Y - H:i:s T", filemtime($filename_gps));?></b></font>
   <font size="<?php echo $FSIZE_data;?>" face="Verdana" color="white"><?php echo $ipaddress;?></font>
  </td>
 </tr>

 <tr>
  <td colspan="2" align="left">
   <font size="<?php echo $FSIZE_data;?>" face="Verdana" color="<?php echo $line1color;?>"><?php echo $BRB.$l1.$BRE;?></font>
  </td>
 </tr>

 <tr>
  <td colspan="2" align="left">
   <font size="<?php echo $FSIZE_data;?>" face="Verdana" color="<?php echo $line2color;?>"><?php echo $BRB.$l2.$BRE;?></font>
  </td>
 </tr>

 <tr>
  <td colspan="2" align="left">
   <font size="<?php echo $FSIZE_data;?>" face="Verdana" color="<?php echo $line3color;?>"><?php echo $BRB.$l3.$BRE;?></font>
  </td>
 </tr>

 <tr>
  <td colspan="2" align="left">
   <font size="<?php echo $FSIZE_data;?>" face="Verdana" color="<?php echo $line4color;?>"><?php echo $BRB.$l4.$BRE;?></font>
  </td>
 </tr>
</table>

</body>
</html>

