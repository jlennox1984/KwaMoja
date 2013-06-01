<?php

echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">
		<table cellpadding="3" cellspacing="0" align="center" width="75%">
			<tr>
				<th colspan="3">' . _('Database information required for installation') . '</th>
			</tr>
			<tr>
				<td>' . _('Database Type') . '</td>';
echo '<td><select name="DBMS" id="select">';

if ($_SESSION['Install']['DatabaseType']=='') {
	echo '<option selected="selected" value=""></option>';
} else {
	echo '<option value=""></option>';
}

foreach ($PotentialDBMS as $DBMS) {
	if ($_SESSION['Install']['DatabaseType']==$DBMS) {
		echo '<option selected="selected" value="' . $DBMS . '">' . $DBMS . '</option>';
	} else {
		echo '<option value="' . $DBMS . '">' . $DBMS . '</option>';
	}
}
echo '</select>
				</td>
			</tr>';
echo '<tr>
		<td>' . _('Host address') . '</td>
		<td><input type="text" name="host" value="' . $_SESSION['Install']['DatabaseHost'] . '" /></td>
	</tr>';
echo '<tr>
		<td>' . _('Database port to use') . '</td>
		<td><input type="text" name="port" value="' . $_SESSION['Install']['DatabasePort'] . '" /></td>
	</tr>';
echo '<tr>
		<td>' . _('Database user name') . '</td>
		<td><input type="text" name="user" value="' . $_SESSION['Install']['DatabaseUser'] . '" /></td>
	</tr>';
echo '<tr>
		<td>' . _('Database user password') . '</td>
		<td><input type="password" name="password" value="' . $_SESSION['Install']['DatabasePassword'] . '" /></td>
	</tr>';
echo '<tr>
		<td>' . _('Company name') . '</td>
		<td><input type="text" name="company" value="' . $_SESSION['Install']['DatabaseName'] . '"></td>
		<td>' . _('*WARNING* - If there is an existing company') . '<br />
			' . _('with this name, then all tables will be deleted') . '</td>
	</tr>';

if (isset($_POST['TestDB'])) {
	if ($_SESSION['Install']['DatabaseType'] == 'mysqli' or $_SESSION['Install']['DatabaseType'] == 'mariadb') {
		$db = mysqli_connect($_SESSION['Install']['DatabaseHost'],
							$_SESSION['Install']['DatabaseUser'],
							$_SESSION['Install']['DatabasePassword'],
							'',
							$_SESSION['Install']['DatabasePort']);
		if (mysqli_connect_errno($db)) {
			$DBTestResult = '<td class="bad">' . _('Connection Failure') . '</td>';
		} else {
			$DBTestResult = '<td class="good">' . _('Connection Success') . '</td>';
		}
	} else {
		$DBTestResult = '<td class="bad">' . _('Connection Failure') . '</td>';
	}

} else {
	$DBTestResult = '';
}

echo '<tr>
		<td align="right"><button id="navigate" name="submit" value="3">' . _('Test database connection') . '</button></td>
		' . $DBTestResult . '
		<input type="hidden" name="TestDB" value="True" />
	</tr>';
echo '</table>';
echo '<tr>
			<td class="button_bar"><button id="navigate" name="submit" value="2">&lt;&lt;&nbsp;&nbsp;' . _('Go Back') . '</button>
			<button id="navigate" name="submit" value="4">' . _('Continue') . '&nbsp;&nbsp;&gt;&gt;</button></td>
		</tr>
	</form>';

?>