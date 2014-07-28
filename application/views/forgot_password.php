 <section id="title" class="emerald">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                   <h1><?php echo lang('forgot_password_heading');?></h1>
<p><?php echo sprintf(lang('forgot_password_subheading'), $identity_label);?></p>
                </div>
                
            </div>
        </div>
    </section><!--/#title-->    
 
 
 
 <div class="modal-dialog" >
   
  <div class="modal-content">
     
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
   <p><a href="<?=base_url();?>" class='btn btn-primary btn-md btn-block'> <span class=' glyphicon glyphicon-remove'></span> Cancel</a> </p> 
<?php echo form_close();?>


  
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
          
		  </div>	
      </div>
  </div>
  </div>