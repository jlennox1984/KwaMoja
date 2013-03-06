<?php
/*	unset($_SESSION['Install']['OperatingSystem']);
	unset($_SESSION['Install']['DatabaseType']);
	unset($_SESSION['Install']['DatabaseHost']);
	unset($_SESSION['Install']['DatabaseUser']);
	unset($_SESSION['Install']['DatabasePassword']);
	unset($_SESSION['Install']['DatabaseName']);
	unset($_SESSION['Install']['DatabasePort']);
	unset($_SESSION['Install']['UserID']);
	unset($_SESSION['Install']['Password']);*/

//echo '	<a id="kwamoja_logo" href="http://www.kwamoja.com" target="_blank"><img src="../companies/logo.png" /></a>';
echo '<div id="text_box">';
echo '<h2>
		<b>
			<u>' .  _('Welcome to the KwaMoja installation wizard') . '</u>
		</b>
	</h2>';

echo '<p>'._('KwaMoja is designed to help you manage your business in a more efficient and profitable manner.  It combines your book keeping needs with all the tools to plan your inventory purchases.   It will let you know when your factory needs to start manufacturing parts in order to keep up with orders.  It will help you better manage your cash flow. All these and more will help your business become more efficient, and greater efficiency will equal greater profits.').'</p>';
echo '<p>'._('KwaMoja is a Kiswahili concept, literally meaning "For Unity". In the context of an open source project such as this, it is intended to symbolise the bringing together of all contributors and users. To unify a project that has become fractured, due to the many squabbles and arguments that have occurred between the administrator of webERP and many of the developers of that project.').'</p>';
echo '<p>'._('It is also intended to describe the idea of bringing all the various strands of a business together into one software suite. The term ERP has become much misused over the last few years, so we have tried not to use that term here. KwaMoja is simply a tool that helps brings all the aspects of a business together.').'</p>';
echo '<p>'._('This wizard will guide you through the installation process.').'</p>';
echo '<p>'._('You will need to know the location, type, and password for your database management system.').'</p>';
echo '<p>'._('You can choose from a selection of different charts of account, depending on your locality and the type of your organisation.').'</p>';
echo '<p>'._('Firstly KwaMoja will do some checks on your system. When you want to start, just click the continue button below.').'</p>';
echo '</div>';
echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">
		<div id="continue">
			<button id="navigate" disabled="disabled" name="submit" value="1">&lt;&lt;&nbsp;&nbsp;' . _('Go Back') . '</button>
			<button id="navigate" name="submit" value="1">' . _('Continue') . '&nbsp;&nbsp;&gt;&gt;</button>
		</div>
	</form>';


?>