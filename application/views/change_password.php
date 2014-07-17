 <div class="modal-dialog" style="padding-top:50px;">
   
  <div class="modal-content">
      <div class="modal-header">
         
         <h1><?php echo lang('change_password_heading');?></h1>

      </div>
      <div class="modal-body">



<p><?php if (isset($message) && !empty($message))
{ echo "<div class='col-md-12 alert alert-warning' role='alert'>{$message}</div>";}?> </p>



<?php echo form_open("auth/change_password","class='form col-md-12 center-block'");?>
                        
                         <div class="form-group">
      <p>
            <?php echo lang('change_password_old_password_label', 'old_password');?> <br />
            <?php echo form_input($old_password);?>
      </p>

      <p>
            <label for="new_password"><?php echo sprintf(lang('change_password_new_password_label'), $min_password_length);?></label> <br />
            <?php echo form_input($new_password);?>
      </p>

      <p>
            <?php echo lang('change_password_new_password_confirm_label', 'new_password_confirm');?> <br />
            <?php echo form_input($new_password_confirm);?>
      </p>

      <?php echo form_input($user_id);?>
      <p><?php echo form_submit('submit', lang('change_password_submit_btn'),"class='btn btn-primary btn-md btn-block'");?></p>
        </div>

<?php echo form_close();?>


 </div>
      <div class="modal-footer">
          <div class="col-md-12">
          
		  </div>	
      </div>
  </div>
  </div>
