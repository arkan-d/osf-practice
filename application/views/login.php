<!--login modal-->


    
       
  <div class="modal-dialog">
   
  <div class="modal-content">
      <div class="modal-header">
         
          <h1 class="text-center">Login</h1>
          <p class="">Notice: for use service, please log in to your account or register.</p>
	  
	 <!-- <div class="alert alert-danger" role="alert">...</div>-->
	 <div> <?=validation_errors();?></div>
      </div>
      <div class="modal-body">
	
         
<?php echo form_open('user_c/','class="form col-md-12 center-block"'); ?> 
            <div class="form-group">
            
		<?php
            $data_format = array(
            'name'          =>  'email',
            'placeholder'   =>  'email',
            'class'         =>  'form-control input-lg',
            'value'         =>  set_value('email')
            );
        echo form_input($data_format);
        ?>
		
            </div>
            <div class="form-group">
            		
		<?php
            $data_format = array(
            'name'          =>  'password',
            'placeholder'   =>  'password',
            'class'         =>  'form-control input-lg',
            'value'         =>  set_value('password')
            );
        echo form_password($data_format);
        ?>
		
            </div>
            <div class="form-group">
	      
	   <?php echo form_submit("","Log In","class='btn btn-primary btn-lg btn-block'"); ?>   
             
      <h4 class="text-center"><a href="#">Register</a></h4>
            </div>
       <?php echo form_close(); ?>
	  
	  
	  
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
          
		  </div>	
      </div>
  </div>
  </div>
  
  
   

