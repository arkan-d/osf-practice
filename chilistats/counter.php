<?PHP
/*
	--------------------------------------------------------
	ChiliStats der neue Statistik Counter 
	basierend auf dem Statistik Counter von pawlita.de
	-------------------------------------------------------
	Das Skript unterliegt dem Urheberschutz Gesetz. Alle Rechte und
	copyrights liegen bei dem Autor:
	Adam Pawlita, http://www.chiliscripts.com
	Dies Skript darf frei verwendet und weitergegeben werden, solange
	die angegebenen Copyrightvermerke in allen Teilen des Scripts vor-
	handen bleiben. Für den fehlerfreien Betrieb, oder Schäden die durch
	den Betrieb dieses Skriptes entstehen, übernimmt der Autor keinerlei
	Gewährleistung. Die Inbetriebnahme erfolgt in jedem Falle 
	auf eigenes Risiko des Betreibers.
	-------------------------------------------------------
*/

require_once('config.php');

//
// initialization and visitor Information
//

// Date Time
$time=time();
$day=date("Y.m.d",$time); // YYYY.MM.DD
$month=date("Y.m",$time); // YYYY.MM

// IP adress
$ip=$_SERVER['REMOTE_ADDR']; 

// Get Referrer and Page
if ($_GET["ref"] <> "" ) 
	{
	// from javascript
	$referer = $_GET["ref"];
	$page = parse_url($_SERVER['HTTP_REFERER'], PHP_URL_PATH);	
	} 
else 
	{
	// from php
	$referer=$_SERVER['HTTP_REFERER'];
	$page=$_SERVER['PHP_SELF']; // with include via php		
	} 	
// cleanup
if (basename($page) == basename(__FILE__)) $page="" ; // count not counter.php

$server_host=$_SERVER["HTTP_HOST"]; // Server Host
if (substr($server_host,0,4) == "www.") $server_host=substr($server_host,4); // Server Host without www.

$referer_host=parse_url($referer, PHP_URL_HOST); // Referrer Host
if (substr($referer_host,0,4) == "www.") $referer_host=substr($referer_host,4); // Referer Host without www.


		
// Language
$language = substr($_SERVER['HTTP_ACCEPT_LANGUAGE'],0,2);

//
// Counter
//

// insert a new day
$neuerTag=mysql_query("select id from ".$db_prefix."Day where day='$day'");
if (!$neuerTag) {echo"Es ist ein Fehler aufgetreten, möglicherweise ist die Tabelle nicht angelegt."; exit;}
if (mysql_num_rows($neuerTag)==0)
	{ 
	mysql_query("insert into ".$db_prefix."Day (day, user, view) values ('$day', '0', '0')");
	}
	
// check reload and set online time
$newuser=0;
$oldreload = $time-$reload;
$gesperrt=mysql_query("select id from ".$db_prefix."IPs where ip='$ip' AND time>'$oldreload' order by id desc limit 1");
if (!$gesperrt) {echo"Es ist ein Fehler aufgetreten, möglicherweise ist die Tabelle nicht angelegt."; exit;}
if (mysql_num_rows($gesperrt)==0)
	{
	// new visitor
	$newuser=1;
	mysql_query("insert into ".$db_prefix."IPs (ip, time, online) values ('$ip', '$time', '$time')");
	mysql_query("update ".$db_prefix."Day set user=user+1, view=view+1 where day='$day'");
	}
else
	{
	// reload visitor
	$gesperrtID=mysql_result($gesperrt,0,0);
	mysql_query("update ".$db_prefix."IPs set online='$time' where id='$gesperrtID'");
	mysql_query("update ".$db_prefix."Day set view=view+1 where day='$day'");
	}

// Page
if($page <> "") {
	$ergebnis = mysql_query("SELECT id from ".$db_prefix."Page WHERE page='$page' AND day='$day'");
	if (!$ergebnis) {echo"Es ist ein Fehler aufgetreten, möglicherweise ist die Tabelle nicht angelegt."; exit;}
	if (mysql_num_rows($ergebnis)==0)
		{
		mysql_query("insert into ".$db_prefix."Page (day, page, view) values ('$day', '$page', '1')");
		}
	else
		{ 
		$pageid=mysql_result($ergebnis,0,0);
		mysql_query("update ".$db_prefix."Page set view=view+1 where id='$pageid'");
		}
	}



?>