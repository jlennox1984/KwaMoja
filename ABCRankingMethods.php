<?php

$PageSecurity = 15;

include('includes/session.inc');

$Title = _('Maintain ABC ranking methods');

include('includes/header.inc');

echo '<p class="page_title_text noPrint" >
		<img src="' . $RootPath . '/css/' . $Theme . '/images/maintenance.png" title="' . $Title . '" alt="' . $Title . '" />' . ' ' . $Title . '
	</p>';

if (isset($_GET['Delete'])) {
	$CheckSQL = "SELECT methodid FROM abcgroups WHERE methodid='" . $_GET['SelectedMethodID'] . "'";
	$CheckResult = DB_query($CheckSQL, $db);
	if (DB_num_rows($CheckResult) == 0) {
		$sql = "DELETE FROM abcmethods WHERE methodid='" . $_GET['SelectedMethodID'] . "'";
		$result = DB_query($sql, $db);
		prnMsg(_('ABC Ranking method number') . ' ' . $_GET['SelectedMethodID'] . ' ' . _('has been deleted'), 'success');
		echo '<div class="centre">
				<a href="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '">' . _('View all the ranking methods') . '</a>
			</div>';
		include('includes/footer.inc');
		exit;
	} else {
		prnMsg(_('ABC Ranking method number') . ' ' . $_GET['SelectedMethodID'] . ' ' . _('cannot be deleted as it is used ABC groups'), 'error');
	}
}

if (isset($_POST['Submit'])) {
	if ($_POST['Mode'] == 'New') {
		$sql = "INSERT INTO abcmethods (methodid,
										methodname
									) VALUES (
										'" . $_POST['MethodID'] . "',
										'" . $_POST['MethodName'] . "'
									)";
		$InsertResult = DB_query($sql, $db);
	} else {
		$sql = "UPDATE abcmethods SET methodname='" . $_POST['MethodName'] . "'
							WHERE methodid='" . $_POST['MethodID'] . "'";
		$UpdateResult = DB_query($sql, $db);
	}
	prnMsg(_('The ranking method has been successfully saved to the database'), 'success');
	echo '<div class="centre">
			<a href="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '">' . _('View all the ranking methods') . '</a>
		</div>';
	include('includes/footer.inc');
	exit;
} else {
	$sql = "SELECT methodid,
					methodname
				FROM abcmethods";
	$result = DB_query($sql, $db);
	echo '<table class="selection" summary="' . _('List of ABC Ranking Methods') . '">
			<tr>
				<th colspan="10">
					<h3>' . _('List of ABC Ranking Methods') . '
						<img src="' . $RootPath . '/css/' . $Theme . '/images/printer.png" class="PrintIcon noPrint" title="' . _('Print') . '" alt="' . _('Print') . '" onclick="window.print();" />
					</h3>
				</th>
			</tr>
			<tr>
				<th>' . _('ID') . '</th>
				<th>' . _('Method name') . '</th>
			</tr>';

	while ($myrow = DB_fetch_array($result)) {
		echo '<tr class="OddTableRows">
				<td>' . $myrow['methodid'] . '</td>
				<td>' . $myrow['methodname'] . '</td>
				<td><a href="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '?SelectedMethodID=' . $myrow['methodid'] . '">' . _('Edit') . '</a></td>
				<td><a href="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '?SelectedMethodID=' . $myrow['methodid'] . '&amp;Delete=1" onclick="return confirm(\'' . _('Are you sure you wish to delete this ranking method?') . '\');">' . _('Delete') . '</a></td>
			</tr>';
	}
	echo '</table>';

	echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post" class="noPrint" id="ABCMethods">';
	echo '<input type="hidden" name="FormID" value="' . $_SESSION['FormID'] . '" />';

	if (isset($_GET['SelectedMethodID'])) {
		$sql = "SELECT methodid,
							methodname
						FROM abcmethods
						WHERE methodid='" . $_GET['SelectedMethodID'] . "'";
		$result = DB_query($sql, $db);
		$myrow = DB_fetch_array($result);
		echo '<input type="hidden" name="Mode" value="Edit" />';
		$IDInput = '<input type="hidden" name="MethodID" value="' . $myrow['methodid'] . '" />' . $myrow['methodid'];
		$Description = $myrow['methodname'];
	} else {
		echo '<input type="hidden" name="Mode" value="New" />';
		$IDInput = '<input type="text" size="3" class="number" name="MethodID" />';
		$Description = '';
	}

	echo '<table>
			<tr>
				<th colspan="2">
					<h3>' . _('Ranking Method Details') . '</h3>
				</th>
			</tr>
			<tr class="EvenTableRows">
				<td>' . _('Method ID') . '</td>
				<td>' . $IDInput . '</td>
			</tr>
			<tr class="OddTableRows">
				<td>' . _('Method Description') . '</td>
				<td><input type="text" size="30" maxlength="40" name="MethodName" value="' . $Description . '" /></td>
			</tr>
		</table>';

	echo '<div class="centre"><input type="submit" name="Submit" value="Save" />';
	echo '</form>';
}

include('includes/footer.inc');

?>