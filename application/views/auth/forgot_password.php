 <div class="modal-dialog" style="padding-top:50px;">
   
  <div class="modal-content">
      <div class="modal-header">
         
          <h1><?php echo lang('forgot_password_heading');?></h1>
<p><?php echo sprintf(lang('forgot_password_subheading'), $identity_label);?></p>

      </div>
      <div class="modal-body">



<p><?php if (isset($message) && !empty($message))
{ echo "<div class='col-md-12 alert alert-warning' role='alert'>{$message}</div>";}?> </p>


<?php echo form_open("auth/forgot_password","class='form col-md-12 center-block'");?>
	 
	 <div class="form-group">   
      <p>
      	<label for="email"><?php echo sprintf(lang('forgot_password_email_label'), $identity_label);?></label> <br />
      	<?php echo form_input($email);?>
      </p>
	 </div>
      <p><?php echo form_submit('submit', lang('forgot_password_submit_btn'),"class='btn btn-primary btn-md btn-block'");?></p>

<?php echo form_close();?>


  
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
          
		  </div>	
      </div>
  </div>
  </div>