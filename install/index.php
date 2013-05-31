<?php
/* $Id$*/
error_reporting(E_ALL);
ini_set('display_errors', 'On');

if (isset($SessionSavePath)) {
	session_save_path($SessionSavePath);
} //isset($SessionSavePath)

session_write_close(); //in case a previous session is not closed
session_start();

if (file_exists('../config.php')) {
	echo '<br />A KwaMoja installation already exists - the file config.php in the KwaMoja installation has been created and must be removed before this utility can be re-run';
	exit;
}

if (!isset($_POST['submit'])) {
	$_POST['submit'] = 0;
}

if (isset($_POST['DBMS'])) {
	$_SESSION['Install']['DatabaseType'] = $_POST['DBMS'];
}

if (isset($_POST['host'])) {
	$_SESSION['Install']['DatabaseHost'] = $_POST['host'];
}

if (isset($_POST['port'])) {
	$_SESSION['Install']['DatabasePort'] = $_POST['port'];
}

if (isset($_POST['locale'])) {
	$_SESSION['Install']['Locale'] = $_POST['locale'];
}

$_SESSION['MaxLogoSize'] = 10 * 1024;		// Limit logo file size.
$PathToRoot = '..';
$CompanyPath = $PathToRoot. '/companies';

/*Set default values to all the session variables needed */

$PotentialDBMS = array('mariadb', 'mysqli');

if (!isset($_SESSION['Install']['OperatingSystem'])) {
	$_SESSION['Install']['OperatingSystem'] = PHP_OS;
	$_SESSION['Install']['DatabaseType'] = '';
	$_SESSION['Install']['DatabaseHost'] = 'localhost';
	$_SESSION['Install']['DatabaseUser'] = 'root';
	$_SESSION['Install']['DatabasePassword'] = '';
	$_SESSION['Install']['DatabaseName'] = 'kwamoja';
	$_SESSION['Install']['DatabasePort'] = 0;
	$_SESSION['Install']['UserID'] = 'admin';
	$_SESSION['Install']['Password'] = 'kwamoja';
	$_SESSION['Install']['Locale'] = 'de_DE.UTF-8';
}

$LocaleSet = setlocale (LC_MESSAGES, $_SESSION['Install']['Locale']);
echo 'xx'.$LocaleSet.'zz';
putenv('LANG=' . $_SESSION['Install']['Locale']);
putenv('LANGUAGE=' . $_SESSION['Install']['Locale']);
bindtextdomain ('messages', 'locale');
textdomain ('messages');
bind_textdomain_codeset('messages', 'UTF-8');

echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>KwaMoja Installation Wizard</title>
<link href="../css/install.css" rel="stylesheet" type="text/css" />
<link rel="shortcut icon" href="../favicon.ico" />
<link rel="icon" href="../favicon.ico" />

</head>
<body>';

echo '<table class="main">
		<tr>
			<td rowspan="2">
				<img id="vbanner" src="../css/VerticalBanner.png" />
			</td>
			<td>';

// Introductory screen.
include('Page' . $_POST['submit'] . '.php');

echo '</td>
	</tr>';

echo '</table>';

echo '</body>
	</html>';
?>