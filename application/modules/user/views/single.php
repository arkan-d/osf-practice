 <div class="container" style="padding-top: 100px;">
           
           <?php if(!isset($rss) || empty($rss)) { ?>
           <p> Here is not feeds !!! </p>
          <?php }
          
          ?>
          
 <?php foreach ($rss as $item){ ?>
 
            <div class="thumbnail col-md-3 col-sm-4">
                
    <div class="caption">
            <h4><a href='<?=$item['link'];?>' target='_blank'><?=$item['title'];?></a></h4>
            <p><?=$item['description'];?></p>
    </div>  
            
            </div> <!-- thumbnail-->
   <?php } ?>
                      
                      
</div>
 
           <div class="container">
            <div class="row">
           <div><?php echo $links; ?></div>
                      </div></div>