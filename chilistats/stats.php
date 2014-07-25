<?PHP
require_once('config.php');

// Get Month and Year
$time=time();
if (is_numeric($_GET["m"]) AND $_GET["m"] >= 1 AND $_GET["m"] <= 12 ) {$show_month = $_GET["m"];} 
else {$show_month=date("n",$time);}
if (is_numeric($_GET["y"]) AND $_GET["y"] >= 1 AND $_GET["y"] <= 9999 ) {$show_year = $_GET["y"];} 
else {$show_year=date("Y",$time);}


?>
<!DOCTYPE html >
<html>
<head>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom Google Web Font -->
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>

    <!-- Add custom CSS here -->
    <link href="css/landing-page.css" rel="stylesheet">
               
    <!--Add favicon.ico    -->
    <link rel="icon" type="image/vnd.microsoft.icon" href="favicon.ico">

<title>Statistic</title>
<link href="chilistats.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container">

  <div class="middle">
    <h3>One View</h3>
	<table width="100%" border="0" cellpadding="5" cellspacing="0" class="oneview">
      <tr valign="top">
      <?PHP
	  // Gesamt Besucher ermitteln
	  $abfrage=mysql_query("select sum(user),sum(view) from ".$db_prefix."Day");
	  $visitors=mysql_result($abfrage,0,0);
	  $visits=mysql_result($abfrage,0,1);
	  mysql_free_result($abfrage);
	  echo "<td width=\"30%\">Visitors</td><td width=\"20%\">$visitors</td>\n";
	  echo "<td width=\"30%\">Visits</td><td width=\"20%\">$visits</td>\n";
	  ?>
	  </tr>
	  <tr valign="top">
	  <?PHP
	  // Online
	  $time = time();
	  $isonline=$time-(3*60);  // 3 Minuten Online Zeit
	  $abfrage=mysql_query("select count(id) from ".$db_prefix."IPs where online>='$isonline'");
	  $online=mysql_result($abfrage,0,0);
	  mysql_free_result($abfrage);
	  echo "<td>Online</td><td>$online</td>\n";
	  echo "<td>&nbsp;</td><td>&nbsp;</td>\n";
	  ?>
	  </tr>
	  <tr valign="top">
	  <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
	  </tr>
	  <tr valign="top">
	  <?PHP
	  // Bounce
	  $abfrage=mysql_query("select count(id) from ".$db_prefix."IPs");
	  $total=mysql_result($abfrage,0,0);
	  mysql_free_result($abfrage);
	  $abfrage=mysql_query("select count(id) from ".$db_prefix."IPs where online=time");
	  $onepage=mysql_result($abfrage,0,0);
	  mysql_free_result($abfrage);	  	  
	  echo "<td>Bounce</td><td>".round(($onepage/$total)*100,2)."%</td>\n";
	  // Page/User and 7 days averange
	  $from_day=date("Y.m.d",$time  -(7*24*60*60));
	  $to_day=date("Y.m.d",$time  - (24*60*60)); // <= ohne heute
	  $abfrage=mysql_query("select AVG(user),(sum(view)/sum(user)) from ".$db_prefix."Day where day>='$from_day' AND day<='$to_day'");
	  $avg_7=round(mysql_result($abfrage,0,0),2);
	  $page_user=round(mysql_result($abfrage,0,1),1);
	  mysql_free_result($abfrage);
	  echo "<td>Page/Visitor</td><td>$page_user</td>\n";
	  ?>
	  </tr>
	  <tr valign="top">
	  <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
	  </tr>
	  <tr valign="top">
	  <?PHP
	  echo"		<td>&Oslash; 7 days</td>\n";
	  echo"		<td>$avg_7</td>\n";
	  // 30 days averange
	  $from_day=date("Y.m.d",$time -(30*24*60*60));
	  $to_day=date("Y.m.d",$time - (24*60*60)); // <= ohne heute
	  $abfrage=mysql_query("select AVG(user) from ".$db_prefix."Day where day>='$from_day' AND day<='$to_day'");
	  $avg_30=round(mysql_result($abfrage,0,0),2);
	  mysql_free_result($abfrage);
	  echo"		<td>&Oslash; 30 days</td>\n";
	  echo"		<td>$avg_30</td>\n";
	  ?>
	  </tr>
	  <tr valign="top">
	  <?PHP
	  // Gesamt User Heute
	  $sel_timestamp = mktime(0, 0, 0, date("n"), date("j"), date("Y"));
	  $sel_tag = date("Y.m.d",$sel_timestamp);
	  $abfrage=mysql_query("select sum(user) from ".$db_prefix."Day where day='$sel_tag'");
	  $today=mysql_result($abfrage,0,0);
	  if ($today=="") $today=0;
	  mysql_free_result($abfrage);
	  echo "<td>Today</td><td>$today</td>\n";
	  // gestern zur gleichen Zeit
	  $anfangTag = mktime(0, 0, 0, date(n), date(j), date(Y)) - 24*60*60 ;
	  $endeTag = $time - 24*60*60 ;
	  $abfrage=mysql_query("select count(id) from ".$db_prefix."IPs where time>='$anfangTag' AND time<=$endeTag");
	  $yesterday=mysql_result($abfrage,0,0);
	  mysql_free_result($abfrage);
	  echo "<td>Yesterday (".date("G:i",$time).")</td><td>$yesterday</td>\n";
	  ?>
	  </tr>	
    </table>
  </div>
  <div class="middle">
    <h3>Last 24 hours </h3>
	<table height="200" width="100%" cellpadding="0" cellspacing="0" align="right">
	<tr valign="bottom" height="180">
	<?PHP
	// User der letzten 24 Stunden abfragen
	$bar_nr=0;
	$bar_mark="";
	for($Stunde=23; $Stunde>=0; $Stunde--)
		{
		$anfangStunde = mktime(date("H")-$Stunde, 0, 0, date("n"), date("j"), date("Y")) ;
		$endeStunde = mktime(date("H")-$Stunde, 59, 59, date("n"), date("j"), date("Y")) ;
		$abfrage=mysql_query("select count(id) from ".$db_prefix."IPs where time>='$anfangStunde' AND time<=$endeStunde");
		$User=mysql_result($abfrage,0,0);
		mysql_free_result($abfrage);
		// Diagramm vorbereiten, Array erstellen
		$bar[$bar_nr] = $User; 
		$bar_title[$bar_nr] = date("G:i",$anfangStunde)." - ".date("G:i",$endeStunde);			
		if (date("H")-$Stunde == 0) $bar_mark = $bar_nr;
		$bar_nr++;
		}
	// Diagramm 		
	for($i=0; $i<$bar_nr; $i++)
		{
		$value=$bar[$i];
		if ($value == "") $value = 0;
		if (max($bar) > 0) {$bar_hight=round((170/max($bar))*$value);} else $bar_hight = 0;
		if ($bar_hight == 0) $bar_hight = 1;	
		if ($bar_mark == "$i" ) { echo "<td style=\"border-left: #FF0000 1px dotted;\" width=\"19\">";}
		else echo "<td width=\"19\">";
		echo "<div class=\"bar\" style=\"height:".$bar_hight."px;\" title=\"".$bar_title[$i]." - $value Visitors\"></div></td>\n";
		}	
			
	?>
    </tr><tr height="20">
	<td colspan="6" width="25%" class="timeline"><?PHP echo date("G:i",mktime(date("H")-23, 0, 0, date("n"), date("j"), date("Y"))); ?></td>
	<td colspan="6" width="25%" class="timeline"><?PHP echo date("G:i",mktime(date("H")-17, 0, 0, date("n"), date("j"), date("Y"))); ?></td>
	<td colspan="6" width="25%" class="timeline"><?PHP echo date("G:i",mktime(date("H")-11, 0, 0, date("n"), date("j"), date("Y"))); ?></td>
	<td colspan="6" width="25%" class="timeline"><?PHP echo date("G:i",mktime(date("H")-5, 0, 0, date("n"), date("j"), date("Y"))); ?></td>
	</tr></table>
  </div>
  <div style="clear:both"></div>
  <div class="middle">
    <h3>Pages Top10</h3>
	<table width="100%" cellpadding="5" cellspacing="0">
  	<tr>
      <td width="30"><strong>Nr.</strong></td>
      <td width="280"><strong>Page</strong></td>
      <td width="120"><strong>Prozent</strong></td>
  	</tr>
<?PHP  
	// gesammt Pages
	$abfrage=mysql_query("select sum(view) from ".$db_prefix."Page");
	$ges_page=mysql_result($abfrage,0,0);
	mysql_free_result($abfrage);
	// Top Pages
	$nr = 1;
	$abfrage=mysql_query("SELECT page, SUM(view) AS views from ".$db_prefix."Page GROUP BY page ORDER BY views DESC LIMIT 0, 10");
	while($row=mysql_fetch_array($abfrage))
		{
		$page=htmlspecialchars($row['page']);
		if(strlen($page) > 35){$shortpage="<a href=\"#\" title=\"$page\">...</a>".substr($page,strlen($page)-30,strlen($page)); }
		else {$shortpage=$page;}
		$views=$row['views'];
		$prozent = (100/$ges_page)*$views;
		if ($prozent < 0.1 ) $prozent = round($prozent,2);
		else $prozent = round($prozent,1);
		$bar_width = round((100/$ges_page)*$views);
		echo"	<tr>\n";
		echo"		<td>$nr</td>\n";
		echo"		<td>$shortpage</td>\n";
		echo"		<td nowrap><div class=\"vbar\" style=\"width:".$bar_width."px;\" title=\"$views Visits\" >&nbsp;$prozent%</div></td>\n";
		echo"	</tr>\n";
		$nr++;
		}
	mysql_free_result($abfrage);
?>
	</table>
  </div>
  <div style="clear:both"></div>
  
  <div class="full">
    <h3>Last 30 days </h3>
	<table height="230" width="100%" cellpadding="0" cellspacing="0" align="right">
	<tr valign="bottom" height="210">
	<?PHP
	// User der letzten 30 Tage abfragen
	$bar_nr=0;
	$bar_mark="";
	for($day=29; $day>=0; $day--)
		{
		$sel_timestamp = mktime(0, 0, 0, date("n"), date("j")-$day, date("Y"));
		$sel_tag = date("Y.m.d",$sel_timestamp);
		$abfrage=mysql_query("select sum(user) from ".$db_prefix."Day where day='$sel_tag'");
		$User=mysql_result($abfrage,0,0);
		mysql_free_result($abfrage);
		
		$bar[$bar_nr]=$User; // Im Array Speichern
		$bar_title[$bar_nr] = date("j.M.Y",$sel_timestamp);
		
		if (date("j")-$day == 1) $bar_mark = $bar_nr;
		if ( date("w", $sel_timestamp) == 6 OR date("w", $sel_timestamp)== 0) {$weekend[$bar_nr]=true;}
		else {$weekend[$bar_nr]=false;}
		
		$bar_nr++;
		}
	// Diagramm 		
	for($i=0; $i<$bar_nr; $i++)
		{
		$value=$bar[$i];
		if ($value == "") $value = 0;
		if (max($bar) > 0) {$bar_hight=round((200/max($bar))*$value);} else $bar_hight = 0;
		if ($bar_hight == 0) $bar_hight = 1;	
		if ($bar_mark == "$i" ) { echo "<td style=\"border-left: #FF0000 1px dotted;\" width=\"31\">";}
		else echo "<td width=\"31\">";
		echo "<div class=\"bar\" style=\"height:".$bar_hight."px;\" title=\"".$bar_title[$i]." - $value Visitors\"></div></td>\n";
		}
	?>
    </tr><tr height="20">
	<td colspan="6" class="timeline"><?PHP echo date("j.M",mktime(0, 0, 0, date("n"), date("j")-29, date("Y"))); ?></td>
	<td colspan="6" class="timeline"><?PHP echo date("j.M",mktime(0, 0, 0, date("n"), date("j")-23, date("Y"))); ?></td>
	<td colspan="6" class="timeline"><?PHP echo date("j.M",mktime(0, 0, 0, date("n"), date("j")-17, date("Y"))); ?></td>
	<td colspan="6" class="timeline"><?PHP echo date("j.M",mktime(0, 0, 0, date("n"), date("j")-11, date("Y"))); ?></td>
	<td colspan="6" class="timeline"><?PHP echo date("j.M",mktime(0, 0, 0, date("n"), date("j")-5, date("Y"))); ?></td>
	</tr></table>
  </div>
  <div style="clear:both"></div>
  
  
  
</div>

<script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
</body>
</html>