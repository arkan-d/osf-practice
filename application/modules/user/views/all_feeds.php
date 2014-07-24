 <div class="container" style="padding-top: 100px;">
           
           
          <?php if(!isset($feeds) || empty($feeds)) { ?>
           <p> Here is not feeds !!! </p>
          <?php }
          
          ?>
                                 <?php
				foreach ($feeds as $value){ ?>
				<p> 
                                <img src="<?=base_url();?>img/rss.png" width="45" height="30" class="img-circle" />
                                   
				   <a href="<?=base_url();?>user/single_feed/<?=$value['id']?>"><?=$value['link']?></a> </p>
				</p> <p><?=$value['description']?></p>
                                
                                <?php }
				?>
                      
                      
</div>
 
         