<html>
<body>
	<h1><?php echo sprintf(lang('email_activate_heading'), $identity);?></h1>
	<p>Please click this link to
			<a href="<?=base_url();?>auth/activate/<?=$id;?>/<?php echo $activation;?>">Activate Your Account</a>.
			</p>
</body>
</html>