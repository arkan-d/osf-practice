
<section id="title" class="emerald">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
               <h1>TOP RSS Feeds: </h1>
	       <p><?=date('l, F d, Y');?> </p>
                </div>
                
            </div>
        </div>
    </section><!--/#title-->
    
<div class="container"  style="padding-top:50px;">
	<div class="row">
		<div class="col-lg-12">
                    
                    
                    
                    <div class="container">
                     
                      <div class="col-md-6">
                 
                 <ol class="nav nav-pills nav-stacked">
                
		      
		        <?
                        foreach ($stat as $key => $value){ ?>
                         
          <li>
            <a href="<?=$value['link'];?>" target="_blank"><?=$value['link'];?><span class="badge pull-right">
                <?=$value['sum(views)'];?>
            </span></a>
          </li>
              
                       <? }
                        
                        ?>
                             
                    
                       
		      
		      
                  </ol>
                  </div>
                 
                 
                    </div>
                    
                    
		</div>
	</div>
</div>