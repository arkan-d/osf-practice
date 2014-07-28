<section id="title" class="emerald">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
               <h1><?php echo lang('deactivate_heading');?></h1>
<p><?php echo sprintf(lang('deactivate_subheading'), $user->username);?></p>
                </div>
                
            </div>
        </div>
    </section><!--/#title-->    



 <div class="modal-dialog" style="padding-top:50px;">
   
  <div class="modal-content">
      
      <div class="modal-body">
	




<?php echo form_open("admin/deactivate/".$user->id,"class='form col-md-12 center-block'");?>
			      
			      <div class="form-group">
  <p>
  	<?php echo lang('deactivate_confirm_y_label', 'confirm');?>
    <input type="radio" name="confirm" value="yes" checked="checked" />
    <?php echo lang('deactivate_confirm_n_label', 'confirm');?>
    <input type="radio" name="confirm" value="no" />
  </p>

  <?php echo form_hidden($csrf); ?>
  <?php echo form_hidden(array('id'=>$user->id)); ?>

  <p><?php echo form_submit('submit', lang('deactivate_submit_btn'),"class='btn btn-primary btn-md btn-block'");?></p>
			      </div>
<?php echo form_close();?>



  
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
          
		  </div>	
      </div>
  </div>
  </div>