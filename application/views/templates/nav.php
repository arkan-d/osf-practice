<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<?=base_url();?>">RSS Reader</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse navbar-right navbar-ex1-collapse">
                <ul class="nav navbar-nav">
            
            <?php if ($this->ion_auth->logged_in()) {?>         
       <li><a href="<?=base_url();?>auth/logout"> Log Out <span class="glyphicon glyphicon-log-out"></span></a> </li>
                <?php } ?>
                
          <?php if ($this->ion_auth->is_admin()) {?>
                      
     <li class="<?=($this->uri->segment(1)==='auth')?'active':''?>">
     
     <a href="<?=base_url();?>auth/"> Manage Users <span class="glyphicon glyphicon-cog"></span></a>
     
     </li> <?php } ?>  
 
       
                </ul>
            </div>
         <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
        
    </nav>
