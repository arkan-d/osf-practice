<section id="title" class="emerald">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
               <h1><?php echo lang('create_user_heading');?></h1>
            <p><?php echo lang('create_user_subheading');?></p>
                </div>
                
            </div>
        </div>
    </section><!--/#title-->    



 <div class="modal-dialog">
   
  <div class="modal-content">
      <div class="modal-header">
         

      </div>
      <div class="modal-body">
	

<p><?php if (isset($message) && !empty($message))
{ echo "<div class='col-md-12 alert alert-warning' role='alert'>{$message}</div>";}?> </p>


<?php echo form_open("auth/create_user","class='form col-md-12 center-block'");?>

                  <div class="form-group">
      <p>
            <?php echo lang('create_user_fname_label', 'first_name');?> <br />
            <?php echo form_input($first_name);?>
                  
      </p>
               
      <p>
            <?php echo lang('create_user_lname_label', 'last_name');?> <br />
            <?php echo form_input($last_name);?>
      </p>

     

      <p>
            <?php echo lang('create_user_email_label', 'email');?> <br />
            <?php echo form_input($email);?>
      </p>
      

      <p>
            <?php echo lang('create_user_password_label', 'password');?> <br />
            <?php echo form_input($password);?>
      </p>

      <p>
            <?php echo lang('create_user_password_confirm_label', 'password_confirm');?> <br />
            <?php echo form_input($password_confirm);?>
      </p>


      <p><?php echo form_submit('submit', lang('create_user_submit_btn'),"class='btn btn-primary btn-md btn-block'");?></p>
       <p><button type='button' onclick="history.back()" class='btn btn-primary btn-md btn-block'><span class=' glyphicon glyphicon-remove'></span> Cancel</button> </p> 
                  </div>

<?php echo form_close();?>


	  
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
          
		  </div>	
      </div>
  </div>
  </div>
