 <div class="modal-dialog" style="padding-top:50px;">
   
  <div class="modal-content">
      <div class="modal-header">
         
         <h1>Add valid url source</h1>

      </div>
      <div class="modal-body">



<p><?php if (isset($message) && !empty($message))
{ echo "<div class='col-md-12 alert alert-warning' role='alert'>{$message}</div>";}?> </p>


<?php echo form_open('main/new_rss_source',"class='form col-md-12 center-block'");?>

			 <div class="form-group">
	<p>
		 <?php  $data_inp = array('name' => 'rss_feed',
				'id' 		=>  'rss_feed',
				'type' 		=>  'text',
				'placeholder'   =>  'Valid url',
				'class'         =>  'form-control input-lg',
				'value' => $this->form_validation->set_value('rss_feed')
			);  ?>
		<?php echo form_input($data_inp);?>
	</p>

	
	
	

	<p><?php echo form_submit('submit', "Add","class='btn btn-primary btn-md btn-block'");?></p>
			
			 </div>
<?php echo form_close();?>


  </div>
      <div class="modal-footer">
          <div class="col-md-12">
          
		  </div>	
      </div>
  </div>
  </div>