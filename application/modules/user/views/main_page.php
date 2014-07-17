  
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
                            <ul class="chat-box">
                                <li class="left clearfix">
                                    <?php
				foreach ($favourite as $value){ ?>
				    <span class="chat-img pull-left">
                                <img src="<?=$value['thumbnail']?>"  class="img-circle" />
                                    </span>
                                    <div class="chat-body">                                     
                                         
				   <p> <a href="<?=base_url();?>user/single_feed/<?=$value['id']?>" target="_blank"><?=$value['link']?></a> </p>
				<?php }
				?>
                                    </div>
                                </li>
				
				
                                
                            </ul>
                        </div>

                        <div class="panel-footer">
                           <p> <?php echo anchor('user/edit_feeds/'.$user,"Manage feeds","target='_blank'"); ?> </p>
			   <p> <?php echo anchor('auth/edit_user/'.$user,"Edit profile"); ?></p>
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
	
	
	