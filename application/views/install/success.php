
	
 <div class="modal-dialog" style="padding-top:50px;">
   
  <div class="modal-content">
      <div class="modal-header">
         
          <h2>Installed!</h2>
	<p>That was all</p>
	
      </div>
      <div class="modal-body">
	


	
	
	
	<ul>
		<?php foreach($messages as $message): ?>
			<li><?=$message?></li>
		<?php endforeach; ?>
	</ul>

	<p> <a href='<?=base_url();?>'> Go to site </a> </p>
	
	
	</div>
      <div class="modal-footer">
          <div class="col-md-12">
          
		  </div>	
      </div>
  </div>
  </div>