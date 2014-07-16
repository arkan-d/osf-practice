<html>
<body>
	<h1><?php echo sprintf(lang('email_forgot_password_heading'), $identity);?></h1>
	<p>Please click this link to
	<a href="<?=base_url();?>auth/reset_password/<?=$forgotten_password_code;?>">Reset Your Password</a>
	
	</p>
</body>
</html>