 <div class="modal-dialog" style="padding-top:50px;">
   
  <div class="modal-content">
      <div class="modal-header">
         
         <h1><?php echo lang('reset_password_heading');?></h1>

      </div>
      <div class="modal-body">



<p><?php if (isset($message) && !empty($message))
{ echo "<div class='col-md-12 alert alert-warning' role='alert'>{$message}</div>";}?> </p>


<?php echo form_open('auth/reset_password/' . $code ,"class='form col-md-12 center-block'");?>

			 <div class="form-group">
	<p>
		<label for="new_password"><?php echo sprintf(lang('reset_password_new_password_label'), $min_password_length);?></label> <br />
		<?php echo form_input($new_password);?>
	</p>

	<p>
		<?php echo lang('reset_password_new_password_confirm_label', 'new_password_confirm');?> <br />
		<?php echo form_input($new_password_confirm);?>
	</p>

	<?php echo form_input($user_id);?>
	<?php echo form_hidden($csrf); ?>

	<p><?php echo form_submit('submit', lang('reset_password_submit_btn'),"class='btn btn-primary btn-md btn-block'");?></p>
			
			 </div>
<?php echo form_close();?>


  </div>
      <div class="modal-footer">
          <div class="col-md-12">
          
		  </div>	
      </div>
  </div>
  </div>