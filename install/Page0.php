<?php

include('locale/LanguagesArray.php');

echo '<a id="kwamoja_logo" href="http://www.kwamoja.com" target="_blank"><img src="../companies/logo.png" /></a>';
echo '<h2>
		<b>
			<u>' .  _('Select the Language for this install') . '</u>
		</b>
	</h2>';

echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">
			<div>
				<label>' . _('Select Language') . '</label>
				<select name="locale" id="LanguageSelect">';

foreach ($LanguagesArray as $Locale=>$Name) {
	if ($_SESSION['Install']['Locale'] == $Locale) {
		echo '<option selected="selected" value="' . $Locale . '">' . $Name . '</option>';
	} else {
		echo '<option value="' . $Locale . '">' . $Name . '</option>';
	}
}

echo '</select>
		</div>
		<tr>
			<td class="button_bar"><button id="navigate" disabled="disabled" name="submit" value="1">&lt;&lt;&nbsp;&nbsp;' . _('Go Back') . '</button>
			<button id="navigate" name="submit" value="1">' . _('Continue') . '&nbsp;&nbsp;&gt;&gt;</button></td>
		</tr>
	</form>';


?>