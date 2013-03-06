<?php


echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">
		<table cellpadding="3" cellspacing="0" align="center" width="75%">
			<tr>
				<th colspan="3">' . _('Database information required for installation') . '</th>
			</tr>
			<tr>
				<td>' . _('Database Type') . '</td>';
echo '<td><select name="DBMS" id="select">';
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
		<td>' . _('Database/Company name') . '</td>
		<td><input type="text" name="company" value="' . $_SESSION['Install']['DatabaseName'] . '"></td>
		<td><input type="checkbox" name="UseExisting" value="UseExisting">' . _('Use existing database with this name?') . '<br />
			' . _('*WARNING* - All tables will be deleted') . '</td>
	</tr>';
echo '</table>
		<div id="continue">
			<button id="navigate" name="submit" value="1">&lt;&lt;&nbsp;&nbsp;' . _('Go Back') . '</button>
			<button id="navigate" name="submit" value="3">' . _('Continue') . '&nbsp;&nbsp;&gt;&gt;</button>
		</div>
	</form>';

?>