
<div class="container"  style="padding-top:50px;">
	<div class="row">
		<div class="col-lg-12">
                    
                    <h2>TOP RSS Feeds - <?=date('l, F d, Y');?></h2>
                    
                    <div class="container">
                     
                      <div class="col-md-6">
                 
                 <ul class="nav nav-pills nav-stacked">
                        <?
                        foreach ($stat as $key => $value){ ?>
                         
          <li>
            <a href="<?=$value['link'];?>" target="_blank"><?=$value['link'];?><span class="badge pull-right">
                <?=$value['sum(views)'];?>
            </span></a>
          </li>
              
                       <? }
                        
                        ?>
                             
                    
                       
                    
                    
                  </ul>
                  </div>
                 
                 
                    </div>
                    
                    
		</div>
	</div>
</div>