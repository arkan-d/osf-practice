  
    <!-- /.intro-header -->

    <div class="content-section-a">

        <div class="container">

            <div class="row">
                <div class="col-lg-5 col-sm-6">
                    <hr class="section-heading-spacer">
                    <div class="clearfix"></div>
                    <h2 class="section-heading">Death to the Stock Photo:
                        <br>Special Thanks</h2>
                    <p class="lead">A special thanks to Death to the Stock Photo for providing the photographs that you see in this template. <a target="_blank" href="http://join.deathtothestockphoto.com/">Visit their website</a> to become a member.</p>
                </div>
                <div class="col-lg-5 col-lg-offset-2 col-sm-6">
                    <img class="img-responsive" src="<?=base_url();?>img/ipad.png" alt="">
                </div>
            </div>

        </div>
        <!-- /.container -->

    </div>
    <!-- /.content-section-a -->
  
<div class="content-section-b">

        <div class="container">	    
		    
		 <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12">
                   
                    <div class="chat-panel panel panel-default chat-boder chat-panel-head" >
                        <div class="panel-heading">
                            <i class="glyphicon glyphicon-star"></i>
                            Favourites Feeds
                            <div class="btn-group pull-right">
                                
                            </div>
                        </div>

                        <div class="panel-body">
                           
                                <div class="left clearfix">
            <div class="chat-body" style="height: 200px; overflow: scroll;">  
				    
                                                                      
                                       <?php
				foreach ($favourite as $value){ ?>
				<p> 
                                <img src="<?=base_url();?>img/rss.png" width="45" height="30" class="img-circle" />
                                   
				   <a href="<?=base_url();?>user/single_feed/<?=$value['id']?>"><?=$value['link']?></a> </p>
				<?php }
				?>
                                    </div>
                                </div>
				
				
                                
                           
                        </div>

                        <div class="panel-footer">
                           <p> <span class="glyphicon glyphicon-cog"></span> <?php echo anchor('user/edit_feeds/'.$user,"Manage feeds","target='_blank'"); ?> </p>
			   <p><span class="glyphicon glyphicon-user"></span> <?php echo anchor('auth/edit_user/'.$user,"Edit profile"); ?></p>
			   <p><span class="glyphicon glyphicon-plus-sign"></span> <?php echo anchor('user/add_feed/'.$user,"Add Feed"); ?></p>
                        </div>

                    </div>
                    
                </div>
		    
		    <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12">
                   
                    <div class="chat-panel panel panel-default chat-boder chat-panel-head" >
		    </div>
		    
		    
		    </div></div>
		    
		 </div>
	</div>
	
	
	