<header class="navbar navbar-inverse navbar-fixed-top wet-asphalt" role="banner">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<?=base_url();?>"><img src="<?=base_url()?>images/logo.png" alt="logo"></a>
            </div>
            <div class="collapse navbar-collapse"  style="padding-bottom: 40px;">
                <ul class="nav navbar-nav navbar-right">
                    
                      
                        
                            
                            
                            
              
                    
               <!--admin nav-->     
           
            <? if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {?>
          
         
           <li <?php if ($this->uri->segment(2) == '') {echo"class='active'";}?>>
        <a href="<?=base_url();?>">Dashboard <span class="glyphicon glyphicon-dashboard"></span></a>
             </li>  
          
          
          
          <li <?php if ($this->uri->segment(2) == 'create_group') {echo"class='active'";}?>>
        <a href="<?=base_url();?>admin/create_group" class="animate">Create new group
					<span class="glyphicon glyphicon-plus-sign"></span>
				</a> <li>
            
        <li <?php if ($this->uri->segment(2) == 'popular_feeds') {echo"class='active'";}?>>
        <a href="<?=base_url();?>admin/popular_feeds" class="animate">Most visited feeds
					<span class="glyphicon glyphicon-info-sign"></span>
				</a> <li>
                                
          <li <?php if ($this->uri->segment(2) == 'create_user') {echo"class='active'";}?>>
        <a href="<?=base_url();?>auth/create_user">Add user <span class=" glyphicon glyphicon-plus-sign"></span></a>
             </li>                       
                                
          <? } ?>
            
            
            <!--user nav-->
             <?php
             $user = $this->session->userdata('user_id');
             
             if ($this->ion_auth->logged_in() && !$this->ion_auth->is_admin()) {?>
        
        
           <li <?php if ($this->uri->segment(2) == '') {echo"class='active'";}?>>
        <a href="<?=base_url();?>"> Home <span class="glyphicon glyphicon-home"></span></a>
             </li> 
            
            
            
       <li <?php if ($this->uri->segment(2) == 'all_feeds') {echo"class='active'";}?>>
       
        <a href="<?=base_url();?>user/all_feeds/<?=$user?>">
        My feeds <span class="glyphicon glyphicon-th-list"></span></a>
        </li>
        
        <li <?php if ($this->uri->segment(2) == 'edit_user') {echo"class='active'";}?>>
        <a href="<?=base_url();?>auth/edit_user/<?=$user;?>"> Edit profile
        <span class="glyphicon glyphicon-user"></span> </a>
        
        </li>
        
        
        <?php } ?>
            
           
           <!--logout--> 
            <?php if ($this->ion_auth->logged_in()) {?>         
       <li>
        <a href="<?=base_url();?>auth/logout">
        Log Out <span class="glyphicon glyphicon-log-out"></span></a>
       </li>
                <?php } ?>
                 
                            
                </ul>                     
                            
                            
                            
               
            </div>
        </div>
    </header><!--/header-->