
 <div class="modal-dialog" style="padding-top:50px;">
   
  <div class="modal-content">
      <div class="modal-header">
         
          
<h1><?php echo lang('edit_group_heading');?></h1>
<p><?php echo lang('edit_group_subheading');?></p>

      </div>
      <div class="modal-body">
	

<p><?php if (isset($message) && !empty($message))
{ echo "<div class='col-md-12 alert alert-warning' role='alert'>{$message}</div>";}?> </p>



<?php echo form_open(current_url(),"class='form col-md-12 center-block'");?>
                        
                        <div class="form-group">
      <p>
            <?php echo lang('edit_group_name_label', 'group_name');?> <br />
            <?php echo form_input($group_name);?>
      </p>

      <p>
            <?php echo lang('edit_group_desc_label', 'description');?> <br />
            <?php echo form_input($group_description);?>
      </p>

      <p><?php echo form_submit('submit', lang('edit_group_submit_btn'),"class='btn btn-primary btn-md btn-block'");?></p>
                        </div>
<?php echo form_close();?>



	  
      </div>
      <div class="modal-footer">
          <div class="col-md-12">
          
		  </div>	
      </div>
  </div>
  </div>
