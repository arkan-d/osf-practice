
 <div class="modal-dialog" style="padding-top:50px;">
   
  <div class="modal-content">
      <div class="modal-header">
         
          <h1 class="text-center"><?php echo lang('login_heading');?></h1>
          <p><?php echo lang('login_subheading');?></p>

      </div>
      <div class="modal-body">
	




<p><?php if (isset($message) && !empty($message))
{ echo "<div class='col-md-12 alert alert-warning' role='alert'>{$message}</div>";}?> </p>

<?php echo form_open("auth/login","class='form col-md-12 center-block'");?>

    <div class="form-group">
  <p>
    <?php echo lang('login_identity_label', 'identity');?>
        <?php echo form_input($identity);?>
  </p>
    </div>
    <div class="form-group">
  <p>
    <?php echo lang('login_password_label', 'password');?>
    
    <?php echo form_input($password);?>
  </p>
    </div>
    <div class="form-group">
  <p>
    <?php echo lang('login_remember_label', 'remember');?>
    <?php echo form_checkbox('remember', '1', FALSE, 'id="remember"');?>
  </p>
    </div>
    <div class="form-group">
  <p><?php echo form_submit('submit', lang('login_submit_btn'),"class='btn btn-primary btn-md btn-block'");?></p>
    </div>
<?php echo form_close();?>

<p><a href="forgot_password"><?php echo lang('login_forgot_password');?></a>
<a href="create_user" class="pull-right"><?php echo lang('login_registration');?></a></p>




	  
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
          
		  </div>	
      </div>
  </div>
  </div>