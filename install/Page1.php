<?php

	$Extensions = get_loaded_extensions();
	?>
		<table cellpadding="3" cellspacing="0" align="center" width="75%">
		<tr>
			<th colspan="3"><?php echo _('Please check the following requirements are met before continuing...'); ?></th>
		</tr>
		<tr>
			<td><?php echo _('The PHP Version must be at least 5.1.0'); ?></td>
			<td>
				<?php
				$phpversion = mb_substr(PHP_VERSION, 0, 6);
				if($phpversion > 5.1) {
					?><font class="good"><?php echo PHP_VERSION;?></font><?php
				} else {
					?><font class="bad">No</font><?php
				}
				?>
			</td>
		</tr>
		<tr>
			<td><?php echo _('The PHP Safe-Mode must be disabled'); ?></td>
			<td>
				<?php
				if(ini_get('safe_mode')) {
					?><font class="bad">Enabled</font><?php
				} else {
					?><font class="good">Disabled</font><?php
				}
				?>
			</td>
		</tr>
		<tr>
			<td><?php echo _('The gd extension must be installed'); ?></td>
			<td>
				<?php
				if(in_array('gd', $Extensions)) {
					?><font class="good">Installed</font><?php
				} else {
					?><font class="bad">Not Installed</font><?php
				}
				?>
			</td>
		</tr>
		<tr>
			<td><?php echo _('The gettext extension must be installed'); ?></td>
			<td>
				<?php
				if(in_array('gettext', $Extensions)) {
					?><font class="good">Installed</font><?php
				} else {
					?><font class="bad">Not Installed</font><?php
				}
				?>
			</td>
		</tr>
		<tr>
			<td><?php echo _('The libxml extension must be installed'); ?></td>
			<td>
				<?php
				if(in_array('libxml', $Extensions)) {
					?><font class="good">Installed</font><?php
				} else {
					?><font class="bad">Not Installed</font><?php
				}
				?>
			</td>
		</tr>
		<tr>
			<td><?php echo _('The mbstring extension must be installed'); ?></td>
			<td>
				<?php
				if(in_array('mbstring', $Extensions)) {
					?><font class="good">Installed</font><?php
				} else {
					?><font class="bad">Not Installed</font><?php
				}
				?>
			</td>
		</tr>
		<tr>
			<td><?php echo _('The ftp extension must be installed'); ?></td>
			<td>
				<?php
				if(in_array('ftp', $Extensions)) {
					?><font class="good">Installed</font><?php
				} else {
					?><font class="bad">Not Installed</font><?php
				}
				?>
			</td>
		</tr>
		<tr>
			<th colspan="3"><?php echo _('Please check the following files/folders are writeable before continuing...'); ?></th>
		</tr>
		<tr>
		  <td><?php echo _('The root for your KwaMoja files, where the scripts are located'); ?></td>
			<td><?php  if(is_writable($PathToRoot)) {
						 echo '<font class="good">Writeable</font>';
					 } else {
						echo '<font class="bad">Unwriteable</font>';
				    } ?>
			</td>
		</tr>
		<tr>
			<td><?php echo 'Company data dirs ('.  $CompanyPath. '/*)'; ?>
			</td>
			<td><?php if(is_writable($CompanyPath)) {
						echo '<font class="good">Writeable</font>';
					  } else {
						echo '<font class="bad">Unwriteable</font>';
					  }
				 ?>
		   </td>
		</tr>
		</table>
	<?php
	echo '<form action="' . htmlspecialchars($_SERVER['PHP_SELF'], ENT_QUOTES, 'UTF-8') . '" method="post">
			<div id="continue">
				<button id="navigate" name="submit" value="0">&lt;&lt;&nbsp;&nbsp;' . _('Go Back') . '</button>
				<button id="navigate" name="submit" value="2">' . _('Continue') . '&nbsp;&nbsp;&gt;&gt;</button>
			</div>
		</form>';



?>