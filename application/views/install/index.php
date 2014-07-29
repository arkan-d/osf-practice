
<section id="title" class="emerald">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
              
          <h1>Database Information</h1>
                </div>
                
            </div>
        </div>
    </section><!--/#title-->


 <div class="modal-dialog" style="padding-top:50px;">
   
  <div class="modal-content">
      
      <div class="modal-body">
	

<p><?php if (isset($msg) && !empty($msg))
{ echo "<div class='col-md-12 alert alert-warning' role='alert'>{$msg}</div>";}?> </p>



<?php 
  echo form_open('install/start',"class='form col-md-12 center-block'");
?>

<?php 			
	if (!$database_connected)
	{
?>
		<div class="form-group">
	<p>		
    	<?=form_label('Host', 'host')?>
	<?=form_input(array('class' => 'form-control input-lg', 'placeholder'=>'Host', 'name' => 'host', 'id' => 'host','value' => set_value("host")))?>
	</p>
	<div class="form-group">
	<p>
    	<?=form_label('Database', 'database')?>
	<?=form_input(array('class' => 'form-control input-lg', 'placeholder'=>'Database','name' => 'database', 'id' => 'database','value' => set_value("database")))?>
	</p>
	</div>
	
	<div class="form-group">
	<p>	
    	<?=form_label('User', 'user')?>
	<?=form_input(array('class' => 'form-control input-lg', 'placeholder'=>'Database User','name' => 'user', 'id' => 'user','value' => set_value("user")))?>
	</p>
	</div>
	
	<div class="form-group">
    	<p><?=form_label('Password', 'password')?>	
	<?=form_input(array('class' => 'form-control input-lg', 'placeholder'=>'User password','name' => 'password', 'id' => 'password','value' => set_value("password")))?>
	</p>
	
    	
		
		
		

		
	<?php } ?> 
	
	<p><?php echo form_submit('submit',"submit","class='btn btn-primary btn-md btn-block'");?></p>		
    
	
		</div>
    <?=form_close()?>
  
      </div>
      <div class="modal-footer">
          	
      </div>
      </div>
  </div>
  </div>